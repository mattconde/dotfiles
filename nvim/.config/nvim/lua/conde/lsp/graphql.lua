local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- npm install -g graphql-language-service-cli
require'lspconfig'.graphql.setup{
  capabilities = capabilities,
}

