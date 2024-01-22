local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status, telescope = pcall(require, "telescope.builtin")
if status then
    -- Telescope
    map("n", "<S-f>F", telescope.find_files)
    map("n", "<leader>fg", telescope.live_grep)
    map("n", "<leader>fb", telescope.buffers)
    map("n", "<leader>fh", telescope.help_tags)
    map("n", "<leader>fs", telescope.git_status)
    map("n", "<leader>fc", telescope.git_commits)
    
else                          
    print("Telescope not found")
end

-- Save

-- Quit

-- Exit insert mode
--map("i", "", "<ESC>")

-- Windows
map("n", "<C-s>v", "<CMD>vsplit<CR>")
map("n", "<C-s>h", "<CMD>split<CR>")

-- NeoTree
map("n", "<C-b>", "<CMD>Neotree toggle<CR>")

--map("n", "<leader>o", "<CMD>Neotree focus<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>tabnext<CR>")
map("n", "<S-TAB>", "<CMD>tabprevious<CR>")

-- Terminal
map("n", "<C-t>h", "<CMD>ToggleTerm size=11 direction=horizontal<CR>")
map("n", "<C-t>v", "<CMD>ToggleTerm size=40 direction=vertical<CR>")

-- Window Navigation
-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")


vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], { noremap = true })
