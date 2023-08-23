vim.g.mapleader = ","

require("plugins")
require("options")
require("keymaps")
require("autocommands")

require("plugins.comment")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.nvim-cmp")
require("plugins.autopairs")
require("plugins.gitsigns")
require("plugins.indent-blankline")
require("plugins.colorizer")
require("plugins.whichkey")
require("plugins.bufferline")
require("plugins.dap")
-- require("plugins.smartcolumn")
require("plugins.deadcolumn")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.lsp")
-- require("plugins.colorscheme")

local cs
-- cs = "spaceduck"
cs = "everforest"
vim.cmd("colorscheme " .. cs)
