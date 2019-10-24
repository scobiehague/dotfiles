Vim�UnDo� ��#�(���D���ĸ�CX�^���jҁS����   �                                 ]u�   
 _�                     F   5    ����                                                                                                                                                                                                                                                                                                                                                             ]U�g    �   F   �   H    �   F   G   H    5�_�                    6       ����                                                                                                                                                                                                                                                                                                                                                             ]Wl�     �   5   7   �      x      :command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'5�_�                    7       ����                                                                                                                                                                                                                                                                                                                                                             ]Wl�    �   6   8   �      �      :command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'5�_�                    3        ����                                                                                                                                                                                                                                                                                                                                                             ]Xa�    �   3   5   �        " Convert text�   2   5   �            �   2   4   �    5�_�                            ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tX�     �               �   " sdothum - 2016 (c) wtfpl       " Edit   �" ══════════════════════════════════════════════════════════════════════════════       P  " Line _______________________________________________________________________       P    " .............................................................. Insert line       I      " insert line while disabling auto-commenting OR break (prose) line         function! s:smartWrap()   H        if Prose()  " override Pencil mode (the default state for prose)             set paste   "          execute "normal! i\<CR>"             set nopaste             execute 'startinsert'   5        else  " append EOL wrap from any col position   I          let l:formatoptions = &formatoptions  " disable auto commenting             set formatoptions-=c             set formatoptions-=r             set formatoptions-=o             normal! ^             let l:pos = col('.')             normal! o   "          " align line indentation   2          execute 'normal! a' . repeat(' ', l:pos)   .          let &formatoptions = l:formatoptions           endif         endfunction       6      command! SmartWrap silent! call <SID>smartWrap()       P    " ......................................................... Strip whitespace       c      " strips trailing whitespace from all lines, see https://dougblack.io/words/a-good-vimrc.html   ,      function! s:stripTrailingWhitespaces()   -        if &modifiable == 1 && ! s:markdown()   >          " let l:_s = @/ " save last search & cursor position              " let l:l  = line(".")             " let l:c  = col(".")   $          let s:view = winsaveview()   %          %s/\s\+$//e           " EOL   %          %s/\(\n\r\?\)\+\%$//e " EOF   "          call winrestview(s:view)             " let @/ = l:_s   !          " call cursor(l:l, l:c)           endif         endfunction       T      command! StripTrailingWhitespaces silent! call <SID>stripTrailingWhitespaces()       P  " Convert text _______________________________________________________________       P    " ............................................................. Convert tabs       w      command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'   �      command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'       P    " .......................................................... Code block text       5      " convert wiki text lines into code block lines         function! s:codeBlock()   9        execute "silent! normal  :s/\\(.*\\)/`\\1`/\<CR>"   4        " preserve leading spaces with wiki markdown   4        execute "silent! normal! gv:s/^` /`^ /\<CR>"   6        execute "silent! normal! gv:s/^``/`^ `/e\<CR>"   :        " convert [[test]], see thedarnedestthing markdown   <        execute "silent! normal! gv:s/ \\[\\[ / [[] /e\<CR>"   <        execute "silent! normal! gv:s/ \\]\\] / []] /e\<CR>"         endfunction       6      command! CodeBlock silent! call <SID>codeBlock()       P  " Text shift _________________________________________________________________       P    " .............................................................. Select text       "      function! s:paragraphAbove()           if NonBlankLine             normal! {             if BlankLine()               normal! j             endif           endif           normal! }kV{         endfunction             @      command! ParagraphAbove silent! call <SID>paragraphAbove()       "      function! s:paragraphBelow()           if NonBlankLine             normal! }             if BlankLine()               normal! k             endif           endif           normal! {jV}         endfunction             @      command! ParagraphBelow silent! call <SID>paragraphBelow()       P    " ............................................................ Shift up down       5      " see https://github.com/gorkunov/vimconfig.git   0      function! s:moveLineOrVisualUpOrDown(move)            let l:col = virtcol('.')   #        execute 'silent! ' . a:move   (        execute 'normal! ' . l:col . '|'         endfunction       8      function! s:moveLineOrVisualUp(line_getter, range)   (        let l:line = line(a:line_getter)   7        if l:line - v:count1 - 1 < 0 | let l:move = '0'   a        else                         | let l:move = a:line_getter . ' -' . (v:count1 + 1) | endif   C        call s:moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)         endfunction       :      function! s:moveLineOrVisualDown(line_getter, range)   (        let l:line = line(a:line_getter)   ;        if l:line + v:count1 > line('$') | let l:move = '$'   _        else                             | let l:move = a:line_getter . ' +' . v:count1 | endif   C        call s:moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)         endfunction             function! s:moveLineUp()   *        call s:moveLineOrVisualUp('.', '')         endfunction             8      command! MoveLineUp silent! call <SID>moveLineUp()              function! s:moveLineDown()   ,        call s:moveLineOrVisualDown('.', '')         endfunction             <      command! MoveLineDown silent! call <SID>moveLineDown()              function! s:moveVisualUp()   0        call s:moveLineOrVisualUp("'<", "'<,'>")           normal! gv         endfunction             <      command! MoveVisualUp silent! call <SID>moveVisualUp()       "      function! s:moveVisualDown()   2        call s:moveLineOrVisualDown("'>", "'<,'>")           normal! gv         endfunction             @      command! MoveVisualDown silent! call <SID>moveVisualDown()       
