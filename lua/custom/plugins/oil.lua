return {
	-- NOTE: File Manager OIL

	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
			-- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
			default_file_explorer = true,
			-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
			skip_confirm_for_simple_edits = true,

			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
			},

			-- NOTE: VIM Oil config (File explorer)
			vim.api.nvim_create_user_command("Ex", "Oil <args>", { nargs = "?", complete = "dir" }),
			vim.api.nvim_create_user_command("E", "Oil <args>", { nargs = "?", complete = "dir" }),
			vim.keymap.set("n", "<leader>F", "<cmd>Oil<cr>"),
		})
	end,
}
