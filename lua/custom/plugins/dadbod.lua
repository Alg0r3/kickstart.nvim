return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  keys = {
    { '|', '<cmd>DBUIToggle<CR>', desc = '[T]oggle [D]BUI' },
  },
  -- Configuration that must run BEFORE plugin loads
  init = function()
    vim.g.db_ui_win_position = 'right'
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  -- Configuration that runs AFTER plugin loads
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dbui',
      callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
      end,
    })
  end,
}
