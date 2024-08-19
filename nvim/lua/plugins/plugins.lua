local plugins = {
	{ "tiagovla/tokyodark.nvim", opts = {} },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
		dependencies = {


			"hrsh7th/cmp-nvim-lsp",

			{ "hrsh7th/cmp-path",   after = "nvim-cmp" },

			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		}
	},

	--Nui.nvim
	"MunifTanjim/nui.nvim",

	--Telescope


	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {}
	}, --NeoTree

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},


	{
		"nvim-treesitter/nvim-treesitter",
	},


	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.3.0", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!:).
		build = "make install_jsregexp"
	},

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason")
		end,
	},


	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
		dependencies = { "nvim-web-devicons" },
	},


}
local opts = {}
require("lazy").setup(plugins, opts)

--[[

return require("lazy").setup({

		 "tiagovla/tokyodark.nvim",

	{
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
},


{
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("configs.cmp")
        end,
	dependencies = {


    "hrsh7th/cmp-nvim-lsp",

    { "hrsh7th/cmp-path", after = "nvim-cmp" },

    { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
	}
    },



	--catppuccin

	--use{"catppuccin/nvim", as = "catppuccin"}
--catppuccin




	        --Plenary.nvim
        "nvim-lua/plenary.nvim",
	

	
    --Nui.nvim
    "MunifTanjim/nui.nvim",

	--Telescope


	 {

  'nvim-telescope/telescope.nvim', tag = '0.1.6',
   dependencies = { {'nvim-lua/plenary.nvim'} }



},

	--NeoTree

{
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },

{
	"nvim-treesitter/nvim-treesitter",
},


{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	build = "make install_jsregexp"
},

   {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("configs.mason")
        end,
    },


 {
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lsp")
        end,
    },
	
	  {
        "nvim-lualine/lualine.nvim",
        event = "BufEnter",
        config = function()
            require("configs.lualine")
        end,
        dependencies = { "nvim-web-devicons" },
    },


})

]] --
