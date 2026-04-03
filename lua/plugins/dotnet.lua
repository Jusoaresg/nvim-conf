return {
	vim.pack.add({
		"https://github.com/seblyng/roslyn.nvim"
	})
	-- vim.pack.add({
	-- 	"https://github.com/GustavEikaas/easy-dotnet.nvim",
	-- 	"https://github.com/nvim-lua/plenary.nvim",
	-- 	"https://github.com/nvim-telescope/telescope.nvim",
	-- }),
	--
	-- require("easy-dotnet").setup({
	-- 	lsp = {
	-- 		enabled = true, -- Enable
	-- 		preload_roslyn = true, -- Start loading roslyn before any buffer is opened
	-- 		roslynator_enabled = true, -- Automatically enable roslynator analyzer
	-- 		easy_dotnet_analyzer_enabled = true, -- Enable roslyn analyzer from easy-dotnet-server
	-- 		auto_refresh_codelens = true,
	-- 		analyzer_assemblies = {}, -- Any additional roslyn analyzers you might use like SonarAnalyzer.CSharp
	-- 		config = {},
	-- 	},
	-- }),
}
