return {
	"stevearc/oil.nvim",
	opts = {
		-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
		-- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
		default_file_explorer = true,
		columns = {
			"icon",
			"permissions",
			"size",
			"mtime",
		},
		-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
		skip_confirm_for_simple_edits = true,

		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_user_command("Ex", "Oil <args>", { nargs = "?", complete = "dir" })
		vim.api.nvim_create_user_command("E", "Oil <args>", { nargs = "?", complete = "dir" })
		vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "[O]il File Manager" })

		require("oil").setup(opts)
	end,
}
