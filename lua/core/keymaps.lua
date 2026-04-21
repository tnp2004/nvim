vim.g.mapleader = " "

vim.keymap.set("n", "<Esc>", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "move to start of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "move to end of line" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })

-- File tree
vim.keymap.set("n", "<leader>e", function()
	local view = require("nvim-tree.view")
	local api = require("nvim-tree.api")

	if not view.is_visible() then
		api.tree.toggle()
	else
		api.tree.close()
	end
end, { desc = "toggle file explorer tree" })

-- Conform
vim.keymap.set({ "n", "v" }, "<leader>fm", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format whole file or range (in visual mode) with" })

-- fff.nvim
vim.keymap.set("n", "ff", function()
	require("fff").find_files()
end, { desc = "FFFind files" })

-- Bufferline
vim.keymap.set("n", "<Tab>", "<Cmd>bnext<CR>", { desc = "go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<Cmd>bprevious<CR>", { desc = "go to previous buffer" })

-- Mini
vim.keymap.set("n", "<C-q>", function()
	require("mini.bufremove").delete(0, false)
end)
vim.keymap.set("n", "<C-n>", function()
	local minifiles = require("mini.files")
  if not minifiles.close() then minifiles.open() end
end)
vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniStarterOpened',
  callback = function()
    local ministarter = require("mini.starter")
    vim.keymap.set('n', '<C-k>',  function() ministarter.update_current_item('prev') end, { buffer = true })
    vim.keymap.set('n', '<C-j>', function() ministarter.update_current_item('next') end, { buffer = true })
  end,
})
