-- [[ ==== Shorcut function to set keymaps ================ ]] {{{1
local map = function(mode, lhs, rhs, description, opts)
  local options = { noremap = true, silent = true, desc = description }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  --  See `:help vim.keymap.set()`
  vim.keymap.set(mode, lhs, rhs, options)
end
-- }}}1

-- [[ ==== Buffers & files ================================ ]] {{{1

-- Navigation
map('n', '<A-;>', vim.cmd.bnext, 'Next buffer')
map('n', '<A-,>', vim.cmd.bprevious, 'Previous buffer')

-- Close buffer
map('n', '<A-d>', vim.cmd.bdelete, 'Close buffer')

-- Save buffer
map('n', '<C-s>', vim.cmd.update, 'Save file if needed')
map('x', '<C-s>', vim.cmd.update, 'Save file if needed')
map('i', '<C-s>', function()
  vim.cmd.stopinsert()
  vim.cmd.update()
end, 'Save file if needed')
-- }}}1

-- [[ ==== Navigation ===================================== ]] {{{1
map('n', 'k', "v:count == 0 ? 'gk' : 'k'")
map('n', 'j', "v:count == 0 ? 'gj' : 'j'")
-- }}}1

-- [[ ==== Highlights ===================================== ]] {{{1

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
-- See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    -- See `:help vim.hl.on_yank()`
    vim.hl.on_yank()
  end,
})
-- }}}1

-- [[ ==== Visual selection actions ======================= ]] {{{1

map('v', '<A-j>', [[:m '>+1<CR>gv=gv]], 'Move selection lower')
map('v', '<A-k>', [[:m '<-2<CR>gv=gv]], 'Move selection upper')

map('v', '<', '<gv', 'Loose one level of indentation')
map('v', '>', '>gv', 'Gain one level of indentation')

-- mouse release send selection to clipboard
map('v', '<LeftRelease>', '"+ygv')

-- Substitution
map('x', '<Leader>p', '"_dP', 'Substitute selection by the previous yanked expression')
-- }}}1

-- [[ ==== Diagnostic keymaps ============================= ]] {{{1
-- map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- }}}1

-- [[ ==== Terminal mode shortcuts ======================== ]] {{{1
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode')
-- }}}1

-- [[ ==== Misc =========================================== ]] {{{1
map('n', 'J', 'mzJ`z', 'Join multiple lines')
-- }}}1

-- [[ ==== ================================================ ]] {{{1
-- }}}1

-- vim: ts=2 sts=2 sw=2 et foldmethod=marker foldlevel=0
