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

  -- so that the only client with format capabilities is efm
  if client.name ~= 'efm' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
          augroup Format
            au! * <buffer>
            au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
          augroup END
        ]]
  end
end

local efmSetup = require('conde/lsp/efm')
efmSetup(on_attach, capabilities)

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

-- set the path to the sumneko installation
local sumneko_root_path = '/Users/gbmajaco/projects/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

lsp_config.sumneko_lua.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

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

