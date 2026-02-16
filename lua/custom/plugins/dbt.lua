-- Python
return {
  {
    'PedramNavid/dbtpal',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    ft = {
      'sql',
      'md',
      'yaml',
    },
    keys = {
      { '<leader>drf', '<cmd>DbtRun<cr>' },
      { '<leader>drp', '<cmd>DbtRunAll<cr>' },
      { '<leader>dtf', '<cmd>DbtTest<cr>' },
      { '<leader>dm', "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
    },
    config = function()
      local profiles_dir = vim.env.DBT_PROFILES_DIR
      require('dbtpal').setup {
        path_to_dbt = 'dbt',
        path_to_dbt_project = '',
        path_to_dbt_profiles_dir = profiles_dir or vim.fn.expand '~/.dbt',
        include_profiles_dir = profiles_dir ~= nil,
        include_project_dir = true,
        include_log_level = true,
        extended_path_search = true,
        protect_compiled_files = true,
        pre_cmd_args = {},
        post_cmd_args = {},
      }
      require('telescope').load_extension 'dbtpal'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
