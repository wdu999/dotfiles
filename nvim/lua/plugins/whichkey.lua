local status, whichkey = pcall(require, "which-key")
if not status then
	print("!!! require which-key fail !!!")
	return
end

whichkey.setup({})
