local actualBf = vim.api.nvim_get_current_buf()
local actualBfName = vim.api.nvim_buf_get_name(actualBf)

local items = {
	"Python Run",
	"Python Test (This File)",
	"Python Test (All)",
}

local function getRootDir()
	return vim.fn.system("git rev-parse --show-toplevel")
end

local function switchCase(selected)
	if selected == items[1] then
		-- Run
		vim.api.nvim_command("!python " .. actualBfName)
	elseif selected == items[2] then
		-- Test this file
		local rootDir = getRootDir()
		local filename = vim.fn.expand("%:t")
		local oldVimDir = vim.fn.system("pwd")
		vim.cmd("cd " .. rootDir)

		local relativeFileDir = vim.fn.system("find . -name " .. filename)

		vim.api.nvim_command("!python -m unittest " .. relativeFileDir)
		vim.cmd("cd " .. oldVimDir)
	elseif selected == items[3] then
		-- Test all
		local rootDir = getRootDir()
		vim.api.nvim_command("!python -m unittest discover " .. rootDir)
	end
end

local function show_select_window()
	vim.ui.select(items, {
		prompt = "Escolha uma opção:",
		format_item = function(item)
			return item
		end,
	}, function(selected)
		if selected then
			print("Você escolheu: " .. selected)
			switchCase(selected)
		end
	end)
end

local function Setup()
	show_select_window()
end

vim.api.nvim_create_user_command("Test", Setup, {})
