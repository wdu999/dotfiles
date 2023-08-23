-- import comment plugin safely
local status, comment = pcall(require, "Comment")
if not status then
	print("!!! require Comment fail !!!")
	return
end

-- enable comment
comment.setup({
	ignore = "^$",
})

local ft = require("Comment.ft")

ft.json = { "//%s", "/*%s*/" }
-- ft.yaml = '#%s'

-- 3. Multiple filetypes
-- ft({'go', 'rust'}, {'//%s', '/*%s*/'})
