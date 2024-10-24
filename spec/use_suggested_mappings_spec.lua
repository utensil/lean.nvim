local lean = require 'lean'
local clean_buffer = require('spec.helpers').clean_buffer

describe('mappings', function()
  it(
    'are bound in the current buffer and not others',
    clean_buffer(function()
      lean.use_suggested_mappings()
      assert.is.same('<Cmd>LeanInfoviewToggle<CR>', vim.fn.maparg('<LocalLeader>i', 'n'))

      vim.cmd.new()
      assert.is.empty(vim.fn.maparg('<LocalLeader>i', 'n'))
      vim.cmd.bwipeout()
    end)
  )
end)
