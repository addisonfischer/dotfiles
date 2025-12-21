vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<Cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<Cr>gv=gv")
--vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")


vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function ()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>")

vim.keymap.set("n", "<leader>v", ":vsplit<CR>")

vim.keymap.set("n", "<leader>s", [[:s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.api.nvim_set_keymap('n', '<Leader>{', 'A {\n}<Esc>O', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", ":Floaterminal<CR>", { noremap = true, silent = true })

vim.api.nvim_create_user_command("BlankLines", function()
  vim.cmd([[:g/^\s*$/d]])
end, {})

vim.keymap.set("n", "<leader>bl", ":BlankLines<CR>", { desc = "Delete blank lines" })

vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<CR>", { noremap = true, silent = true })
