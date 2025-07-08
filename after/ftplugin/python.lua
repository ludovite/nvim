vim.lsp.config('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {
            'E203', -- whitespace before `:` warning
          },
          maxLineLength = 100,
        },
      },
    },
  },
})
