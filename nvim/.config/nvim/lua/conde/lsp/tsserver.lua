local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
  -- filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

