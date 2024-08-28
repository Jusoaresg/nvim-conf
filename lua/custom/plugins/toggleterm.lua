return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,

	-- NOTE: Terminal in neovim
	vim.keymap.set("n", "<C-t>", "<cmd>ToggleTerm direction=float <CR>"),
}
