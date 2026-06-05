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
		"nvim-mini/mini.pick",
		opts = {
			options = {
				use_cache = true,
			},
		},
		config = function(_, opts)
			local pick = require("mini.pick").setup(opts)

			vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { fg = "#121111", bg = "#d2cfcf" })
			vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<CR>", { desc = "Search Files" })
			vim.keymap.set("n", "<leader>sw", "<cmd>Pick grep_live<CR>", { desc = "Search Word Live" })
			vim.keymap.set("n", "<leader>sW", "<cmd>Pick grep<CR>", { desc = "Search Word" })
			vim.keymap.set("n", "<leader>sr", "<cmd>Pick resume<CR>", { desc = "Search Word" })
			vim.keymap.set("n", "<leader><leader>", "<cmd>Pick buffers<CR>", { desc = "Search Buffers" })
		end,
	},
	{
		"nvim-mini/mini.completion",
		opts = {},
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
		"nvim-mini/mini.hipatterns",
		opts = {

			highlighters = {
				fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
				hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
				todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
				note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			},
		},
		config = function(_, opts)
			local hipatterns = require("mini.hipatterns")
			opts.highlighters.hex_color = hipatterns.gen_highlighter.hex_color()

			hipatterns.setup(opts)
		end,
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
