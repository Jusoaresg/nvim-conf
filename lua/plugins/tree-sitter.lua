return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true, -- Habilita o plugin
				max_lines = 5, -- Máximo de linhas de contexto
				trim_scope = "outer", -- Ou "inner"
				mode = "cursor", -- Pode ser "topline" também
				separator = "-", -- Você pode definir um separador como "─"
				zindex = 20,
				on_attach = nil,
			},
		},
	},
	opts = {

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
		nsure_installed = {
			"bash",
			"c",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"vim",
			"vimdoc",
		},
	},
}
