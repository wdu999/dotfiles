local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "jk to exit insert mode" })

-- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "[c]lear [h]ighlight" })
keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { silent = true, desc = "[N]o [H]ighlight" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "num[+]" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "num[-]" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit [V]ertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit [H]orizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "[S]plit [E]venly" }) -- make split windows equal width & height
keymap.set("n", "<leader>sc", ":close<CR>", { desc = "[S]plit [C]lose" }) -- close current split window

keymap.set("n", "<leader>t", ":tabnew<CR>", { desc = "[T]ab new" }) -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "[T]ab [C]lose" }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "[T]ab [N]ext" }) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "[T]ab [P]re" }) --  go to previous tab

keymap.set("n", "<tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "[B]uffer [N]ext" })
keymap.set("n", "<s-tab>", ":bprevious<CR>", { noremap = true, silent = true, desc = "[B]uffer [P]re" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "[B]uffer [D]elete" })

-- fold/unfold
-- keymap.set("n", "<space>", "za", {desc='fold/unfold'})

-- ctags
keymap.set("n", "<leader>tl", ":Vista!!<CR>", { desc = "[T]ag [L]ist" })

-- CoC outline
-- vim.api.nvim_exec(
-- 	[[
--  nnoremap <silent><nowait> <leader>v  :call ToggleOutline()<CR>
--  function! ToggleOutline() abort
--    let winid = coc#window#find('cocViewId', 'OUTLINE')
--    if winid == -1
--      call CocActionAsync('showOutline', 1)
--    else
--      call coc#window#close(winid)
--    endif
--  endfunction
-- ]],
-- 	false
-- )

-- show CoCDiagnostics
-- vim.keymap.set("n", "<Leader>d", ":CocDiagnostics<CR>")
-- vim.keymap.set("n", "<Leader>d", ":call CocAction('diagnosticList')<CR>")
-- vim.keymap.set("n", "<Leader>d", ":call CocAction('diagnosticToggle')<CR>")
-- vim.keymap.set("n", "<Leader>d", ":call CocAction('diagnosticToggleBuffer')<CR>")

-- config file
-- keymap.set("n", "<leader>,", ":tabnew $MYVIMRC | tcd %:p:h<CR>")
keymap.set("n", "<leader>,", ":e $MYVIMRC | tcd %:p:h<CR>", { desc = "[,] edit .vimrc" })

-- enter command mode
keymap.set("n", ";", ":", { noremap = true, desc = "enter cmmand mode" })

-- write file
keymap.set("n", "<leader>w", ":w<CR>", { desc = "[W]rite file" })

-- quit
keymap.set("n", "<leader>q", ":qa!<CR>", { desc = "[Q]uit" })

keymap.set("n", "<leader>cd", ":cd %:p:h<cr>:pwd<CR>", { desc = "[CD] buffer directory" })

-- Move text up and down
keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>", { noremap = true, silent = true, desc = "move text up" })
keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>", { noremap = true, silent = true, desc = "move text down" })

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", { noremap = true, silent = true })
keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Move text up and down
keymap.set("v", "<A-j>", ":m .+1<CR>gv", { noremap = true, silent = true, desc = "move text up" })
keymap.set("v", "<A-k>", ":m .-2<CR>gv", { noremap = true, silent = true, desc = "move text down" })
keymap.set("v", "p", '"_dP', { noremap = true, silent = true })

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "[S]plit [M]aximize" }) -- toggle split window maximization

-- adjust splits
-- keymap.set("n", "<Left>", ":vertical res-2<CR>", { silent = true })
-- keymap.set("n", "<Right>", ":vertical res+2<CR>", { silent = true })
-- keymap.set("n", "<Up>", ":res-2<CR>", { silent = true })
-- keymap.set("n", "<Down>", ":res+2<CR>", { silent = true })
keymap.set("n", "<Left>", "<C-w><")
keymap.set("n", "<Right>", "<C-w>>")
keymap.set("n", "<Up>", "<C-w>-")
keymap.set("n", "<Down>", "<C-w>+")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "[E]xplorer toggle" }) -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[F]ind [F]iles" }) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "[F]ind [S]tring" }) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "[F]ind [C]urrent string under cursor" }) -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "[F]ind [B]uffers" }) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "[F]ind [H]elp tags" }) -- list available help tags

keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "[F]ind [D]ignostics" }) -- list dianostics, current buffer
-- keymap.set("n", "<leader>fda", "<cmd>Telescope diagnostics<cr>", { desc = "[T]elescope [F]ind [D]ignostics in all files" }) -- list dianostics in current working directory

-- telescope git commands (not on youtube nvim video)
-- keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
-- keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
-- keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
-- keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
-- keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- Toggle current line or with count
vim.keymap.set("n", "<leader><space>", function()
	return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)" or "<Plug>(comment_toggle_linewise_count)"
end, { expr = true, desc = "[S]witch comment" })

-- Toggle in VISUAL mode
vim.keymap.set("x", "<leader><space>", "<Plug>(comment_toggle_linewise_visual)", { desc = "[S]witch comment" })
-- vim.keymap.set("x", "<leader><space>", "<Plug>(comment_toggle_blockwise_visual)", { desc = "[S]witch [C]omment" })

-- remove trailing whitespace with a keybinding
vim.keymap.set("n", "<Leader>tr", require("whitespace-nvim").trim, { desc = "[T]railing space [R]emove" })

-- Remove the Windows ^M - when the encodings gets messed up
-- vim.keymap.set("n", "<Leader>m", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm")
vim.keymap.set("n", "<Leader>m", ":set fileformat=unix<CR>", { desc = "for[M]at unix" })

-- format python
-- vim.keymap.set("n", "<Leader>p", ":Black<CR>", {desc = '[P]ython format'})

-- format file (keybinding is set in null-ls.lua)
-- vim.keymap.set("n", "<Leader>p", ":lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "<Leader>p", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", { desc = "ls[P] format buffer" })
