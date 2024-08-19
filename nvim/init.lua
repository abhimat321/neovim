
require("settings")
require("maps")

require("configs.lazy")
require("plugins.plugins")
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
		border = "double"
    }
})
vim.cmd("colorscheme tokyodark")
--aoeu

