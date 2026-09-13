local map = vim.keymap.set

----------------------------------------------------------------------------
-- Tab related
----------------------------------------------------------------------------
map(
  { 'n' },
  ']t',
  '<cmd>tabnext<cr>',
  { noremap = true, silent = true, desc = '[T]ab Next' }
)

map(
  { 'n' },
  '[t',
  '<cmd>tabprevious<cr>',
  { noremap = true, silent = true, desc = '[T]ab Previous' }
)

map(
  { 'n' },
  '<leader>tnn',
  '<cmd>tabnew<cr>',
  { noremap = true, silent = true, desc = '[N]ew' }
)

map({ 'n' }, '<leader>tnN', function()
  local name = vim.fn.input('Tab name: ')
  vim.cmd 'tabnew'
  if name ~= '' then
    require 'core.bpm'.rename_tab(vim.api.nvim_get_current_tabpage(), name)
  end
end, { noremap = true, silent = true, desc = '[N]ew with name' })

map({ 'n' }, '<leader>ta', '<cmd>tabnew %<cr>', {
  noremap = true,
  silent = true,
  desc = '[A]dd With Current Buffer',
})

map({ 'n' }, '<leader>tr', function()
  local bpm = require 'core.bpm'
  vim.ui.input({
    prompt = 'New Tab Name',
    default = bpm.resolve_tabname(vim.api.nvim_get_current_tabpage()),
  }, function(input)
    if input and input ~= '' then
      bpm.rename_tab(vim.api.nvim_get_current_tabpage(), input)
    else
      vim.notify('Invalid name, nothing changed', vim.log.levels.INFO)
    end
  end)
end, {
  noremap = true,
  silent = true,
  desc = '[R]ename',
})

map(
  { 'n' },
  '<leader>tc',
  '<cmd>tabclose<cr>',
  { noremap = true, silent = true, desc = '[C]lose' }
)
