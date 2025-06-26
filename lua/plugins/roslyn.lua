return {
	"seblj/roslyn.nvim",
	ft = { "cs" },
	opts = {
		-- your configuration comes here; leave empty for default settings
	},

	config = function()
		require("roslyn").setup({})
	end,
}
