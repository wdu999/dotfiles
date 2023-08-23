local status, smartcolumn = pcall(require, "smartcolumn")
if not status then
	print("!!! require smartcolumn fail !!!")
	return
end

local config = {
	colorcolumn = "88",
	disabled_filetypes = { "help", "text", "markdown" },
	custom_colorcolumn = {},
	scope = "window", -- window, file, line
}

smartcolumn.setup(config)
