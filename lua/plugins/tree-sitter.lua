local M = {}

function M.ensure_to_install()
	local ensure_installed = {
		"bash",
		"c",
		"html",
		"lua",
		"luadoc",
		"markdown",
		"vim",
		"vimdoc",
	}

	local already_installed = require("nvim-treesitter.config").get_installed()
	local parsers_to_install = vim.iter(ensure_installed)
		:filter(function(parser)
			return not vim.tbl_contains(already_installed, parser)
		end)
		:totable()
	require("nvim-treesitter").install(parsers_to_install)
end

function M.setup()
	vim.pack.add({
		"https://github.com/nvim-treesitter/nvim-treesitter",
		"https://github.com/nvim-treesitter/nvim-treesitter-context",
	})

	-- build = ":TSUpdate",
	-- branch = "master",
	require("nvim-treesitter").setup({
		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = { enable = true, disable = { "ruby" } },
	})
	M.ensure_to_install()

	require("treesitter-context").setup({
		enable = true, -- Habilita o plugin
		max_lines = 5, -- Máximo de linhas de contexto
		trim_scope = "outer", -- Ou "inner"
		mode = "cursor", -- Pode ser "topline" também
		separator = "-", -- Você pode definir um separador como "─"
		zindex = 20,
		on_attach = nil,
	})
end

return M
