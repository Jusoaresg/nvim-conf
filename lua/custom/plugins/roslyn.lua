return {
	"seblj/roslyn.nvim",
	ft = "cs",
	opts = {
		-- your configuration comes here; leave empty for default settings
	},

	init = function()
		require("roslyn").setup({})
	end,
}
