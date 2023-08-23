-- import gitsigns plugin safely
local status, gitsigns = pcall(require, "gitsigns")
if not status then
	print("!!! require gitsigns fail !!!")
	return
end

-- configure/enable gitsigns
gitsigns.setup()
