return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",

		version = "v0.*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = function(_, opts)
			opts.cmdline = {
				enabled = true,
				keymap = {
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
			}

			opts.keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept", "fallback" },
				["<Tab>"] = { "select_and_accept", "fallback" },
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
			}

			opts.completion = {
				list = {
					selection = { preselect = false, auto_insert = false },
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 150,
				},
				menu = {
					draw = {
						-- columns = { { "item_idx" }, { "kind_icon" }, { "label", "label_description", gap = 1 } },
						columns = { { "item_idx", "label", "label_description", gap = 1 }, { "kind" } },
						components = {
							item_idx = {
								text = function(ctx)
									return tostring(ctx.idx)
								end,
								highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
							},
						},
						treesitter = { "lsp" },
					},
				},
				accept = {
					auto_brackets = {
						enabled = false,
					},
				},
			}
			opts.fuzzy = {
				sorts = {
					"score", -- Primary sort: by fuzzy matching score
					"sort_text", -- Secondary sort: by sortText field if scores are equal
					"kind",
					"label", -- Tertiary sort: by label if still tied
				},
			}

			opts.appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			}

			opts.sources = {
				default = { "lsp", "snippets", "path", "buffer" },
			}

			opts.signature = {
				enabled = true,
				window = {
					show_documentation = false,
				},
			}
			return opts
		end,
		opts_extend = { "sources.default" },
	},
}
