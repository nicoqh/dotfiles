-- apt install build-essential
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      -- Provides the 'autotag' module
      { "windwp/nvim-ts-autotag" },
      -- opts = { enable_close_on_slash = false }
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Parsers
        ensure_installed = {
          "bash",
          "diff",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "php",
          "python",
          "query",
          "typescript",
          "vim",
          "yaml",
        },

        sync_install = false,

        -- Highlighting
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false
        },

        -- Indentation
        indent = { enable = true },

        -- Incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>ss", -- Set to false to disable one of the mappings
            node_incremental = "<leader>si",
            scope_incremental = "<leader>sc",
            node_decremental = "<leader>sd",
          },
        },

        -- Auto tag, provided by windwp/nvim-ts-autotag
        autotag = {
          enable = true,
          filetypes = {
            -- Explicitly list file types in order to disable PHP
            'html',
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact',
            'svelte',
            'vue',
            'xml',
            'markdown',
          },
        }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    init = function()
      vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true })
    end,
    config = function()
      require 'treesitter-context'.setup({
        enable = true,
        max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20,     -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { { "nvim-treesitter/nvim-treesitter" } },
    config = function()
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = { query = "@function.outer", desc = "outer function" },
              ["if"] = { query = "@function.inner", desc = "inner function" },
              ["ac"] = { query = "@class.outer", desc = "outer class" },
              ["ic"] = { query = "@class.inner", desc = "inner class" },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V',  -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },
          }
        }
      }
    end,
  },
}
