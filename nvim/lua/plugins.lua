vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})


return require("packer").startup(function(use)
    -- Packer

  use("wbthomason/packer.nvim")

    -- Common utilities
    use("nvim-lua/plenary.nvim")
    use("folke/tokyonight.nvim")

    -- Icons
    use("nvim-tree/nvim-web-devicons")
--Lualine 
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}

--  telescope
    use {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}



    -- Colorscheme
    use("rebelot/kanagawa.nvim")

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("configs.treesitter")
        end,
    })

    use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
    use("onsails/lspkind-nvim")
    -- Telescope

 --   use("onsails/lspkind-nvim")
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v<CurrentMajor>.*",
    })

    -- cmp: Autocomplete


    use("hrsh7th/cmp-nvim-lsp")

    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("configs.cmp")
        end,
    })
    -- LSP diagnostics, code actions, and more via Lua.
 --   use({
  --      "jose-elias-alvarez/null-ls.nvim",
   --     config = function()
    --        require("configs.null-ls")
     --   end,
      --  requires = { "nvim-lua/plenary.nvim" },
    --})

    -- Mason: Portable package manager
    use({
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    })

    use({
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("configs.mason-lsp")
        end,
    })
    -- LSP
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.lsp")
        end,
    })

    -- File manager
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    })

    -- Show colors
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "*" })
        end,
    })

    -- Terminal
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("configs.toggleterm")
        end,
    })

    -- Git
   -- use({
     --   "lewis6991/gitsigns.nvim",
      --  config = function()
        --    require("configs.gitsigns")
       -- end,
--    })

    -- Markdown Preview
-- install without yarn or npm
    -- Auto pairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("configs.autopairs")
        end,
    })

  -- Catppuccin
  use { "catppuccin/nvim", as = "catppuccin" }
    -- Background Transparent
end)
