# include <iostream>
# include <vector>
# include <algorithm>

# include "log.hh"
# include "action.hh"
# include "db.hh"

# include "utils/vector_utils.hh"

# include "tag_action.hh"
# include "difftag_action.hh"


using namespace std;

namespace Astroid {
  DiffTagAction * DiffTagAction::create (vector<refptr<NotmuchTaggable>> nmts, ustring diff_str) {

    log << "difftag: parsing: " << diff_str << endl;

    if (diff_str.find_first_of (",") != ustring::npos) {
      log << error << "difftag: ',' not allowed, use ' ' to separate tags" << endl;
      return NULL;
    }

    /* parse diff_str */
    vector<ustring> tags = VectorUtils::split_and_trim (diff_str, " ");

    vector<ustring> remove;
    vector<ustring> add;

    for (auto &t : tags) {
      if (t[0] == '-') {
        t = t.substr (1, ustring::npos);
        remove.push_back (t);
      } else if (t[0] == '+') {
        t = t.substr (1, ustring::npos);
        add.push_back (t);
      } else {
        /* no + or - means + */
        add.push_back (t);
      }
    }

    log << debug << "difftag: adding: ";
    for_each (add.begin(),
              add.end(),
              [&](ustring t) {
                log << t << ", ";
              });

    log << ", removing: ";
    for_each (remove.begin(),
              remove.end(),
              [&](ustring t) {
                log << t << ", ";
              });

    log << endl;

    if (remove.empty () && add.empty ()) {
      log << debug << "difftag: nothing to do." << endl;
      return NULL;
    }

    return (new DiffTagAction (nmts, add, remove));
  }

  DiffTagAction::DiffTagAction (
      vector<refptr<NotmuchTaggable>> nmts,
      vector<ustring> _add,
      vector<ustring> _rem)
  : TagAction(nmts)
  {
    add     = _add;
    remove  = _rem;

    sort (add.begin (), add.end ());
    sort (remove.begin (), remove.end ());

    for (auto &t : nmts) {
      TaggableAction ta;
      ta.taggable = t;

      /* find tags need to be removed */
      set_intersection (remove.begin (),
                        remove.end (),
                        t->tags.begin (),
                        t->tags.end (),
                        std::back_inserter (ta.remove));

      /* find tags that should be added */
      set_difference (add.begin (),
                      add.end (),
                      t->tags.begin (),
                      t->tags.end (),
                      std::back_inserter (ta.add));

      if (!ta.add.empty () || !ta.remove.empty ()) {
        taggable_actions.push_back (ta);
      }
    }
  }

  bool DiffTagAction::doit (Db * db) {
    bool res = true;

    for (auto &ta : taggable_actions) {
      for (auto &t : ta.add) {
        res &= ta.taggable->add_tag (db, t);
      }

      for (auto &t : ta.remove) {
        res &= ta.taggable->remove_tag (db, t);
      }
    }

    return res;
  }

  bool DiffTagAction::undo (Db * db) {
    bool res = true;

    for (auto &ta : taggable_actions) {
      for (auto &t : ta.add) {
        res &= ta.taggable->remove_tag (db, t);
      }

      for (auto &t : ta.remove) {
        res &= ta.taggable->add_tag (db, t);
      }
    }

    return res;
  }
}

