local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- npm install -g vscode-json-languageserver
require'lspconfig'.jsonls.setup{
  capabilities = capabilities,
}

