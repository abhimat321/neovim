require("plugins")
require("settings")
require("maps")
require("mason").setup()
require("mason-lspconfig").setup()

-- Default options:
require('kanagawa').setup({


    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true},
    functionStyle = { bold = true},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {
			--neoline sumiink 0
            sumiInk1 = "#1e1e2e", 
			sumiInk3 = "#1b1b2e",
	-- Background sumiInk3
	-- Number bar sumiInk4
	sumiInk4 = "#1b1b2e",
    sumiInk5 = "#1e1e2e", --Selection line
	peachRed = "#f38ba8",
	oniViolet = "#cba6f7"
		},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
})

vim.cmd("colorscheme kanagawa")
--aoeu
