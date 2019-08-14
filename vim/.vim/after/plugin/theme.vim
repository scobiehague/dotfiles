" sdothum - 2016 (c) wtfpl

" User Interface
" ══════════════════════════════════════════════════════════════════════════════

  " The look ___________________________________________________________________

    " .................................................................... Setup

      let s:cursorline           = 0  " visible (0) off (1) on
      let s:sync                 = 0  " sync (0) off (1) indent guides
      let s:font_changed         = 0  " redraw flag

    " ......................................................... DFM colour masks

      " foreground
      let s:dfm_fg_light         = g:light_fg   " light foreground (high contrast)
      let s:dfm_fg_dark          = g:dark_fg    " dark foreground (high contrast)
      let s:dfm_ale_dark         = g:hue_4
      let s:dfm_ale_light        = g:hue_1
      let s:dfm_bg_spell_dark    = g:hue_5      " dark spelling
      let s:dfm_bg_spell_light   = g:spell      " light spelling
      let s:dfm_fg_spell_dark    = g:base6      " dark spelling
      let s:dfm_fg_spell_light   = g:mono_2     " light spelling
      let s:dfm_proof_dark       = g:dark       " dark hypertext
      let s:dfm_proof_light      = g:light      " light hypertext

      " background
      let s:dfm_bg_light         = g:base7      " flatwhite light background
      let s:dfm_bg_dark          = g:gray1      " quantum dark background
      let s:dfm_folded_dark      = g:gray4      " vimdiff fold
      let s:dfm_folded_light     = g:gray5      " vimdiff fold
      let s:dfm_match_dark       = g:red        " quantum dark parens
      let s:dfm_match_light      = g:hue_5      " flatwhite light parens
      let s:dfm_vsplit_dark      = g:gray2      " invisible split (minimal contrast)
      let s:dfm_vsplit_light     = g:base6      " invisible split (minimal contrast)

      " cursor line
      let s:dfm_cursor_light     = g:cursor     " iA Writer
      let s:dfm_cursor_dark      = g:cursor     " iA Writer
      let s:dfm_cursorline_light = g:blue       " light cursorline
      let s:dfm_cursorline_dark  = g:white      " dark cursorline
      let s:dfm_bg_column_dark   = g:hue_1      " dark column
      let s:dfm_bg_column_light  = g:orange_bg  " light column
      let s:dfm_bg_line_dark     = g:gray2      " dark cursorline
      let s:dfm_bg_line_light    = g:blue_bg    " light cursorline
      let s:dfm_fg_line_dark     = g:gray4      " dark line numbers
      let s:dfm_fg_line_light    = g:dark_blue  " light line numbers

      " statusline
      let s:dfm_bg_status_light  = g:orange_bg  " light statusline
      let s:dfm_bg_status_dark   = g:gray1      " dark statusline
      let s:dfm_fg_status_light  = g:mono_4     " light statusline
      let s:dfm_fg_status_dark   = g:mono_1     " dark statusline
      let s:dfm_fg_user1_light   = g:mono_1     " light statusline
      let s:dfm_fg_user1_dark    = g:mono_4     " dark statusline
      let s:dfm_fg_user2_light   = g:dark_blue  " light statusline
      let s:dfm_fg_user2_dark    = g:cyan       " dark statusline

  " Colours ____________________________________________________________________

    " .................................................................. Palette

      function! s:palette()
        Trace theme:Palette
        execute 'let s:dfm_bg_line     = s:dfm_bg_line_'                . &background
        execute 'let s:dfm_bg          = s:dfm_bg_'                     . &background
        execute 'let s:dfm_bg_status   = s:dfm_bg_status_'              . &background
        execute 'let s:dfm_cursor_bg   = s:cursorline == 0 ? s:dfm_bg_' . &background . ' : s:dfm_bg_line_' . &background
        execute 'let s:dfm_cursorline  = s:dfm_cursorline_'             . &background
        execute 'let s:dfm_cursor      = s:dfm_cursor_'                 . &background
        execute 'let s:dfm_fg_line     = s:dfm_fg_line_'                . &background
        execute 'let s:dfm_fg          = s:dfm_fg_'                     . &background
        execute 'let s:dfm_fg_status   = s:dfm_fg_status_'              . &background
        execute 'let s:dfm_fg_user1    = s:dfm_fg_user1_'               . &background
        execute 'let s:dfm_fg_user2    = s:dfm_fg_user2_'               . &background
        execute 'let s:dfm_folded      = s:dfm_folded_'                 . &background
        execute 'let s:dfm_linenr_ins  = s:dfm_bg_'                     . &background
        execute 'let s:dfm_match       = s:dfm_match_'                  . &background
        execute 'let s:dfm_proof       = s:dfm_proof_'                  . &background
        execute 'let s:dfm_vsplit      = s:dfm_vsplit_'                 . &background
      endfunction

      command! Palette silent! call <SID>palette()

      " return (calculated) color variable value
      function! s:hexValue(varname)
        execute 'return ' . a:varname
      endfunction

    " ............................................................... Highlights

      function! s:highlights()
        Trace theme:highlights()
        let l:background = &background == 'light' ? 'dark' : 'light'
        let l:cursor     = s:hexValue('s:dfm_cursor_'   . l:background)
        let l:spell      = s:hexValue('s:dfm_bg_spell_' . &background)
        execute 'hi CommandCursor   guibg=' . l:cursor        . ' guifg=' . s:dfm_bg
        execute 'hi Cursor          guibg=' . s:dfm_cursor    . ' guifg=' . g:black
        execute 'hi CursorLine      guibg=' . s:dfm_cursor_bg . (g:colorscheme == 'flatwhite' ? ' guifg=' . s:dfm_cursorline : '')
        execute 'hi ErrorMsg        guibg=' . s:dfm_bg        . ' guifg=red'
        execute 'hi ExtraWhitespace guibg=' . l:cursor        . ' guifg=' . s:hexValue('s:dfm_bg_' . l:background)
        execute 'hi Folded          guibg=' . s:dfm_folded    . ' guifg=' . s:dfm_bg
        execute 'hi InsertCursor    guibg=' . s:dfm_cursor    . ' guifg=' . s:dfm_bg
        execute 'hi MatchParen      guibg=' . s:dfm_match     . ' guifg=' . s:dfm_bg . ' gui=bold'
        execute 'hi ReplaceCursor   guibg=' . l:cursor        . ' guifg=' . s:dfm_bg
        execute 'hi ShowMarksHLl    guibg=' . s:dfm_bg
        execute 'hi SignColumn      guibg=' . s:dfm_bg
        execute 'hi SpellBad        guibg=' . l:spell         . ' guifg=' . s:hexValue('s:dfm_fg_spell_' . &background) . ' gui=NONE'
        execute 'hi User1           guibg=' . s:dfm_bg        . ' guifg=' . s:dfm_fg_user1
        execute 'hi User2           guibg=' . s:dfm_bg        . ' guifg=' . s:dfm_fg_user2
        execute 'hi VertSplit       guibg=' . s:dfm_vsplit    . ' guifg=' . s:dfm_vsplit
        execute 'hi VisualCursor    guibg=' . l:cursor        . ' guifg=' . s:dfm_bg

        hi! link htmlH1     Statement  " markdown heading content
        hi! link htmlH2     Statement
        hi! link htmlH3     Statement
        hi! link htmlH4     Statement
        hi! link mkdHeading Statement
        hi! link mkdLink    htmlString
        hi! link SneakScope Cursor
        hi! link SpellCap   SpellBad
        hi! link SpellLocal SpellBad
        hi! link SpellRare  SpellBad

        if &background == 'light'  " add flatwhite contrast
          execute 'hi IncSearch  guifg=' . g:light_fg . ' guibg=' . s:dfm_cursor . ' term=none cterm=none gui=none'
          execute 'hi Search     guifg=' . g:white    . ' guibg=red guisp=red gui=bold'
        endif
        execute 'hi StatusLineNC gui=nocombine guibg=' . s:dfm_bg_status . ' guifg=' . s:dfm_fg_status
      endfunction

      " line numbers
      function! s:lineNr()
        Trace theme:LineNr
        if CommandWindow() | return | endif
        execute 'hi CursorLineNr '  . (g:view == 0 ? 'gui=bold guifg=' . s:hexValue('s:dfm_bg_' . &background)
                \                                  : 'gui=none guifg=' . (b:view == 0 ? s:dfm_bg : s:dfm_fg_line))
        if mode() == 'n' | execute 'hi LineNr  guifg=' . (g:view == 0 ? s:dfm_fg_line : s:dfm_bg)
        else             | execute 'hi LineNr  guifg=' . s:dfm_linenr_ins | endif
        execute 'hi NonText guifg=red'
      endfunction

      command! LineNr silent! call <SID>lineNr()

      " ruler, indents
      function! s:indent()
        Trace theme:Indent
        execute 'hi IndentGuidesOdd  guibg=' . s:hexValue('s:dfm_bg_'        . &background)
        execute 'hi IndentGuidesEven guibg=' . s:hexValue('s:dfm_bg_line_'   . &background)
        if g:ruler == 1 | execute 'hi ColorColumn guibg=' . s:hexValue('s:dfm_bg_column_' . &background)
        else            | execute 'hi ColorColumn guibg=' . s:hexValue('s:dfm_bg_line_'   . &background) | endif

        if s:sync == 1  " refresh any indent guides, see theme:LiteSwitch()
          IndentGuidesToggle
          IndentGuidesToggle
          let s:sync = 0
        endif
      endfunction

      command! Indent silent! call <SID>indent()

      function! s:plugins()
        Trace theme:plugins()
        execute 'hi ALEErrorSign   guifg=red gui=bold'
        execute 'hi ALEWarningSign guifg=' . s:hexValue('s:dfm_ale_' . &background) . ' gui=bold'

        " g:fzf_colors initializes fzf only once, so override cursorline color
        let $FZF_DEFAULT_OPTS = '--reverse --color=fg+:' . (g:colorscheme == 'duochrome' ? g:hue_6_2 : s:hexValue('s:dfm_fg_' . &background))  " cannot appear to set other colors, such as hl+ (?)
        " hide bottom fzf window identifier
        execute 'hi fzf1 guibg=' . s:dfm_bg . ' guifg=' . s:dfm_bg
        execute 'hi fzf2 guibg=' . s:dfm_bg . ' guifg=' . s:dfm_bg
        execute 'hi fzf3 guibg=' . s:dfm_bg . ' guifg=' . s:dfm_bg

        if &background == 'light'
          execute 'hi SignifyLineAdd    guibg=' . s:dfm_bg . ' guifg=' . g:hue_3
          execute 'hi SignifyLineChange guibg=' . s:dfm_bg . ' guifg=' . g:hue_2
          execute 'hi SignifyLineDelete guibg=' . s:dfm_bg . ' guifg=' . g:hue_5_2
        else
          hi! link SignifyLineAdd    String
          hi! link SignifyLineChange Type
          hi! link SignifyLineDelete Identifier
        endif
        hi! link SignifySignAdd    SignifyLineAdd
        hi! link SignifySignChange SignifyLineChange
        hi! link SignifySignDelete SignifyLineDelete
      endfunction

      " simple console theme tweaks to maximize transparency
      function! s:console()
        Trace theme:console()
        colorscheme pencil  " a theme that can be minimally tweaked for transparency
        set background=dark
        let $FZF_DEFAULT_OPTS = '--color=bg+:-1'  " fzf term transparency
        execute 'hi fzf1         guibg=NONE guifg=#303030'
        execute 'hi fzf2         guifg=NONE guifg=#303030'
        execute 'hi fzf3         guibg=NONE guifg=#303030'
        execute 'hi CursorLine   guibg=NONE ctermbg=NONE guifg=yellow gui=bold cterm=bold'
        execute 'hi CursorLineNR guibg=NONE ctermbg=NONE'
        execute 'hi FoldColumn   guibg=NONE'
        execute 'hi LineNr       guibg=NONE'
        execute 'hi Normal       guibg=NONE'
        execute 'hi SignColumn   guibg=NONE'
        call s:margin()
        call s:noTilde()
      endfunction

  " Theme ______________________________________________________________________

    " ........................................................... Initialization
     
      function! s:theme()
        if ! has('gui_running') | call s:console() | return | endif
        Trace theme:Theme
        call s:highlights()
        call s:plugins()
        call s:indent()
        call s:margin()
        call s:noTilde()
        ColumnWrap
      endfunction

      command! Theme silent! call <SID>theme()

    " ............................................................ Switch colour

      function! s:nextColorScheme()
        Trace theme:NextColorScheme
        if g:colorscheme     == 'duochrome'
          let &background     = 'light'  " must set background before colorscheme for flatwhite colors
          let g:colorscheme   = 'flatwhite'
        elseif g:colorscheme == 'flatwhite'
          let &background     = 'dark'
          let g:colorscheme   = 'quantum'
        else
          let &background     = 'light'
          let g:colorscheme   = 'duochrome'
        endif
        execute 'colorscheme ' . g:colorscheme
      endfunction

      command! NextColorScheme silent! call <SID>nextColorScheme()

      " toggle colour scheme
      function! s:liteSwitch()
        Trace theme:LiteSwitch
        Quietly LiteDFMClose  " trap and ignore initialization error
        call s:nextColorScheme()
        let s:sync = 1        " see theme:Indent()
        call LiteType()
      endfunction

      command! LiteSwitch silent! call <SID>liteSwitch()

  " Font _______________________________________________________________________

    " .......................................................... Balance margins

      " balance left right margins with font size changes (and window resizing)
      function! s:margin()
        Trace theme:Margin
        let g:lite_dfm_left_offset = max([1, min([22, (&columns - &textwidth - 4) / 2])])  " account for linenr <space> text
        Quietly LiteDFM
        call s:lineNr()
        RefreshInfo
      endfunction

      command! Margin silent! call <SID>margin()

    " ................................................................. Set font

      " adjust font sizes for various gpu's/displays, liteDFM offsets to fit screens
      function! Font(type)
        Trace theme:Font()
        if $DISPLAY > ''
          if g:font_type != a:type
            let g:font_type = a:type
            let l:size      = system('fontsize')
            let l:size      = a:type == 0 ? l:size : l:size + g:font_step
            execute 'set guifont=' . (Prose() ? g:prose_font : g:source_font) . ' ' . l:size
            if s:font_changed
              RedrawGui
            endif
            let s:font_changed = 1  " next font size change requires redraw
            set laststatus=2        " turn on statusline
          endif
        endif
      endfunction

  "  Distraction free highlight ________________________________________________

    " ................................................................ Code view

      function! s:codeView()
        Trace theme:CodeView
        execute 'hi LineNr guifg=' . s:dfm_fg_line
      endfunction

      command! CodeView silent! call <SID>codeView()

    " .................................................... Distraction free view

      " prose style
      function! s:dfmView()
        Trace theme:DfmView
        if Prose() | execute 'hi CursorLine gui=none guibg=' . s:dfm_bg . ' guifg=' . s:dfm_fg | endif
      endfunction

      command! DfmView silent! call <SID>dfmView()

    " .............................................................. EOF markers

      " hide tilde marker (not applicable to console)
      function! s:noTilde()
        if $DISPLAY > ''
          execute 'hi EndOfBuffer ctermfg=black guifg=' . s:dfm_bg
          hi! link Pmenu    Statusline  " reset menu highlight after loading autocompletion plugin
          hi! link PmenuSel Cursor
          hi! link WildMenu Cursor      " match command line tab menu
        endif
      endfunction

  " Context highlight __________________________________________________________

    " ............................................................... Prose mode
     
      " enhanced limelight contrast, see ui#ToggleProof()
      function! s:contrast(level)
        Trace theme:Contrast
        if Prose() && &background == 'light'
          if a:level
            execute 'hi! Normal     guifg=' . g:insert_fg
            execute 'hi! CursorLine guifg=' . g:black
          else
            execute 'hi! Normal     guifg=' . g:light_fg
            execute 'hi! CursorLine guifg=' . g:light_fg
          endif
        endif
      endfunction

      command! -nargs=1 Contrast silent! call <SID>contrast(<f-args>)

    " ............................................................... Statusline

      " undo statusline gui=reverse
      function! s:showStatusLine()
        Trace theme:ShowStatusLine
        execute 'hi StatusLine gui=none guibg=' . s:dfm_bg_status . ' guifg=' . s:dfm_fg_status
        set laststatus=2
      endfunction

      command! ShowStatusLine silent! call <SID>showStatusLine()

      function! s:hideInfo()
        Trace theme:HideInfo
        execute 'hi User1 guibg=' . s:dfm_bg . ' guifg=' . s:dfm_bg
        execute 'hi User2 guibg=' . s:dfm_bg . ' guifg=' . s:dfm_bg
      endfunction

      command! HideInfo silent! call <SID>hideInfo()

    " split window statusline background, see ui.vim autocmd
      function! s:splitColors()
        Trace theme:SplitColors
        if winnr('$') == 1
          let l:bg = s:dfm_bg
        else
          let l:bg = s:hexValue('s:dfm_bg_column_' . &background)
        endif
        execute 'hi User1 guibg=' . l:bg . ' guifg=' . s:dfm_fg_user1
        execute 'hi User2 guibg=' . l:bg . ' guifg=' . s:dfm_fg_user2
        return ''  " otherwise embeds '0' in statusline
      endfunction

      command! SplitColors silent! call <SID>splitColors()

    " theme.vim