return {
	vim.pack.add({
		"https://github.com/stevearc/conform.nvim",
	}),

	require("conform").setup({
		notify_on_error = true,
		format_on_save = function(bufnr)
			local disable_filetypes = {
				c = true,
				cpp = true,
				svelte = true,
				html = true,
				templ = true,
			}
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier" },
		},
		keys = {
			{
				"<leader>bf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[B]uffer [F]ormat",
			},
		},
	}),
}
