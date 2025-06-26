return {
	"tpope/vim-fugitive",
	config = function()
		-- NOTE: GIT(Fugitive) Keys
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
	end,
}
