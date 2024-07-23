local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end


local status, telescope = pcall(require, "telescope.builtin")
if status then
    -- Telescope
    map("n", "<leader>ff", telescope.find_files)
    map("n", "<leader>fb", telescope.buffers)
    map("n", "<leader>fh", telescope.help_tags)
else
    print("Telescope not found")
end


--Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

--Move Windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")


--Terminal

map("n", "<leader>t", "<CMD>terminal<CR>")
map("t", "<ESC>", "<C-\\><C-n>")


--Other
--
map("n", "<leader>b", "<CMD>Neotree toggle<CR>")
map("n", "<TAB>", "<CMD>tabnext<CR>")
map("n", "<S-TAB>", "<CMD>tabprevious<CR>")
