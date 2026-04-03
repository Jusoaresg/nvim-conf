local M = {}

function M.setup()
	vim.pack.add({
		"https://github.com/L3MON4D3/LuaSnip",
		"https://github.com/rafamadriz/friendly-snippets",
	})

	local ls = require("luasnip")
	local s = ls.snippet
	local t = ls.text_node
	local i = ls.insert_node

	ls.add_snippets("all", {
		s("lorem", {
			t({
				"Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
				"sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
			}),
		}),
	})

	ls.add_snippets("cs", {
		s("summary", {
			t("///<summary>"),
			t({ "", "/// " }),
			i(1, "Description"),
			t({ "", "///</summary>" }),
			i(0),
		}),
	})
end

return M
