local dap = require'dap'

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "Run or test with input",
    metals = {
      runType = "runOrTestFile",
      args = function()
        local args_string = vim.fn.input("Arguments: ")
        return vim.split(args_string, " +")
      end,
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Run or Test",
    metals = {
      runType = "runOrTestFile",
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

dap.listeners.after["event_terminated"]["nvim-metals"] = function(session, body)
  vim.notify("Tests have finished!")
  dap.repl.open()
end
