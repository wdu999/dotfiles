local opt = vim.opt
local os_name = vim.loop.os_uname().sysname

opt.relativenumber = true
opt.number = true

opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true -- highlight the current cursor line

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

opt.foldmethod = "indent"
opt.foldlevelstart = 99

opt.scrolloff = 7

opt.colorcolumn = "88"

opt.list = true
-- opt.listchars:append("space:⋅")
-- opt.listchars:append("eol:↴")

-- opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

vim.g.SuperTabDefaultCompletionType = "<c-n>" -- starts from top to bottom

vim.g.rainbow_active = 1 -- always active

-- for PlugIn: Black
-- if os_name == "Darwin" then
-- 	-- vim.g.python3_host_prog = '/Users/weidu/opt/anaconda3/bin/python3'
-- 	vim.g.python3_host_prog = "/usr/local/bin/python3"
-- elseif os_name == "Linux" then
-- 	vim.g.python3_host_prog = "/usr/bin/python3"
-- elseif os_name == "Windows_NT" then
-- 	vim.g.python3_host_prog = "C:\\Users\\weigd\\AppData\\Local\\Programs\\Python\\Python311\\python.exe"
-- end
