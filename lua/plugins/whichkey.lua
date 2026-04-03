local M = {}

function M.setup()
	vim.pack.add({
		"https://github.com/folke/which-key.nvim",
	})

	require("which-key").setup()

	require("which-key").add({
		{ "<leader>c", group = "[C]ode" },
		{ "<leader>d", group = "[D]ocument" },
		{ "<leader>r", group = "[R]ename" },
		{ "<leader>s", group = "[S]earch" },
		{ "<leader>w", group = "[W]orkspace" },
		{ "<leader>g", group = "[G]it" },
		{ "<leader>x", group = "[X]ray" },
		--My keys
		{ "<leader>b", group = "[B]uffer" },
		{ "<leader>a", group = "[A]rchive" },
	})
end

return M
