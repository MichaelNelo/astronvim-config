local M = {}

local HOME = os.getenv("HOME")
local ADAPTER_PATH = HOME .. "/.local/share/nvim/mason/bin"

function M.setup()
  local dap = require("dap")

  dap.adapters.coreclr = {
    type = "executable",
    command = ADAPTER_PATH .. "/netcoredebug",
    args = { "--interpreter=vscode" }
  }

  dap.configurations.cs = {
    {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
          return vim.fn.input('Path to DLL > ', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end,
    },
  }
end

return M
