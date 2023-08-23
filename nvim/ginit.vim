if exists('g:fvim_loaded')
    " set guifont=Consolas:h14
    " set guifont=FantasqueSansMono\ Nerd\ Font:h14
    " good old 'set guifont' compatibility with HiDPI hints...
    if g:fvim_os == 'windows' || g:fvim_render_scale > 1.0
        " set guifont=CaskaydiaCove\ Nerd\ Font:h18
        set guifont=Agave\ Nerd\ Font:h20
        " set guifont=Hurmit\ Nerd\ Font:h18
        " set guifont=FantasqueSansMono\ Nerd\ Font:h18
        " set guifont=Dank\ Mono:h16
    else
        " set guifont=CaskaydiaCove\ Nerd\ Font:h28
        set guifont=Agave\ Nerd\ Font:h28
        " set guifont=Hurmit\ Nerd\ Font:h28
        " set guifont=FantasqueSansMono\ Nerd\ Font:h20
        " set guifont=Dank\ Mono:h16
    endif

    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true

    " Font tweaks
    " FVimFontAntialias v:true
    " FVimFontAutohint v:true
    " FVimFontHintLevel 'full'
    FVimFontLigature v:true
    " FVimFontLineHeight '+1.0' " can be 'default', '14.0', '-1.0' etc.
    " FVimFontSubpixel v:true
    " FVimFontNoBuiltinSymbols v:true   " Disable built-in Nerd font symbols

    " Background composition
    " FVimBackgroundComposition 'acrylic'   " 'none', 'transparent', 'blur' or 'acrylic'
    " FVimBackgroundOpacity 0.85            " value between 0 and 1, default bg opacity.
    " FVimBackgroundAltOpacity 0.85         " value between 0 and 1, non-default bg opacity.
    " FVimBackgroundImage 'C:/foobar.png'   " background image
    " FVimBackgroundImageVAlign 'center'    " vertial position, 'top', 'center' or 'bottom'
    " FVimBackgroundImageHAlign 'center'    " horizontal position, 'left', 'center' or 'right'
    " FVimBackgroundImageStretch 'fill'     " 'none', 'fill', 'uniform', 'uniformfill'
    " FVimBackgroundImageOpacity 0.85       " value between 0 and 1, bg image opacity

    " Try to snap the fonts to the pixels, reduces blur
    " in some situations (e.g. 100% DPI).
    " FVimFontAutoSnap v:true

    " Debug UI overlay
    " FVimDrawFPS v:true
endif

if exists(':GuiFont')
    GuiFont Agave Nerd Font:h18
    " GuiFont CaskaydiaCove Nerd Font:h18
    " GuiFont MesloLGM Nerd Font Mono:h12
    " GuiFont! DankMono Nerd Font:h14
    " GuiFont! ComicMono Nerd Font:h16
    " GuiFont FantasqueSansMono Nerd Font:h20
    " GuiFont Fantasque Sans Mono:h12
    " GuiTabline 0
    " set guifont=FantasqueSansMono\ Nerd\ Font:h18
endif

if has("gui_vimr")
endif
