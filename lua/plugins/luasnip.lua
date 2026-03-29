return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
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
	end,
}
