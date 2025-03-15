local dap = require("dap")
require("dapui").setup()

vim.keymap.set('n', "<leader>dc", dap.continue, {})
vim.keymap.set('n', "<leader>dt", dap.toggle_breakpoint, {})

dap.adapters.gdb = {
  type = "executable",
  command= "gdb",
  args = { "-i", "dap", }
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
    end,
    cwd = "${workspaceFolder}"
  }
}

dap.configurations.cpp = dap.configurations.c
