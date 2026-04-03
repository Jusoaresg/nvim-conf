local M = {}

function M.setup()
	vim.pack.add({
		{
			src = "https://github.com/nvim-mini/mini.splitjoin",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.pick",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.completion",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.diff",
			version = "main",
		},
	})

	require("mini.splitjoin").setup({
		mappings = {
			toggle = "m",
			split = "",
			join = "",
		},
	})

	require("mini.pick").setup({
		options = {
			use_cache = true,
		},
	})
	vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { fg = "#121111", bg = "#d2cfcf" })
	vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<CR>", { desc = "[S]earch [R]esume" })
	vim.keymap.set("n", "<leader>sw", "<cmd>Pick grep_live<CR>", { desc = "[S]earch [W]ord Live" })
	vim.keymap.set("n", "<leader>sW", "<cmd>Pick grep<CR>", { desc = "[S]earch [W]ord" })
	vim.keymap.set("n", "<leader>sr", "<cmd>Pick resume<CR>", { desc = "[S]earch [W]ord" })
	vim.keymap.set("n", "<leader><leader>", "<cmd>Pick buffers<CR>", { desc = "Buffers" })

	require("mini.completion").setup()
	require("mini.diff").setup()
end

return M
