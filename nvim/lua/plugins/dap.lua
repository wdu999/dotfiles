-- import comment plugin safely
local dap, dapui = require("dap"), require("dapui")

dap.adapters.python = {
	type = "executable",
	command = "/usr/local/bin/python3",
	-- command = "/Users/weidu/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
	args = {
		"-m",
		"debugpy.adapter",
	},
}

dap.configurations.python = {
	{
		-- The first three options are required by nvim-dap
		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		name = "Launch file",

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		program = "${file}", -- This configuration will launch the current file if used.
		pythonPath = function()
			return "/usr/bin/python3"
		end,
		-- pythonPath = function()
		-- 	-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
		-- 	-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
		-- 	-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
		-- 	local cwd = vim.fn.getcwd()
		-- 	if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
		-- 		return cwd .. "/venv/bin/python"
		-- 	elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
		-- 		return cwd .. "/.venv/bin/python"
		-- 	else
		-- 		return "/usr/local/bin/python3"
		-- 	end
		-- end,
	},
}

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
	mappings = {
		edit = "e",
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		repl = "r",
		toggle = "t",
	},
})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- require('dap').set_log_level('INFO')
-- dap.defaults.fallback.terminal_win_cmd = "20split new"
-- vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapBreakpointRejected", { text = "🟦", texthl = "", linehl = "", numhl = "" })
-- vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

-- vim.keymap.set("n", "<leader>dd", function()
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end, { desc = "Dap Continue" })

-- vim.keymap.set("n", "<leader>b", function()
vim.keymap.set("n", "<F6>", function()
	require("dap").toggle_breakpoint()
end, { desc = "Dap Toggle Breakpoint" })

-- vim.keymap.set("n", "<leader>so", function()
-- vim.keymap.set("n", "<F7>", function()
-- 	require("dap").step_over()
-- end)

-- vim.keymap.set("n", "<leader>si", function()
-- vim.keymap.set("n", "<F8>", function()
-- 	require("dap").step_into()
-- end)

-- vim.keymap.set("n", "<leader>sc", function()
-- vim.keymap.set("n", "<F5>", function()
-- 	require("dap").step_out()
-- end)

-- vim.keymap.set("n", "<leader>dr", function()
-- vim.keymap.set("n", "<F6>", function()
-- 	require("dap").run_to_cursor()
-- end)

-- vim.keymap.set("n", "<leader>dl", function()
-- vim.keymap.set("n", "<F7>", function()
-- 	require("dap").run_last()
-- end)

-- vim.keymap.set("n", "<leader>dt", function()
-- vim.keymap.set("n", "<F8>", function()
-- 	require("dap").terminate()
-- end)

vim.keymap.set("n", "<leader>B", function()
	require("dap").clear_breakpoints()
end, { desc = "Dap clear [B]reakpoints" })

-- vim.keymap.set("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

-- vim.keymap.set("n", "<leader>de", function()
-- 	require("dap").set_exception_breakpoints({ "all" })
-- end)
-- vim.keymap.set("n", "<leader>da", function()
-- 	require("debugHelper").attach()
-- end)
-- vim.keymap.set("n", "<leader>dA", function()
-- 	require("debugHelper").attachToRemote()
-- end)
-- vim.keymap.set("n", "<leader>di", function()
-- 	require("dap.ui.widgets").hover()
-- end)
-- vim.keymap.set("n", "<leader>d?", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.scopes)
-- end)
-- vim.keymap.set("n", "<leader>dk", ':lua require"dap".up()<CR>zz')
-- vim.keymap.set("n", "<leader>dj", ':lua require"dap".down()<CR>zz')
-- vim.keymap.set("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
vim.keymap.set("n", "<leader>du", ':lua require"dapui".toggle()<CR>', { desc = "[D]ap[U]i toggle" })
