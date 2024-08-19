local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end


-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")


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
