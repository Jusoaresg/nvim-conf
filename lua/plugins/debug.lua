return {
	"mfussenegger/nvim-dap",
	dependencies = {

		{
			"igorlfs/nvim-dap-view",
			opts = {
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
			},
		},
		"williamboman/mason.nvim",
		{
			"jay-babu/mason-nvim-dap.nvim",
			opts = {
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
			},
		},
		{ "leoluz/nvim-dap-go", opts = {} },
	},
	config = function()
		local dap = require("dap")
		local dapview = require("dap-view")

		dap.listeners.after.event_initialized["dapui_config"] = dapview.open
		dap.listeners.before.event_terminated["dapui_config"] = dapview.close
		dap.listeners.before.event_exited["dapui_config"] = dapview.close

		vim.keymap.set("n", "<leader>Bs", dap.continue, { desc = "Debug: Start/Continue" })
		vim.keymap.set("n", "<leader>Bi", dap.step_into, { desc = "Debug: Step Into" })
		vim.keymap.set("n", "<leader>Bn", dap.step_over, { desc = "Debug: Step Over [Next]" })
		vim.keymap.set("n", "<leader>Bo", dap.step_out, { desc = "Debug: Step Out" })
		vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
	end,
}
