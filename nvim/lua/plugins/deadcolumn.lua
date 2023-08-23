local status, deadcolumn = pcall(require, "deadcolumn")
if not status then
	print("!!! require deadcolumn fail !!!")
	return
end

local opts = {
	scope = "visible", -- line, buffer, visible, cursor
	modes = { "i", "ic", "ix", "R", "Rc", "Rx", "Rv", "Rvc", "Rvx" },
	blending = {
		threshold = 0.75,
		colorcode = "#000000",
		hlgroup = {
			"Normal",
			"background",
		},
	},
	warning = {
		alpha = 0.4,
		colorcode = "#FF0000",
		hlgroup = {
			"Error",
			"background",
		},
	},
}

-- deadcolumn.setup(opts)
deadcolumn.setup({
	modes = { "n", "i", "ic", "ix", "R", "Rc", "Rx", "Rv", "Rvc", "Rvx" },
})
