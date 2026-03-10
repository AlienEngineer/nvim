-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })

-- Code action (mirrors <leader>ca)
vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set({ "n", "v" }, "<C-S-i>", function()
	vim.lsp.buf.code_action({
		filter = function(action)
			return action.title:match("Inline Local Variable") or action.title:match("Inline Method")
		end,
		apply = true,
	})
end, { desc = "Inline Local Variable" })

vim.keymap.set({ "n", "v" }, "<C-S-m>", function()
	vim.lsp.buf.code_action({
		filter = function(action)
			return action.title:match("Extract Method")
		end,
		apply = true,
	})
end, { desc = "Extract Method" })

vim.keymap.set({ "n", "v" }, "<C-S-v>", function()
	vim.lsp.buf.code_action({
		filter = function(action)
			return action.title:match("Extract Local Variable")
		end,
		apply = true,
	})
end, { desc = "Extract Local Variable" })

-- Rename buffer "Delete" actions to "Close" (file is NOT deleted from disk)
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>bD", function()
	Snacks.bufdelete({ force = true })
end, { desc = "Close Buffer + Window" })
vim.keymap.set("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Close Other Buffers" })

-- Disable arrow keys in normal mode with hints
vim.keymap.set("n", "<Up>", function()
	vim.notify("Use 'k' for up instead", vim.log.levels.WARN)
end, { noremap = true })
vim.keymap.set("n", "<Down>", function()
	vim.notify("Use 'j' for down instead", vim.log.levels.WARN)
end, { noremap = true })
vim.keymap.set("n", "<Left>", function()
	vim.notify("Use 'h' for left instead", vim.log.levels.WARN)
end, { noremap = true })
vim.keymap.set("n", "<Right>", function()
	vim.notify("Use 'l' for right instead", vim.log.levels.WARN)
end, { noremap = true })
