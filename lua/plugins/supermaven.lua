return {
	"supermaven-inc/supermaven-nvim",
	ft = { "gitcommit", "java", "cs" },
	config = function()
		require("supermaven-nvim").setup({})
	end,
}
