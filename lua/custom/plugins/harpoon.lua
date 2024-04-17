return {
	{
		"ThePrimeagen/harpoon",
		keys = {
			{
				"<leader>H",
				function()
					require("harpoon.mark").add_file()
				end,
				desc = "Mark file harpoon",
			},
			{
				"<leader>h",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Toggle quick Harpoon menu",
			},
			{
				"<leader>1",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Go to harpoon file 1",
			},
			{
				"<leader>2",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Go to harpoon file 2",
			},
			{
				"<leader>3",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Go to harpoon file 3",
			},
			{
				"<leader>4",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "Go to harpoon file 4",
			},
		},
	},
}
