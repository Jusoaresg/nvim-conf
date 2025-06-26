return {
	-- lazy.nvim
	{
		"folke/snacks.nvim",
		---@type snacks.Config
		opts = {
			bigfile = {},
			picker = {
				-- your picker configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
				enabled = true,
				win = {
					input = {
						keys = {
							-- to close the picker on ESC instead of going to normal mode,
							["<Esc>"] = { "close", mode = { "n", "i" } },
						},
					},
				},
				formatters = {
					file = {
						filename_first = false, -- display filename before the file path
						truncate = 80,
					},
				},

				matcher = {
					frecency = true,
				},
			},
		},

		keys = {
			{
				"<leader>sr",
				function()
					Snacks.picker.resume()
				end,
				desc = "Resume",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.smart()
				end,
				desc = "Smart Find Files",
			},

			-- Files
			{
				"<leader>sf",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},

			--Buffers
			{
				"<leader><leader>",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},

			--Grep   NOTE: Use Ripgrep
			{
				"<leader>sw",
				function()
					Snacks.picker.grep()
				end,
				desc = "Grep",
			},
			{
				"<leader>sW",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},

			--Git
			{
				"<C-p>",
				function()
					Snacks.picker.git_files()
				end,
				desc = "Find Git Files",
			},

			--Undo History
			{
				"<leader>u",
				function()
					Snacks.picker.undo()
				end,
				desc = "Undo History",
			},

			--Diagnostics
			{
				"<leader>sd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "Diagnostics",
			},
			{
				"<leader>sD",
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = "Buffer Diagnostics",
			},

			--LSP
			{
				"<leader>cr",
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = "References",
			},
			{
				"<leader>cI",
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = "Goto Implementation",
			},
			{
				"<leader>D",
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = "Goto T[y]pe Definition",
			},
			{
				"<leader>cd",
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"<leader>cs",
				function()
					Snacks.picker.lsp_symbols()
				end,
				desc = "LSP Symbols",
			},
			{
				"<leader>cws",
				function()
					Snacks.picker.lsp_workspace_symbols()
				end,
				desc = "LSP Workspace Symbols",
			},
			{
				"<leader>cD",
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = "Goto Declaration",
			},

			--Utils
			{
				"<leader>sk",
				function()
					Snacks.picker.keymaps()
				end,
				desc = "Keymaps",
			},
		},
	},
}
