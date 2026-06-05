return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {

				registries = {
					"github:mason-org/mason-registry",
					"github:Crashdummyy/mason-registry",
				},
			},
		},
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
	},
	config = function()
		local servers = {
			pyright = {},
			gopls = {},

			-- HTML
			html = {
				settings = {
					html = {
						format = {
							templating = true,
							wrapLineLength = "120",
							wrapAttributes = "auto",
						},
					},
				},
			},

			emmet_language_server = {
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"typescript",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
					"templ",
				},
			},

			-- CSS
			cssls = {},
			cssmodules_ls = {},
			css_variables = {},

			-- ESLINT
			eslint = {},

			-- JSON - JQ
			jsonls = {},
			jq = {},

			-- DOCKER
			docker_compose_language_service = {},
			dockerls = {},

			clangd = {},
			rust_analyzer = {},

			lua_ls = {
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = {
								"vim",
								"require",
							},
						},
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },

						workspace = {
							checkThirdParty = false,
							telemetry = { enable = false },
							library = {
								"${3rd}/love2d/library",
								"~/.bin/sources/lsp/lua/cc-tweaked/",
								vim.api.nvim_get_runtime_file("", true),
							},
						},
						telemetry = {
							enable = false,
						},
					},
				},
			},
		}
		local capabilities = require("mini.completion").get_lsp_capabilities()
		-- local capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.config("*", { capabilities = capabilities })

		-- INFO: If for some reason want the builtin capabilities way
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

		-- Ensure the servers and tools above are installed
		--  To check the current status of installed tools and/or manually install
		--  other tools, you can run
		--    :Mason
		--
		--  You can press `g?` for help in this menu.
		require("mason").setup({})

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = ensure_installed,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("config-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Rename the variable under your cursor.
				--  Most Language Servers support renaming across files, etc.
				map("<leader>cR", vim.lsp.buf.rename, "[C]ode [R]ename")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				map("K", vim.lsp.buf.hover, "Hover Documentation")

				map("<leader>ci", vim.lsp.buf.implementation, "[C]ode [I]mplementation")
				map("<leader>cr", vim.lsp.buf.references, "[C]ode [R]eferences")

				map("<leader>cD", vim.lsp.buf.declaration, "[C]ode [D]eclaration")
				map("<leader>cd", vim.lsp.buf.definition, "[C]ode [D]efinition")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		-- User commands
		vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {
			desc = "Show LSP Info",
		})

		vim.api.nvim_create_user_command("LspLog", function(_)
			local state_path = vim.fn.stdpath("state")
			local log_path = vim.fs.joinpath(state_path, "lsp.log")

			vim.cmd(string.format("edit %s", log_path))
		end, {
			desc = "Show LSP log",
		})
	end,
}
