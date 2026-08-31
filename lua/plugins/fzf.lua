return {
	"ibhagwan/fzf-lua",
	config = function()
		local files_cmd = "rg --files --hidden "
			.. "--glob '!.git/*' "
			.. "--glob '!.vs/*' "
			.. "--glob '!**/obj/*' "
			.. "--glob '!**/*.dll'"

		local project_root = vim.loop.cwd()

		local csproj_exists = vim.fn.glob(project_root .. "/*.csproj") ~= ""
		local slnx_exists = vim.fn.glob(project_root .. "/*.slnx") ~= ""

		if csproj_exists or slnx_exists then
			files_cmd = files_cmd .. " --glob '!**/bin/*'"
		end

		require("fzf-lua").setup({
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},

			files = {
				cmd = files_cmd,
			},
			previewers = {
				builtin = {
					-- The previewer will not add syntax highlighting to files larger than 100KB
					syntax_limit_b = 1024 * 100, -- 100KB
				},
			},
			grep = {
				rg_glob = true, -- enable glob parsing
				glob_flag = "--iglob", -- case insensitive globs
				glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
			},
		})
		local fzf = require("fzf-lua")

		vim.keymap.set("n", "<leader>cd", fzf.lsp_definitions, { desc = "[C]ode [D]efinition" })

		vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>ss", fzf.builtin, { desc = "[S]earch [S]elect Telescope" })
		vim.keymap.set("n", "<leader>sw", fzf.grep, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sh", fzf.help_tags, { desc = "[S]earch [H]elp" })

		vim.keymap.set("n", "<leader>sW", fzf.grep_cWORD, { desc = "[S]earch current [W]ord" })

		vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics Document" })
		vim.keymap.set("n", "<leader>sD", fzf.diagnostics_workspace, { desc = "[S]earch [D]iagnostics Workspace" })

		vim.keymap.set("n", "<leader>sr", fzf.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>s.", fzf.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<C-p>", fzf.git_files, { desc = "[ ] Git files" })
	end,
}
