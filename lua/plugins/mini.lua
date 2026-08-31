return {
	{
		"nvim-mini/mini.splitjoin",
		opts = {

			mappings = {
				toggle = "m",
				split = "",
				join = "",
			},
		},
		config = function(_, opts)
			require("mini.splitjoin").setup(opts)
		end,
	},
	{
		"nvim-mini/mini.diff",
		config = function(_, opts)
			require("mini.diff").setup(opts)
		end,
	},
	{
		"nvim-mini/mini.clue",
		opts = {

			triggers = {

				{ mode = "n", keys = "<leader>" },
				{ mode = "n", keys = "g" },
				{ mode = "n", keys = "[" },
				{ mode = "n", keys = "]" },
				{ mode = { "n", "x" }, keys = "g" },
				{ mode = { "n", "x" }, keys = '"' },
				{ mode = { "i", "c" }, keys = "<C-r>" },
			},
			window = {
				delay = 200,
				config = {
					width = "auto",
					anchor = "SW",
					row = "auto",
					col = "auto",
				},
			},
		},
		config = function(_, opts)
			local miniclue = require("mini.clue")
			opts.clues = {
				{ mode = "n", keys = "<leader>c", desc = "+Code" },
				{ mode = "n", keys = "<leader>d", desc = "+Document" },
				{ mode = "n", keys = "<leader>s", desc = "+Search" },
				{ mode = "n", keys = "<leader>b", desc = "+Buffer" },
				{ mode = "n", keys = "<leader>B", desc = "+Debug" },
				{ mode = "n", keys = "<leader>a", desc = "+Archives" },

				miniclue.gen_clues.square_brackets(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.registers(),
			}
			miniclue.setup(opts)
		end,
	},
	{
		"nvim-mini/mini.cmdline",
	},
	{
		"nvim-mini/mini.notify",
		opts = {

			lsp_progress = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("mini.notify").setup(opts)
		end,
	},
}
