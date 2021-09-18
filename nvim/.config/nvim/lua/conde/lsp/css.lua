local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- npm install -g vscode-css-languageserver-bin
require'lspconfig'.cssls.setup{
  capabilities = capabilities,
}

