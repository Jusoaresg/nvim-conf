local function transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "CursorColumn", { bg = "none" })
end

return {
	"Lokaltog/vim-monotone",
	config = function()
		vim.cmd("colorscheme monotone")
		transparency()
	end,
}
