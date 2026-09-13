local map = vim.keymap.set
local thunk = require 'utils.fnx'.thunk

----------------------------------------------------------------------------
-- Session keymaps
----------------------------------------------------------------------------
-- load the session for the current directory
map('n', '<leader>sl', thunk('core.persist', 'load'), {
  noremap = true,
  silent = true,
  desc = '[L]oad Last Session Of Current Workspace',
})

-- select a session to load
map(
  'n',
  '<leader>ss',
  thunk('core.persist', 'select'),
  { noremap = true, silent = true, desc = '[S]elect Session' }
)

-- stop Persistence => session won't be saved on exit
map(
  'n',
  '<leader>sd',
  thunk('core.persist', 'deactivate'),
  { noremap = true, silent = true, desc = "[D]on't Save On Exit" }
)

map('n', '<leader>sr', function()
  local sm = require 'core.persist'
  vim.ui.input(
    { prompt = 'Rename Session:', default = sm.current() },
    function(input)
      if input and input ~= '' then
        sm.rename(input)
      else
        vim.notify('Invalid name, nothing changed', vim.log.levels.INFO)
      end
    end
  )
end, { noremap = true, silent = true, desc = '[R]ename current session' })
