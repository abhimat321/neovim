
local lspconfig = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true
--lspconfig.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false


local border = {
    { "┌", 'FloatBorder' },
    { "─", 'FloatBorder' },
    { "┐", 'FloatBorder' },
    { "│", 'FloatBorder' },
    { "┘", 'FloatBorder' },
    { "─", 'FloatBorder' },
    { "└", 'FloatBorder' },
    { "│", 'FloatBorder' },
}

-- Add the border on hover and on signature help popup window
local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border}),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}
vim.diagnostic.config({
    virtual_text = {
        prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
    },
    float = { border = border },
})


lspconfig.pyright.setup { handlers = handlers , capabilities = capabilities}
lspconfig.clangd.setup { handlers = handlers , capabilities = capabilities}
lspconfig.bashls.setup { handlers = handlers , capabilities = capabilities}
lspconfig.jsonls.setup { handlers = handlers , capabilities = capabilities}
lspconfig.emmet_language_server.setup { handlers = handlers , capabilities = capabilities}
lspconfig.html.setup { handlers = handlers , capabilities = capabilities}


lspconfig.html.setup {
    cmd = {"html-languageserver", "--stdio"},
    filetypes = {"html"},
    init_options = {
        configurationSection = {"html", "css", "javascript"},
        embeddedLanguages = {
            css = true,
            javascript = true
        }
    },
	handlers = handlers, capabilities = capabilities,

}

lspconfig.lua_ls.setup { handlers = handlers , capabilities = capabilities}



lspconfig.biome.setup {handlers = handlers, capabilities = capabilities}
lspconfig.cssls.setup {handlers = handlers, capabilities = capabilities}
lspconfig.tsserver.setup {handlers = handlers, capabilities = capabilities}






--lspconfig.biome.setup({})


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		--vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('i', '<C-s>h', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		-- Buffer local mappings.
		-- See :help vim.lsp.* for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'ff', function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})


local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({
  virtual_text = {
    prefix = '-', -- Could be '●', '▎', 'x'
  }
})
