local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- npm install -g vscode-langservers-extracted
require'lspconfig'.html.setup{
  capabilities = capabilities,
}

