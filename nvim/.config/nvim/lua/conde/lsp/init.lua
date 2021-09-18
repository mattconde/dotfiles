local lsp_config = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('conde/lsp/efm')

-- npm install -g bash-language-server
lsp_config.bashls.setup{
  capabilities = capabilities,
}

-- npm install -g vscode-css-languageserver-bin
lsp_config.cssls.setup{
  capabilities = capabilities,
}

-- npm install -g graphql-language-service-cli
lsp_config.graphql.setup{
  capabilities = capabilities,
}

-- npm install -g vscode-langservers-extracted
lsp_config.html.setup{
  capabilities = capabilities,
}

-- npm install -g vscode-json-languageserver
lsp_config.jsonls.setup{
  capabilities = capabilities,
}

-- set the path to the sumneko installation
local sumneko_root_path = '/Users/gbmajaco/projects/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

lsp_config.sumneko_lua.setup{
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

-- npm install -g typescript typescript-language-server
lsp_config.tsserver.setup{
  capabilities = capabilities,
}

-- npm install -g vim-language-server
lsp_config.vimls.setup{
  capabilities = capabilities,
}

