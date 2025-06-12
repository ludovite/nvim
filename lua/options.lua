-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

local options = {
  -- [[ System ]]

  -- Don’t want backup nor swap files
  backup = false,
  swapfile = false,
  -- Save undo history
  undofile = true,
  -- The encoding written to a file
  fileencoding = 'utf-8',
  -- Enable mouse mode, can be useful for resizing splits for example!
  mouse = 'a',
  mousemoveevent = true,
  -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  writebackup = false,
  -- The font used in graphical neovim applications
  guifont = 'monospace:h17',
  -- Print active filename in window titlebar
  title = true,
  titlestring = [[%F %h%m%r%w NVIM]],
  -- Virtual edit
  virtualedit = 'block',
  -- Configure how new splits should be opened
  splitright = true,
  splitbelow = true,

  -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
  -- instead raise a dialog asking if you wish to save the current file(s)
  -- See `:help 'confirm'`
  confirm = true,

  -- [[ Timers ]]

  -- Faster completion (4000ms default)
  updatetime = 250,
  -- Time to wait for a mapped sequence to complete (in ms). Displays which-key popup sooner
  timeoutlen = 800,

  -- [[ Board UI ]]

  -- Set term gui colors (most terminals support this)
  termguicolors = true,
  -- Make line numbers default
  number = true,
  relativenumber = false,
  -- Set number column width to 3 {default 4}
  numberwidth = 3,
  -- Always show the sign column, otherwise it would shift the text each time
  signcolumn = 'yes',
  -- Don't show the mode, since it's already in the status line
  showmode = false,
  -- Highlight the current line
  cursorline = true,
  -- So that `` is visible in markdown files
  conceallevel = 0,
  -- Space in the neovim command line for displaying messages
  -- cmdheight = 0,
  -- Always show tabs
  showtabline = 2,
  -- Pop up menu height
  -- pumheight = 10,
  -- ??
  -- sidescrolloff = 8,
  -- Minimal number of screen lines to keep above and below the cursor.
  scrolloff = 10,

  -- [[ Indentation & wrapping ]]

  -- Enable break indent
  breakindent = true,
  -- Display lines as one long line if false
  wrap = true,
  -- Word wrapping
  linebreak = true,
  showbreak = '↪ ',
  -- Convert tabs to spaces
  expandtab = true,
  -- The number of spaces inserted for each indentation
  shiftwidth = 4,
  -- Insert 4 spaces for a tab
  tabstop = 4,
  -- Insert 4 spaces for a tab
  softtabstop = 4,

  -- [[ Search and Replace ]]

  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  ignorecase = true,
  smartcase = true,
  -- Make indenting smarter again, but prefer treesitter indent on
  smartindent = false,
  -- Preview substitutions live, as you type!
  inccommand = 'split',
  -- Highlight all matches on previous search pattern
  hlsearch = true,
  incsearch = true,
}

-- [[ Activate these options ]]
for k, v in pairs(options) do
  vim.o[k] = v
end
----------------------------------------------------------------

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim: ts=2 sts=2 sw=2 et
