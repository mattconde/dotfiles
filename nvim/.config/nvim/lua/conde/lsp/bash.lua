local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- npm install -g bash-language-server
require'lspconfig'.bashls.setup{
  capabilities = capabilities,
}

