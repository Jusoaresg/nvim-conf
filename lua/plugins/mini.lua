local M = {}

function M.setup()
	vim.pack.add({
		{
			src = "https://github.com/nvim-mini/mini.splitjoin",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.pick",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.completion",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.diff",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.clue",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.cmdline",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.hipatterns",
			version = "main",
		},
		{
			src = "https://github.com/nvim-mini/mini.notify",
			version = "main",
		},
	})

	require("mini.splitjoin").setup({
		mappings = {
			toggle = "m",
			split = "",
			join = "",
		},
	})

	require("mini.pick").setup({
		options = {
			use_cache = true,
		},
	})
	vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { fg = "#121111", bg = "#d2cfcf" })
	vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<CR>", { desc = "Search Files" })
	vim.keymap.set("n", "<leader>sw", "<cmd>Pick grep_live<CR>", { desc = "Search Word Live" })
	vim.keymap.set("n", "<leader>sW", "<cmd>Pick grep<CR>", { desc = "Search Word" })
	vim.keymap.set("n", "<leader>sr", "<cmd>Pick resume<CR>", { desc = "Search Word" })
	vim.keymap.set("n", "<leader><leader>", "<cmd>Pick buffers<CR>", { desc = "Search Buffers" })

	local completion = require("mini.completion")
	local kind_priority = { Text = -1, Snippet = 99 }
	local opts = { filtersort = "fuzzy", kind_priority = kind_priority }
	local process_items = function(items, base)
		return completion.default_process_items(items, base, opts)
	end

	completion.setup({
		lsp_completion = { process_items = process_items },
	})

	require("mini.diff").setup()
	local miniclue = require("mini.clue")
	miniclue.setup({
		triggers = {

			{ mode = "n", keys = "<leader>" },
			{ mode = "n", keys = "g" },
			{ mode = "n", keys = "[" },
			{ mode = "n", keys = "]" },
			{ mode = { "n", "x" }, keys = "g" },
			{ mode = { "n", "x" }, keys = '"' },
			{ mode = { "i", "c" }, keys = "<C-r>" },
		},
		clues = {
			{ mode = "n", keys = "<leader>c", desc = "+Code" },
			{ mode = "n", keys = "<leader>d", desc = "+Document" },
			{ mode = "n", keys = "<leader>s", desc = "+Search" },
			{ mode = "n", keys = "<leader>b", desc = "+Buffer" },
			{ mode = "n", keys = "<leader>B", desc = "+Debug" },
			{ mode = "n", keys = "<leader>a", desc = "+Archives" },

			miniclue.gen_clues.square_brackets(),
			miniclue.gen_clues.g(),
			miniclue.gen_clues.registers(),
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
	})
	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})

	require("mini.notify").setup({
		lsp_progress = {
			enable = true,
		},
	})
end

return M
