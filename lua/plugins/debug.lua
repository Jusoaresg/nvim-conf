local M = {}

function M.setup()
	vim.pack.add({
		"https://github.com/mfussenegger/nvim-dap",
		--
		-- Dependencies
		"https://github.com/igorlfs/nvim-dap-view",
		"https://github.com/williamboman/mason.nvim",
		"https://github.com/jay-babu/mason-nvim-dap.nvim",
		"https://github.com/leoluz/nvim-dap-go",
		"https://github.com/mfussenegger/nvim-dap-python",
	})

	local dap = require("dap")

	local dapview = require("dap-view")
	require("dap-python").setup("python")

	require("mason-nvim-dap").setup({
		-- Makes a best effort to setup the various debuggers with
		-- reasonable debug configurations
		automatic_setup = true,

		-- You can provide additional configuration to the handlers,
		-- see mason-nvim-dap README for more information
		handlers = {},

		-- You'll need to check that you have the required things installed
		-- online, please don't ask me how to install them :)
		ensure_installed = {
			"netcoredbg",
		},
	})

	-- Basic debugging keymaps, feel free to change to your liking!
	vim.keymap.set("n", "<leader>Bs", dap.continue, { desc = "Debug: Start/Continue" })
	vim.keymap.set("n", "<leader>Bi", dap.step_into, { desc = "Debug: Step Into" })
	vim.keymap.set("n", "<leader>Bn", dap.step_over, { desc = "Debug: Step Over [Next]" })
	vim.keymap.set("n", "<leader>Bo", dap.step_out, { desc = "Debug: Step Out" })
	vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })

	dapview.setup({
		winbar = {
			controls = {
				enabled = true,
				position = "right",
				buttons = {
					"play",
					"step_into",
					"step_over",
					"step_out",
					"step_back",
					"run_last",
					"terminate",
				},
			},
		},
	})

	dap.listeners.after.event_initialized["dapui_config"] = dapview.open
	dap.listeners.before.event_terminated["dapui_config"] = dapview.close
	dap.listeners.before.event_exited["dapui_config"] = dapview.close

	require("dap-go").setup()
end

return M
