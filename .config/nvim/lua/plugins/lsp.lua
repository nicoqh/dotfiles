local secrets = require('../secrets')

return {
  {
    ----------------------------------------
    -- mason
    ----------------------------------------

    -- Use Mason to install and manage LSP servers, DAP servers,
    -- linters, and formatters.
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
        },
      },
    }
  },
  ----------------------------------------
  -- mason-lspconfig
  ----------------------------------------
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      -- A list of servers to automatically install if they're not already installed.
      -- See lspconfig config.
      -- lspconfig server names, not mason package names.
      ensure_installed = {
        "html",         -- HTML
        "cssls",        -- CSS
        "jsonls",       -- JSON
        "tailwindcss",  -- Tailwind
        "ts_ls",        -- TypeScript/JavaScript
        "eslint",       -- TypeScript/JavaScript
        "marksman",     -- Markdown
        "intelephense", -- PHP
        "lua_ls",       -- Lua
        --"phpactor",   -- PHP
      },
    }
  },
  {
    -- none-ls allows you to run CLI tools like formatters and linters that have
    -- no language server. It fronts these tools with the LSP so they can integrate
    -- with the LSP. Has built-in support for many tools. You can use Mason
    -- to manage tools.
    "nvimtools/none-ls.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  {
    ----------------------------------------
    -- nvim-lspconf
    ----------------------------------------

    -- Configuring nvim-lspconfig:
    -- https://github.com/neovim/nvim-lspconfig/wiki
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local cmpCapabilities = require('cmp_nvim_lsp').default_capabilities()

      -------------------------------------
      -- Setup language servers.
      -- See mason-lspconfig config
      -------------------------------------
      -- `capabilities` will be merged.
      lspconfig.html.setup { capabilities = cmpCapabilities }
      lspconfig.cssls.setup { capabilities = cmpCapabilities }
      lspconfig.jsonls.setup { capabilities = cmpCapabilities }
      lspconfig.tailwindcss.setup { capabilities = cmpCapabilities }
      lspconfig.ts_ls.setup {
        capabilities = cmpCapabilities,
        on_attach = function(client)
          -- Format with Prettier instead of the language server.
          -- Not really needed if we filter out servers in vim.lsp.buf.format()
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      }
      lspconfig.eslint.setup {}
      lspconfig.marksman.setup { capabilities = cmpCapabilities }
      lspconfig.lua_ls.setup({
        capabilities = cmpCapabilities,
        -- Copied from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
              Lua = {
                runtime = {
                  -- Tell the language server which version of Lua you're using
                  -- (most likely LuaJIT in the case of Neovim)
                  version = 'LuaJIT'
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                  }
                  -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                  -- library = vim.api.nvim_get_runtime_file("", true)
                }
              }
            })

            client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
          end
          return true
        end
      })
      lspconfig.intelephense.setup {
        capabilities = cmpCapabilities,
        init_options = {
          licenceKey = secrets.intelephense.licenceKey,
        }
      }


      ----------------------------------------
      -- Keymaps
      --
      -- https://github.com/neovim/nvim-lspconfig#suggested-configuration
      ----------------------------------------

      -- Global mappings
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

      -- Create a :Format command
      vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

      -- Buffer mappings
      --
      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local function build_opts(opts)
            local result = { buffer = ev.buf }
            if type(opts) == "table" then
              for key, val in pairs(opts) do
                result[key] = val
              end
            end
            return result
          end

          -- Toggle LSP for current buffer
          -- Inspiration: https://github.com/neovim/nvim-lspconfig/wiki/Toggle-LSP-for-current-buffer
          -- Also consider lsp-timeout.nvim, but beware of misbehaving plugins.
          local toggle_lsp_client = function()
            local buf = vim.api.nvim_get_current_buf()
            local clients = vim.lsp.get_active_clients({ bufnr = buf })
            if not vim.tbl_isempty(clients) then
              require("notify")("Stopping LS")
              vim.cmd("LspStop")
            else
              require("notify")("Starting LS")
              vim.cmd("LspStart")
            end
          end

          local opts = { buffer = ev.buf }

          -- Keymaps
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, build_opts({ desc = "Go do declaration" }))
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, build_opts({ desc = "Go to definition" }))
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, build_opts({ desc = "Hover tips" }))
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, build_opts({ desc = "Go to implementation" }))
          --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, build_opts({ desc = "Rename symbol" }))
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, build_opts({ desc = "References" }))
          vim.keymap.set('n', 'gp', function() vim.lsp.buf.format { async = true } end, build_opts({ desc = "Format" }))

          vim.keymap.set('n', '<F4>', toggle_lsp_client, build_opts({ desc = "Toggle LSP attached client" }))
        end
      })

      ----------------------------------------
      -- Auto formatting using language servers
      ----------------------------------------
      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        group = formatting,
        pattern = {
          '*.css',
          '*.html',
          '*.js',
          '*.json',
          '*.jsx',
          '*.lua',
          '*.md',
          '*.php',
          '*.scss',
          '*.ts',
          '*.tsx',
          '*.yaml',
        },
        callback = function()
          -- Format buffer using the attached language server.
          -- No async; don't want to have to save twice
          vim.lsp.buf.format({
            async = false,
            filter = function(client)
              return client.name ~= "ts_ls"
              --return true
            end,
          })
        end,
      })

      -- WIP:
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier, -- Will fall back to global `prettier`
          --null_ls.builtins.formatting.prettierd,
        },
      })
    end,
  }
}
