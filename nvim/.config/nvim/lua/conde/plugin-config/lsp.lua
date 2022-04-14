local lsp_config = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

local mappings = require('conde/mappings')
local on_attach = function(client, bufnr)
  mappings.lsp_mappings(client, bufnr)
end

-- npm install -g diagnostic-languageserver
lsp_config.diagnosticls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "javascript",
    "javascript.jsx",
    "javascriptreact",
    "typescriptreact",
  },
  init_options = {
    filetypes = {
      javascript = "eslint",
      ["javascript.jsx"] = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint",
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json",
        },
        rootPatterns = {
          ".eslintrc",
          ".eslintrc.json",
          ".eslintrc.cjs",
          ".eslintrc.js",
          ".eslintrc.yml",
          ".eslintrc.yaml"
        },
        debounce = 40,
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity",
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      },
    },
  },
}

-- npm install -g bash-language-server
lsp_config.bashls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- npm install -g vscode-css-languageserver-bin
lsp_config.cssls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- npm install -g graphql-language-service-cli
lsp_config.graphql.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- npm install -g vscode-langservers-extracted
lsp_config.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- npm install -g vscode-json-languageserver
lsp_config.jsonls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- clone and build lua-language-server & add to $PATH
lsp_config.sumneko_lua.setup{}

-- npm install -g flow-bin
lsp_config.flow.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "npx", "--no-install", "flow", "lsp" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
  settings = {
    flow = {
      lazyMode = "ide",
      useBundledFlow = false,
      useNPMPackagedFlow = true,
    }
  }
}

-- npm install -g typescript typescript-language-server
lsp_config.tsserver.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

-- npm install -g vim-language-server
lsp_config.vimls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- brew install rust-analyzer
lsp_config.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

-- npm install -g yaml-language-server
lsp_config.yamlls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

