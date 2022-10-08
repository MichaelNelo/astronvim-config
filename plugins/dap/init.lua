return {
  module = "dap",
  config = function ()
    require("user.plugins.dap.csharp").setup()
  end
}
