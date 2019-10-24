Vim�UnDo� ��Nϟ;w7�r����x֌|	����Y83�   t                                  ]u     _�                       0    ����                                                                                                                                                                                                                                                                                                                                                             ]U��    �         x      <      let s:delay = '200m'  " redraw delay, see theme#Font()5�_�      	                     ����                                                                                                                                                                                                                                                                                                                               0          4       v   4    ]V�     �                9      let s:delay = '200m'  " redraw delay, see ui#Font()5�_�      
           	   *        ����                                                                                                                                                                                                                                                                                                                               0          4       v   4    ]V�     �   )   +          4      " toggle colorcolumn modes, see theme#Indent()5�_�   	              
   B        ����                                                                                                                                                                                                                                                                                                                               0          4       v   4    ]V�   	 �   A   C          9      " highlight wrapped line portion, see theme#Theme()5�_�   
                 *        ����                                                                                                                                                                                                                                                                                                                                                             ]V	,     �   )   +          4      " toggle colorcolumn modes, see theme:Indent()5�_�                    8        ����                                                                                                                                                                                                                                                                                                                                                             ]V	.   
 �   7   9                  Indent5�_�                    X        ����                                                                                                                                                                                                                                                                                                                            X           b   '       v   '    ]Xb�    �   W   X              P    " ............................................................. Line numbers       <      " toggle relative number, line number and no numbering          function! s:toggleNumber()   L        if (&relativenumber == 1 && &number == 1)     | set norelativenumber   D        elseif (&relativenumber == 0 && &number == 1) | set nonumber   _        else                                          | set relativenumber | set number | endif         endfunction       <      command! ToggleNumber silent! call <SID>toggleNumber()5�_�                    "        ����                                                                                                                                                                                                                                                                                                                            X           X   '       v   '    ]Xb�    �   "   .   m    �   "   #   m    5�_�                    H        ����                                                                                                                                                                                                                                                                                                                            c           c   '       v   '    ]Xb�    �   H   J   z        " Highlights�   G   J   y            �   G   I   x    5�_�                    5        ����                                                                                                                                                                                                                                                                                                                            e           e   '       v   '    ]Xn    �   B   D                  Indents�   4   6          5      " toggle colorcolumn modes, see theme:Indents()5�_�                            ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tY"     �               z   " sdothum - 2016 (c) wtfpppl       " GUI   �" ══════════════════════════════════════════════════════════════════════════════       P  " Behaviour __________________________________________________________________       P    " ............................................................... Toggle gui             " toggle gui menu         function! s:toggleGui()   F        if &guioptions =~# 'T' | set guioptions-=T | set guioptions-=m   N        else                   | set guioptions+=T | set guioptions+=m | endif         endfunction       6      command! ToggleGui silent! call <SID>toggleGui()       P    " ............................................................... Redraw gui       9      let s:delay = '200m'  " redraw delay, see ui:Font()       $      " toggle in/out to fill window         function! s:redrawGui()           call s:toggleGui()   "        execute 'sleep ' . s:delay           call s:toggleGui()           if g:wrap_highlighting   7          Quietly Retheme  " fix line wrap highlighting           endif         endfunction            6      command! RedrawGui silent! call <SID>redrawGui()       P  " Look _______________________________________________________________________       P    " ............................................................. Line numbers       <      " toggle relative number, line number and no numbering          function! s:toggleNumber()   L        if (&relativenumber == 1 && &number == 1)     | set norelativenumber   D        elseif (&relativenumber == 0 && &number == 1) | set nonumber   _        else                                          | set relativenumber | set number | endif         endfunction       <      command! ToggleNumber silent! call <SID>toggleNumber()       P    " ........................................................... Column margins       -      augroup column | autocmd! | augroup END       +      set colorcolumn=0  " highlight column       4      " toggle colorcolumn modes, see theme:Guides()          function! s:toggleColumn()           if g:ruler == 0             let g:ruler      = 1   &          let &colorcolumn = col('.')    O          autocmd column CursorMoved,CursorMovedI * let &colorcolumn = col('.')           elseif g:ruler == 1             let g:ruler      = 2             autocmd! column           else             let g:ruler      = 0             let &colorcolumn = 0             ColumnWrap           endif           Guides   G        let g:column = 1  " flash column position, see autocmd info.vim         endfunction       <      command! ToggleColumn silent! call <SID>toggleColumn()       P  " Highlights _________________________________________________________________       P    " ...................................................... Line wrap highlight             let s:breakchar = '→'       9      " highlight wrapped line portion, see theme:Theme()         function! s:columnWrap()   &        if g:ruler == 0 && s:wraplight             set showbreak=   I          let l:edge       = winwidth(0) - &numberwidth - &foldcolumn - 1   :          let &colorcolumn = join(range(l:edge, 999), ',')           else   7          execute 'set showbreak=' . s:breakchar . '\ '           endif         endfunction       8      command! ColumnWrap silent! call <SID>columnWrap()       >      let s:wraplight = 0  " highlight linewrap (0) off (1) on       '      function! s:toggleColumnWrap(...)   ;        let s:wraplight = a:0 ? a:1 : (s:wraplight ? 0 : 1)           let g:ruler     = -1           call s:toggleColumn()         endfunction       U      command! -nargs=? ToggleColumnWrap silent! call <SID>toggleColumnWrap(<f-args>)       P    " ..................................................... Trailing white space       0      augroup invisible | autocmd! | augroup END       ,      " toggle trailing whitespace highlight   $      function! s:toggleWhiteSpace()           set list!           if &list == 0   Z          match ExtraWhitespace /\%x00$/  " nolist by failing match with null character :)             autocmd! invisible           else   '          match ExtraWhitespace /\s\+$/   c          " list state propagates forward (on) but not backwards (off)? so auto reset buffer state!   L          autocmd invisible BufLeave,WinLeave * call <SID>toggleWhiteSpace()           endif   4        call Status('List invisibles', &list != ' ')         endfunction       <      command! ToggleWhiteSpace call <SID>toggleWhiteSpace()       	" gui.vim5�_�                           ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tY1     �         z      N" Behaviour __________________________________________________________________5�_�                           ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tY6     �      	   z      N  " ............................................................... Toggle gui�      	   z    5�_�                           ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tY9     �         z      N  " ............................................................... Redraw gui�         z    5�_�                    "       ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tY?     �   !   #   z      N" Look _______________________________________________________________________5�_�                    $       ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tYD     �   #   %   z      N  " ............................................................. Line numbers�   $   %   z    5�_�                    /       ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tYH    �   .   0   z      N  " ........................................................... Column margins�   /   0   z    5�_�                    I       ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tYT     �   H   J   z      N" Highlights _________________________________________________________________5�_�                    K       ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tYX     �   J   L   z      N  " ...................................................... Line wrap highlight�   K   L   z    5�_�                    f       ����                                                                                                                                                                                                                                                                                                                                       z           V        ]tY\    �   e   g   z      N  " ..................................................... Trailing white space�   f   g   z    5�_�                    
        ����                                                                                                                                                                                                                                                                                                                                                             ]tp�    �   w   y          :    command! ToggleWhiteSpace call <SID>toggleWhiteSpace()�   u   w              endfunction�   t   v          2      call Status('List invisibles', &list != ' ')�   s   u                endif�   r   t          J        autocmd invisible BufLeave,WinLeave * call <SID>toggleWhiteSpace()�   q   s          a        " list state propagates forward (on) but not backwards (off)? so auto reset buffer state!�   p   r          %        match ExtraWhitespace /\s\+$/�   o   q          
      else�   n   p                  autocmd! invisible�   m   o          X        match ExtraWhitespace /\%x00$/  " nolist by failing match with null character :)�   l   n                if &list == 0�   k   m                set list!�   j   l          "    function! s:toggleWhiteSpace()�   i   k          *    " toggle trailing whitespace highlight�   g   i          .    augroup invisible | autocmd! | augroup END�   c   e          S    command! -nargs=? ToggleColumnWrap silent! call <SID>toggleColumnWrap(<f-args>)�   a   c              endfunction�   `   b                call s:toggleColumn()�   _   a                let g:ruler     = -1�   ^   `          9      let s:wraplight = a:0 ? a:1 : (s:wraplight ? 0 : 1)�   ]   _          %    function! s:toggleColumnWrap(...)�   [   ]          <    let s:wraplight = 0  " highlight linewrap (0) off (1) on�   Y   [          6    command! ColumnWrap silent! call <SID>columnWrap()�   W   Y              endfunction�   V   X                endif�   U   W          5        execute 'set showbreak=' . s:breakchar . '\ '�   T   V          
      else�   S   U          8        let &colorcolumn = join(range(l:edge, 999), ',')�   R   T          G        let l:edge       = winwidth(0) - &numberwidth - &foldcolumn - 1�   Q   S                  set showbreak=�   P   R          $      if g:ruler == 0 && s:wraplight�   O   Q              function! s:columnWrap()�   N   P          7    " highlight wrapped line portion, see theme:Theme()�   L   N              let s:breakchar = '→'�   F   H          :    command! ToggleColumn silent! call <SID>toggleColumn()�   D   F              endfunction�   C   E          E      let g:column = 1  " flash column position, see autocmd info.vim�   B   D                Guides�   A   C                endif�   @   B                  ColumnWrap�   ?   A                  let &colorcolumn = 0�   >   @                  let g:ruler      = 0�   =   ?          
      else�   <   >                  autocmd! column�   ;   =                  let g:ruler      = 2�   :   <                elseif g:ruler == 1�   9   ;          M        autocmd column CursorMoved,CursorMovedI * let &colorcolumn = col('.')�   8   :          $        let &colorcolumn = col('.') �   7   9                  let g:ruler      = 1�   6   8                if g:ruler == 0�   5   7              function! s:toggleColumn()�   4   6          2    " toggle colorcolumn modes, see theme:Guides()�   2   4          )    set colorcolumn=0  " highlight column�   0   2          +    augroup column | autocmd! | augroup END�   ,   .          :    command! ToggleNumber silent! call <SID>toggleNumber()�   *   ,              endfunction�   )   +          ]      else                                          | set relativenumber | set number | endif�   (   *          B      elseif (&relativenumber == 0 && &number == 1) | set nonumber�   '   )          J      if (&relativenumber == 1 && &number == 1)     | set norelativenumber�   &   (              function! s:toggleNumber()�   %   '          :    " toggle relative number, line number and no numbering�      !          4    command! RedrawGui silent! call <SID>redrawGui()�                     �                    endfunction�                      endif�                5        Quietly Retheme  " fix line wrap highlighting�                      if g:wrap_highlighting�                      call s:toggleGui()�                       execute 'sleep ' . s:delay�                      call s:toggleGui()�                    function! s:redrawGui()�                "    " toggle in/out to fill window�                7    let s:delay = '200m'  " redraw delay, see ui:Font()�                4    command! ToggleGui silent! call <SID>toggleGui()�                    endfunction�                L      else                   | set guioptions+=T | set guioptions+=m | endif�                D      if &guioptions =~# 'T' | set guioptions-=T | set guioptions-=m�   
                 function! s:toggleGui()�   	                 " toggle gui menu5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ]t��     �   w   y          8  command! ToggleWhiteSpace call <SID>toggleWhiteSpace()�   u   w            endfunction�   t   v          0    call Status('List invisibles', &list != ' ')�   s   u          	    endif�   r   t          H      autocmd invisible BufLeave,WinLeave * call <SID>toggleWhiteSpace()�   q   s          _      " list state propagates forward (on) but not backwards (off)? so auto reset buffer state!�   p   r          #      match ExtraWhitespace /\s\+$/�   o   q              else�   n   p                autocmd! invisible�   m   o          V      match ExtraWhitespace /\%x00$/  " nolist by failing match with null character :)�   l   n              if &list == 0�   k   m              set list!�   j   l             function! s:toggleWhiteSpace()�   i   k          (  " toggle trailing whitespace highlight�   g   i          ,  augroup invisible | autocmd! | augroup END�   e   g          P  " ....................................................... Trailing white space�   c   e          Q  command! -nargs=? ToggleColumnWrap silent! call <SID>toggleColumnWrap(<f-args>)�   a   c            endfunction�   `   b              call s:toggleColumn()�   _   a              let g:ruler     = -1�   ^   `          7    let s:wraplight = a:0 ? a:1 : (s:wraplight ? 0 : 1)�   ]   _          #  function! s:toggleColumnWrap(...)�   [   ]          :  let s:wraplight = 0  " highlight linewrap (0) off (1) on�   Y   [          4  command! ColumnWrap silent! call <SID>columnWrap()�   W   Y            endfunction�   V   X          	    endif�   U   W          3      execute 'set showbreak=' . s:breakchar . '\ '�   T   V              else�   S   U          6      let &colorcolumn = join(range(l:edge, 999), ',')�   R   T          E      let l:edge       = winwidth(0) - &numberwidth - &foldcolumn - 1�   Q   S                set showbreak=�   P   R          "    if g:ruler == 0 && s:wraplight�   O   Q            function! s:columnWrap()�   N   P          5  " highlight wrapped line portion, see theme:Theme()�   L   N            let s:breakchar = '→'�   J   L          P  " ........................................................ Line wrap highlight�   F   H          8  command! ToggleColumn silent! call <SID>toggleColumn()�   D   F            endfunction�   C   E          C    let g:column = 1  " flash column position, see autocmd info.vim�   B   D          
    Guides�   A   C          	    endif�   @   B                ColumnWrap�   ?   A                let &colorcolumn = 0�   >   @                let g:ruler      = 0�   =   ?              else�   <   >                autocmd! column�   ;   =                let g:ruler      = 2�   :   <              elseif g:ruler == 1�   9   ;          K      autocmd column CursorMoved,CursorMovedI * let &colorcolumn = col('.')�   8   :          "      let &colorcolumn = col('.') �   7   9                let g:ruler      = 1�   6   8              if g:ruler == 0�   5   7            function! s:toggleColumn()�   4   6          0  " toggle colorcolumn modes, see theme:Guides()�   2   4          '  set colorcolumn=0  " highlight column�   0   2          )  augroup column | autocmd! | augroup END�   .   0          P  " ............................................................. Column margins�   ,   .          8  command! ToggleNumber silent! call <SID>toggleNumber()�   *   ,            endfunction�   )   +          [    else                                          | set relativenumber | set number | endif�   (   *          @    elseif (&relativenumber == 0 && &number == 1) | set nonumber�   '   )          H    if (&relativenumber == 1 && &number == 1)     | set norelativenumber�   &   (            function! s:toggleNumber()�   %   '          8  " toggle relative number, line number and no numbering�   #   %          P  " ............................................................... Line numbers�      !          2  command! RedrawGui silent! call <SID>redrawGui()�                   �                  endfunction�                	    endif�                3      Quietly Retheme  " fix line wrap highlighting�                    if g:wrap_highlighting�                    call s:toggleGui()�                    execute 'sleep ' . s:delay�                    call s:toggleGui()�                  function! s:redrawGui()�                   " toggle in/out to fill window�                5  let s:delay = '200m'  " redraw delay, see ui:Font()�                P  " ................................................................. Redraw gui�                2  command! ToggleGui silent! call <SID>toggleGui()�                  endfunction�                J    else                   | set guioptions+=T | set guioptions+=m | endif�                B    if &guioptions =~# 'T' | set guioptions-=T | set guioptions-=m�   
               function! s:toggleGui()�   	               " toggle gui menu�      	          P  " ................................................................. Toggle gui5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ]t��    �   e   g          N" ....................................................... Trailing white space�   J   L          N" ........................................................ Line wrap highlight�   .   0          N" ............................................................. Column margins�   #   %          N" ............................................................... Line numbers�                N" ................................................................. Redraw gui�      	          N" ................................................................. Toggle gui5�_�                     	        ����                                                                                                                                                                                                                                                                                                                                                             ]u     �   a   b           �   G   H           �   ,   -           �   "   #           �                 �      	           5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ]V�    �                F        if &guioptions =~: 'T' | set guioptions-=T | set guioptions-=m5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             ]V�     �                9      let s:delay = '200m'  " redraw delay, see ui:Font()5�_�                    *        ����                                                                                                                                                                                                                                                                                                                                                             ]V�     �   )   +          4      " toggle colorcolumn modes, see theme:Indent()5�_�                     B        ����                                                                                                                                                                                                                                                                                                                                                             ]V�    �   A   C          9      " highlight wrapped line portion, see theme:Theme()5�_�                       
    ����                                                                                                                                                                                                                                                                                                                                                  v       ]Uʿ    �         x      <      let g:delay = '200m'  " redraw delay, see theme#Font()5�_�                            ����                                                                                                                                                                                                                                                                                                                                                  v       ]U��    �         x      "        execute 'sleep ' . g:delay5��