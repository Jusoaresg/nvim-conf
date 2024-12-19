return {

	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		-- use a release tag to download pre-built binaries
		version = "v0.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			--

			keymap = {
				cmdline = {
					preset = "super-tab",
					["<C-K>"] = { "select_prev", "fallback" },
					["<C-J>"] = { "select_next", "fallback" },
					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },
					["<A-1>"] = {
						function(cmp)
							cmp.accept({ index = 1 })
						end,
					},
					["<A-2>"] = {
						function(cmp)
							cmp.accept({ index = 2 })
						end,
					},
					["<A-3>"] = {
						function(cmp)
							cmp.accept({ index = 3 })
						end,
					},
					["<A-4>"] = {
						function(cmp)
							cmp.accept({ index = 4 })
						end,
					},
					["<A-5>"] = {
						function(cmp)
							cmp.accept({ index = 5 })
						end,
					},
					["<A-6>"] = {
						function(cmp)
							cmp.accept({ index = 6 })
						end,
					},
					["<A-7>"] = {
						function(cmp)
							cmp.accept({ index = 7 })
						end,
					},
					["<A-8>"] = {
						function(cmp)
							cmp.accept({ index = 8 })
						end,
					},
					["<A-9>"] = {
						function(cmp)
							cmp.accept({ index = 9 })
						end,
					},
				},
				preset = "enter",
				["<C-K>"] = { "select_prev", "fallback" },
				["<C-J>"] = { "select_next", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<A-1>"] = {
					function(cmp)
						cmp.accept({ index = 1 })
					end,
				},
				["<A-2>"] = {
					function(cmp)
						cmp.accept({ index = 2 })
					end,
				},
				["<A-3>"] = {
					function(cmp)
						cmp.accept({ index = 3 })
					end,
				},
				["<A-4>"] = {
					function(cmp)
						cmp.accept({ index = 4 })
					end,
				},
				["<A-5>"] = {
					function(cmp)
						cmp.accept({ index = 5 })
					end,
				},
				["<A-6>"] = {
					function(cmp)
						cmp.accept({ index = 6 })
					end,
				},
				["<A-7>"] = {
					function(cmp)
						cmp.accept({ index = 7 })
					end,
				},
				["<A-8>"] = {
					function(cmp)
						cmp.accept({ index = 8 })
					end,
				},
				["<A-9>"] = {
					function(cmp)
						cmp.accept({ index = 9 })
					end,
				},
			},

			completion = {
				menu = {
					draw = {
						columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
						components = {
							item_idx = {
								text = function(ctx)
									return tostring(ctx.idx)
								end,
								highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
							},
						},
					},
				},
			},

			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
}
