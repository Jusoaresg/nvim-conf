return {
	"jusoaresg/dired.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		-- Neovim configuration for the 'dired' plugin

		vim.keymap.set("n", "<leader>o-", vim.cmd.Dired, { desc = "[O]pen Dired" })

		vim.api.nvim_create_user_command("Ex", "Dired <args>", { nargs = "?", complete = "dir" })
		vim.api.nvim_create_user_command("E", "Dired <args>", { nargs = "?", complete = "dir" })

		-- Set up the 'dired' plugin with custom options
		require("dired").setup({
			path_separator = "/", -- Use '/' as the path separator
			show_hidden = true, -- Show hidden files
			show_icons = false, -- Show icons (patched font required)
			show_banner = false, -- Do not show the banner
			hide_details = false, -- Show file details by default
			sort_order = "name", -- Sort files by name by default

			-- Define keybindings for various 'dired' actions
			keybinds = {
				dired_enter = "<cr>",
				dired_back = "-",
				dired_up = "_",
				dired_rename = "R",
				-- ... (add more keybindings as needed)
				dired_quit = "q",
				dired_unmove = "x",
			},

			-- Define colors for different file types and attributes
			colors = {
				DiredDimText = { link = {}, bg = "NONE", fg = "505050", gui = "NONE" },
				DiredDirectoryName = { link = {}, bg = "NONE", fg = "9370DB", gui = "NONE" },
				-- ... (define more colors as needed)
				DiredMoveFile = { link = {}, bg = "NONE", fg = "ff3399", gui = "bold" },
			},
		})
	end,
}