" edit.vim5�_�                           ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tX�     �         �      N" Line _______________________________________________________________________5�_�                           ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tX�     �      	   �      N  " .............................................................. Insert line�      	   �    5�_�      	              !       ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tX�    �       "   �      N  " ......................................................... Strip whitespace�   !   "   �    5�_�      
           	   4       ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tX�     �   3   5   �      N" Convert text _______________________________________________________________5�_�   	              
   6       ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tX�     �   5   7   �      N  " ............................................................. Convert tabs�   6   7   �    5�_�   
                 ;       ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tY     �   :   <   �      N  " .......................................................... Code block text�   ;   <   �    5�_�                    J       ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tY	     �   I   K   �      N" Text shift _________________________________________________________________5�_�                    L       ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tY     �   K   M   �      N  " .............................................................. Select text�   L   M   �    5�_�                    f       ����                                                                                                                                                                                                                                                                                                                                       �           V        ]tY    �   e   g   �      N  " ............................................................ Shift up down�   f   g   �    5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                             ]tp�    �   �   �          >    command! MoveVisualDown silent! call <SID>moveVisualDown()�   �   �                �   �   �              endfunction�   �   �                normal! gv�   �   �          0      call s:moveLineOrVisualDown("'>", "'<,'>")�   �   �               function! s:moveVisualDown()�   �   �          :    command! MoveVisualUp silent! call <SID>moveVisualUp()�   �   �                �   �   �              endfunction�   �   �                normal! gv�   �   �          .      call s:moveLineOrVisualUp("'<", "'<,'>")�   �   �              function! s:moveVisualUp()�   �   �          :    command! MoveLineDown silent! call <SID>moveLineDown()�   �   �                �   �   �              endfunction�   �   �          *      call s:moveLineOrVisualDown('.', '')�   �   �              function! s:moveLineDown()�   �   �          6    command! MoveLineUp silent! call <SID>moveLineUp()�      �                �   ~   �              endfunction�   }             (      call s:moveLineOrVisualUp('.', '')�   |   ~              function! s:moveLineUp()�   z   |              endfunction�   y   {          A      call s:moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)�   x   z          ]      else                             | let l:move = a:line_getter . ' +' . v:count1 | endif�   w   y          9      if l:line + v:count1 > line('$') | let l:move = '$'�   v   x          &      let l:line = line(a:line_getter)�   u   w          8    function! s:moveLineOrVisualDown(line_getter, range)�   s   u              endfunction�   r   t          A      call s:moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)�   q   s          _      else                         | let l:move = a:line_getter . ' -' . (v:count1 + 1) | endif�   p   r          5      if l:line - v:count1 - 1 < 0 | let l:move = '0'�   o   q          &      let l:line = line(a:line_getter)�   n   p          6    function! s:moveLineOrVisualUp(line_getter, range)�   l   n              endfunction�   k   m          &      execute 'normal! ' . l:col . '|'�   j   l          !      execute 'silent! ' . a:move�   i   k                let l:col = virtcol('.')�   h   j          .    function! s:moveLineOrVisualUpOrDown(move)�   g   i          3    " see https://github.com/gorkunov/vimconfig.git�   c   e          >    command! ParagraphBelow silent! call <SID>paragraphBelow()�   b   d                �   a   c              endfunction�   `   b                normal! {jV}�   _   a                endif�   ^   `                  endif�   ]   _                    normal! k�   \   ^                  if BlankLine()�   [   ]                  normal! }�   Z   \                if NonBlankLine�   Y   [               function! s:paragraphBelow()�   W   Y          >    command! ParagraphAbove silent! call <SID>paragraphAbove()�   V   X                �   U   W              endfunction�   T   V                normal! }kV{�   S   U                endif�   R   T                  endif�   Q   S                    normal! j�   P   R                  if BlankLine()�   O   Q                  normal! {�   N   P                if NonBlankLine�   M   O               function! s:paragraphAbove()�   G   I          4    command! CodeBlock silent! call <SID>codeBlock()�   E   G              endfunction�   D   F          :      execute "silent! normal! gv:s/ \\]\\] / []] /e\<CR>"�   C   E          :      execute "silent! normal! gv:s/ \\[\\[ / [[] /e\<CR>"�   B   D          8      " convert [[test]], see thedarnedestthing markdown�   A   C          4      execute "silent! normal! gv:s/^``/`^ `/e\<CR>"�   @   B          2      execute "silent! normal! gv:s/^` /`^ /\<CR>"�   ?   A          2      " preserve leading spaces with wiki markdown�   >   @          7      execute "silent! normal  :s/\\(.*\\)/`\\1`/\<CR>"�   =   ?              function! s:codeBlock()�   <   >          3    " convert wiki text lines into code block lines�   8   :          �    command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'�   7   9          u    command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'�   1   3          R    command! StripTrailingWhitespaces silent! call <SID>stripTrailingWhitespaces()�   /   1              endfunction�   .   0                endif�   -   /                  " call cursor(l:l, l:c)�   ,   .                  " let @/ = l:_s�   +   -                   call winrestview(s:view)�   *   ,          #        %s/\(\n\r\?\)\+\%$//e " EOF�   )   +          #        %s/\s\+$//e           " EOL�   (   *          "        let s:view = winsaveview()�   '   )                  " let l:c  = col(".")�   &   (                  " let l:l  = line(".")�   %   '          <        " let l:_s = @/ " save last search & cursor position�   $   &          +      if &modifiable == 1 && ! s:markdown()�   #   %          *    function! s:stripTrailingWhitespaces()�   "   $          a    " strips trailing whitespace from all lines, see https://dougblack.io/words/a-good-vimrc.html�                 4    command! SmartWrap silent! call <SID>smartWrap()�                    endfunction�                      endif�                ,        let &formatoptions = l:formatoptions�                0        execute 'normal! a' . repeat(' ', l:pos)�                         " align line indentation�                        normal! o�                        let l:pos = col('.')�                        normal! ^�                        set formatoptions-=o�                        set formatoptions-=r�                        set formatoptions-=c�                G        let l:formatoptions = &formatoptions  " disable auto commenting�                3      else  " append EOL wrap from any col position�                        execute 'startinsert'�                        set nopaste�                         execute "normal! i\<CR>"�                        set paste�                F      if Prose()  " override Pencil mode (the default state for prose)�   
                 function! s:smartWrap()�   	             G    " insert line while disabling auto-commenting OR break (prose) line5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ]t��     �   �   �          <  command! MoveVisualDown silent! call <SID>moveVisualDown()�   �   �              �   �   �            endfunction�   �   �              normal! gv�   �   �          .    call s:moveLineOrVisualDown("'>", "'<,'>")�   �   �            function! s:moveVisualDown()�   �   �          8  command! MoveVisualUp silent! call <SID>moveVisualUp()�   �   �              �   �   �            endfunction�   �   �              normal! gv�   �   �          ,    call s:moveLineOrVisualUp("'<", "'<,'>")�   �   �            function! s:moveVisualUp()�   �   �          8  command! MoveLineDown silent! call <SID>moveLineDown()�   �   �              �   �   �            endfunction�   �   �          (    call s:moveLineOrVisualDown('.', '')�   �   �            function! s:moveLineDown()�   �   �          4  command! MoveLineUp silent! call <SID>moveLineUp()�      �              �   ~   �            endfunction�   }             &    call s:moveLineOrVisualUp('.', '')�   |   ~            function! s:moveLineUp()�   z   |            endfunction�   y   {          ?    call s:moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)�   x   z          [    else                             | let l:move = a:line_getter . ' +' . v:count1 | endif�   w   y          7    if l:line + v:count1 > line('$') | let l:move = '$'�   v   x          $    let l:line = line(a:line_getter)�   u   w          6  function! s:moveLineOrVisualDown(line_getter, range)�   s   u            endfunction�   r   t          ?    call s:moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)�   q   s          ]    else                         | let l:move = a:line_getter . ' -' . (v:count1 + 1) | endif�   p   r          3    if l:line - v:count1 - 1 < 0 | let l:move = '0'�   o   q          $    let l:line = line(a:line_getter)�   n   p          4  function! s:moveLineOrVisualUp(line_getter, range)�   l   n            endfunction�   k   m          $    execute 'normal! ' . l:col . '|'�   j   l              execute 'silent! ' . a:move�   i   k              let l:col = virtcol('.')�   h   j          ,  function! s:moveLineOrVisualUpOrDown(move)�   g   i          1  " see https://github.com/gorkunov/vimconfig.git�   e   g          P  " .............................................................. Shift up down�   c   e          <  command! ParagraphBelow silent! call <SID>paragraphBelow()�   b   d              �   a   c            endfunction�   `   b              normal! {jV}�   _   a          	    endif�   ^   `                endif�   ]   _                  normal! k�   \   ^                if BlankLine()�   [   ]                normal! }�   Z   \              if NonBlankLine�   Y   [            function! s:paragraphBelow()�   W   Y          <  command! ParagraphAbove silent! call <SID>paragraphAbove()�   V   X              �   U   W            endfunction�   T   V              normal! }kV{�   S   U          	    endif�   R   T                endif�   Q   S                  normal! j�   P   R                if BlankLine()�   O   Q                normal! {�   N   P              if NonBlankLine�   M   O            function! s:paragraphAbove()�   K   M          P  " ................................................................ Select text�   G   I          2  command! CodeBlock silent! call <SID>codeBlock()�   E   G            endfunction�   D   F          8    execute "silent! normal! gv:s/ \\]\\] / []] /e\<CR>"�   C   E          8    execute "silent! normal! gv:s/ \\[\\[ / [[] /e\<CR>"�   B   D          6    " convert [[test]], see thedarnedestthing markdown�   A   C          2    execute "silent! normal! gv:s/^``/`^ `/e\<CR>"�   @   B          0    execute "silent! normal! gv:s/^` /`^ /\<CR>"�   ?   A          0    " preserve leading spaces with wiki markdown�   >   @          5    execute "silent! normal  :s/\\(.*\\)/`\\1`/\<CR>"�   =   ?            function! s:codeBlock()�   <   >          1  " convert wiki text lines into code block lines�   :   <          P  " ............................................................ Code block text�   8   :          �  command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'�   7   9          s  command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'�   5   7          P  " ............................................................... Convert tabs�   1   3          P  command! StripTrailingWhitespaces silent! call <SID>stripTrailingWhitespaces()�   /   1            endfunction�   .   0          	    endif�   -   /                " call cursor(l:l, l:c)�   ,   .                " let @/ = l:_s�   +   -                call winrestview(s:view)�   *   ,          !      %s/\(\n\r\?\)\+\%$//e " EOF�   )   +          !      %s/\s\+$//e           " EOL�   (   *                 let s:view = winsaveview()�   '   )                " let l:c  = col(".")�   &   (                " let l:l  = line(".")�   %   '          :      " let l:_s = @/ " save last search & cursor position�   $   &          )    if &modifiable == 1 && ! s:markdown()�   #   %          (  function! s:stripTrailingWhitespaces()�   "   $          _  " strips trailing whitespace from all lines, see https://dougblack.io/words/a-good-vimrc.html�       "          P  " ........................................................... Strip whitespace�                 2  command! SmartWrap silent! call <SID>smartWrap()�                  endfunction�                	    endif�                *      let &formatoptions = l:formatoptions�                .      execute 'normal! a' . repeat(' ', l:pos)�                      " align line indentation�                      normal! o�                      let l:pos = col('.')�                      normal! ^�                      set formatoptions-=o�                      set formatoptions-=r�                      set formatoptions-=c�                E      let l:formatoptions = &formatoptions  " disable auto commenting�                1    else  " append EOL wrap from any col position�                      execute 'startinsert'�                      set nopaste�                      execute "normal! i\<CR>"�                      set paste�                D    if Prose()  " override Pencil mode (the default state for prose)�   
               function! s:smartWrap()�   	             E  " insert line while disabling auto-commenting OR break (prose) line�      	          P  " ................................................................ Insert line5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ]t��    �   e   g          N" .............................................................. Shift up down�   K   M          N" ................................................................ Select text�   :   <          N" ............................................................ Code block text�   5   7          N" ............................................................... Convert tabs�       "          N" ........................................................... Strip whitespace�      	          N" ................................................................ Insert line5�_�                    	        ����                                                                                                                                                                                                                                                                                                                                                             ]u    
 �   a   b           �   H   I           �   8   9           �   4   5           �       !           �      	           5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             ]u�   	 �   
             @if Prose()  " override Pencil mode (the default state for prose)�                  set paste�                  execute "normal! i\<CR>"�                  set nopaste�                  execute 'startinsert'�                -else  " append EOL wrap from any col position�                A  let l:formatoptions = &formatoptions  " disable auto commenting�                  set formatoptions-=c�                  set formatoptions-=r�                  set formatoptions-=o�                  normal! ^�                  let l:pos = col('.')�                  normal! o�                  " align line indentation�                *  execute 'normal! a' . repeat(' ', l:pos)�                &  let &formatoptions = l:formatoptions�                endif�   "   $          %if &modifiable == 1 && ! s:markdown()�   #   %          6  " let l:_s = @/ " save last search & cursor position�   $   &            " let l:l  = line(".")�   %   '            " let l:c  = col(".")�   &   (            let s:view = winsaveview()�   '   )            %s/\s\+$//e           " EOL�   (   *            %s/\(\n\r\?\)\+\%$//e " EOF�   )   +            call winrestview(s:view)�   *   ,            " let @/ = l:_s�   +   -            " call cursor(l:l, l:c)�   ,   .          endif�   :   <          1execute "silent! normal  :s/\\(.*\\)/`\\1`/\<CR>"�   ;   =          ," preserve leading spaces with wiki markdown�   <   >          ,execute "silent! normal! gv:s/^` /`^ /\<CR>"�   =   ?          .execute "silent! normal! gv:s/^``/`^ `/e\<CR>"�   >   @          2" convert [[test]], see thedarnedestthing markdown�   ?   A          4execute "silent! normal! gv:s/ \\[\\[ / [[] /e\<CR>"�   @   B          4execute "silent! normal! gv:s/ \\]\\] / []] /e\<CR>"�   I   K          if NonBlankLine�   J   L            normal! {�   K   M            if BlankLine()�   L   N              normal! j�   M   O            endif�   N   P          endif�   O   Q          normal! }kV{�   Q   S           �   U   W          if NonBlankLine�   V   X            normal! }�   W   Y            if BlankLine()�   X   Z              normal! k�   Y   [            endif�   Z   \          endif�   [   ]          normal! {jV}�   ]   _           �   c   e          let l:col = virtcol('.')�   d   f          execute 'silent! ' . a:move�   e   g           execute 'normal! ' . l:col . '|'�   i   k           let l:line = line(a:line_getter)�   j   l          /if l:line - v:count1 - 1 < 0 | let l:move = '0'�   k   m          Yelse                         | let l:move = a:line_getter . ' -' . (v:count1 + 1) | endif�   l   n          ;call s:moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)�   p   r           let l:line = line(a:line_getter)�   q   s          3if l:line + v:count1 > line('$') | let l:move = '$'�   r   t          Welse                             | let l:move = a:line_getter . ' +' . v:count1 | endif�   s   u          ;call s:moveLineOrVisualUpOrDown(a:range . 'move ' . l:move)�   w   y          "call s:moveLineOrVisualUp('.', '')�   y   {           �   }             $call s:moveLineOrVisualDown('.', '')�      �           �   �   �          (call s:moveLineOrVisualUp("'<", "'<,'>")�   �   �          
normal! gv�   �   �           �   �   �          *call s:moveLineOrVisualDown("'>", "'<,'>")�   �   �          
normal! gv�   �   �           5��