return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local files_cmd = {
			".git/",
			".vs/",
			"obj/",
			"%.dll",
		}

		local project_root = vim.loop.cwd()

		local csproj_exists = vim.fn.glob(project_root .. "/*.csproj") ~= ""
		local slnx_exists = vim.fn.glob(project_root .. "/*.slnx") ~= ""

		if csproj_exists or slnx_exists then
			table.insert(files_cmd, "bin/")
		end

		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
				file_ignore_patterns = files_cmd,
			},
		})
		telescope.load_extension("fzf")
		telescope.load_extension("undo")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>cd", builtin.lsp_definitions, { desc = "[C]ode [D]efinition" })
		vim.keymap.set("n", "<leader>cr", builtin.lsp_references, { desc = "[C]ode [R]eferentes" })

		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })

		vim.keymap.set("n", "<leader>sw", builtin.live_grep, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sW", builtin.grep_string, { desc = "[S]earch current [W]ord" })

		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "[ ] Git files" })

		vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>", { desc = "[S]earch Undo Tree" })
	end,
}
