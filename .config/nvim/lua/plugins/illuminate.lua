return {
  -- Highlighting other uses of the word under the cursor
  'RRethy/vim-illuminate',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    -- Providers used to get references in the buffer, ordered by priority
    providers = {
      'lsp',
      --'treesitter', -- https://github.com/RRethy/vim-illuminate/issues/247
      'regex',
    },
    delay = 400,
    filetypes_denylist = {
      'NvimTree',
      'dirbuf',
      'dirvish',
      'fugitive',
      'git',
      'markdown',
      'text',
    },
    modes_allowlist = { 'n', 'no', 'nt' },
  },
  config = function(_, opts)
    require('illuminate').configure(opts)
  end,
}
