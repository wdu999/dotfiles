-- auto-reload files when modified externally
-- https://unix.stackexchange.com/a/383044
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
	command = "if mode() != 'c' | checktime | endif",
	pattern = { "*" },
})

vim.api.nvim_command([[
augroup file_types
autocmd BufRead *.txt set filetype=tsv
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']
augroup END
]])

-- highlight over 88 words content, bind a key (leader+h) to toggle
-- vim.api.nvim_exec(
-- 	[[
-- hi LineProximity ctermfg=white ctermbg=gray guifg=white guibg=#757160
-- hi LineOverflow  ctermfg=white ctermbg=red guifg=white guibg=#FF2270

-- let s:hilightline = 1

-- function! ToggleHighlightLine()
--     if s:hilightline == 0
--         call clearmatches()
--         let s:hilightline = 1
--     else
--         let w:m1=matchadd('LineProximity', '\%<94v.\%>89v', -1)
--         let w:m2=matchadd('LineOverflow', '\%>93v.\+', -1)
--         let w:created=1
--         let s:hilightline = 0
--     endif
-- endfun

-- nnoremap <leader>h :call ToggleHighlightLine()<CR>
-- ]],
-- 	false
-- )
