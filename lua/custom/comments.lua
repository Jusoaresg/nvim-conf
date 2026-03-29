-- NOTE: Comment strings
return {

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "templ",
		callback = function()
			vim.bo.commentstring = "// %s"
		end,
	}),

	vim.api.nvim_create_autocmd("FileType", {
		pattern = "svelte",
		callback = function()
			vim.bo.commentstring = "<!-- %s -->"
		end,
	}),

	-- Make commands
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "rust",
		callback = function()
			vim.opt_local.makeprg = "cargo build"
		end,
	}),
}
