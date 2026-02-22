return {
	-- NOTE: Yes, you can install new plugins here!
	"mfussenegger/nvim-dap",
	lazy = true,

	-- NOTE: And you can specify dependencies as well
	dependencies = {
		"igorlfs/nvim-dap-view",

		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
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
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
		vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Debug: Set Breakpoint" })

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
	end,
}
