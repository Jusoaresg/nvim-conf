return {
	--NOTE: Make commands
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "rust",
		callback = function()
			vim.opt_local.makeprg = "cargo build"
		end,
	}),
}
