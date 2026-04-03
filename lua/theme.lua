local function transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorColumn", { bg = "none" })
end

return {
	vim.pack.add({
		"https://github.com/Lokaltog/vim-monotone",
	}),
	vim.cmd("colorscheme monotone"),

	transparency()
}
