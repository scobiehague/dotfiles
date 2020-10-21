
// const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

// .................................................. Symbols / Navigation Layer

  [_SYMGUI] = KEYMAP(
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
       __x__  ,   ___   , TD_DOT  , KC_ASTR , KC_AMPR , KC_PLUS ,                      KC_G    , KC_D    , KC_N    , KC_M    , KC_Z    ,  __x__  ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
       __x__  , OS_GUI  , HS_LT   , TD_PERC , HS_GT   , KC_AT   ,                      KC_C    , HOME_T  , HOME_R  , HOME_S  , HOME_V  ,  __x__  ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
       __x__  ,   ___   , KC_EXLM , KC_QUES , KC_SLSH , KC_PIPE ,                      KC_B    , KC_P    , KC_L    , KC_F    , KC_X    ,  __x__  ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
                                              KC_ESC  , TD_EQL  , KC_BSLS ,    ___   ,  __x__  ,   ___   
  //                                         ---------+---------+---------  ---------+---------+---------         Right hand mod_roll()
  ),


// ................................................................. Regex Layer

  [_REGEX] = KEYMAP(
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
       __x__  , TD_COLN , KC_Y    , KC_O    , KC_U    , KC_MINS ,                      TD_ASTR , KC_LBRC , KC_CIRC , KC_RBRC ,   ___   ,  __x__  ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
       __x__  , HOME_Q  , HOME_H  , HOME_E  , HOME_A  , KC_W    ,                      KC_QUES , KC_LPRN , KC_DLR ,  KC_RPRN , OS_GUI  ,  __x__  ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
       __x__  , KC_J    , KC_COMM , KC_DOT  , KC_K    , KC_QUOT ,                      KC_PIPE , KC_LCBR , KC_HASH , KC_RCBR ,   ___   ,  __x__  ,
  // ---------+---------+---------+---------+---------+---------                      ---------+---------+---------+---------+---------+--------- 
                                                ___   ,  __x__  ,   ___   ,  KC_ENT  , KC_BSLS , KC_DEL 
  // Left hand mod_roll()                    ---------+---------+---------  ---------+---------+--------- 
  ),