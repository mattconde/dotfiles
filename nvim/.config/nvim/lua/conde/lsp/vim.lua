local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- npm install -g vim-language-server
require'lspconfig'.vimls.setup{
  capabilities = capabilities,
}

