-- set colorscheme in case it isn't installed
local os_name = vim.loop.os_uname().sysname

local c_table
local cs
local rtp
local r

c_table = {
	"ayu",
	"one_monokai",
	"nord",
	"zenburn",
	"nightfly",
	"tokyonight",
	"tokyonight-moon",
	"tokyonight-night",
	"tokyonight-storm",
	"everforest",
	"kanagawa",
	"lucario",
	"rigel",
	"sonokai",
	"vim-monokai-tasty",
	"gruvbox",
	"purify",
	"rasmus",
	"melange",
	"cobalt2",
	"sacredforest",
	"catppuccin",
	"catppuccin-frappe",
	"catppuccin-macchiato",
	"catppuccin-mocha",
	"melange",
	"falcon",
	"darkplus",
	"PaperColor",
	"seoul256",
	"onehalfdark",
	"tender",
	"OceanicNext",
	"spaceduck",
}

math.randomseed(os.time())
r = math.random(#c_table)

-- r = 9 -- tokyonight-storm
-- r = 10  -- everforest
-- r = 11 -- kanagawa
-- r = 17 -- purify
-- r = 22 -- catppuccin
-- r = 23 -- catppuccin-frappe
-- r = 24 -- catppuccin-macchiato
-- r = 25 -- catppuccin-mocha
-- r = 26 -- melange
-- r = 29 -- PaperColor

cs = c_table[r]

if cs == "purify" or cs == "onehalfdark" then
	-- backup rtp
	rtp = vim.opt.runtimepath

	-- update rtp
	if os_name == "Darwin" or os_name == "Linux" then
		vim.opt.runtimepath:append(",$HOME/.local/share/nvim/site/pack/packer/start/purify/vim")
		vim.opt.runtimepath:append(",$HOME/.local/share/nvim/site/pack/packer/start/onehalfdark/vim")
	else
		-- if os_name == "Windows_NT"
		vim.opt.runtimepath:append(",$HOME\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\purify\\vim")
		vim.opt.runtimepath:append(",$HOME\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\onehalfdark\\vim")
		-- print(vim.o.runtimepath)
	end
end

local status, _ = pcall(vim.cmd, "colorscheme " .. cs)

if cs == "purify" or cs == "onehalfdark" then
	-- restore rtp
	vim.opt.runtimepath = rtp
	-- print(vim.o.runtimepath)
end

if not status then
	print("Colorscheme " .. cs .. " not found!") -- print error if colorscheme not installed
	print("default to everforest")
	vim.cmd("colorscheme everforest")
	return
else
	print(cs)
end
