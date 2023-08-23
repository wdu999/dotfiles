-- import colorizer plugin safely
local status, colorizer = pcall(require, "colorizer")
if not status then
	print("!!! require colorizer fail !!!")
	return
end

colorizer.setup()
