-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Repalce ; with : to enter command mode
map({ "n", "v" }, ";", ":", { desc = "Enter command mode" })

-- Resize window using <ctrl> + <shift> + hjkl
map("n", "<C-S-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-S-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-S-k>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-S-j>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })

-- Navigate buffers using <leader> + number
for i = 1, 9 do
  map("n", "<leader>" .. i, function()
    require("bufferline").go_to(i, true)
  end, { desc = "Go to buffer " .. i })
end

-- Move buffer to the left
map("n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })

-- Move buffer to the right
map("n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })
