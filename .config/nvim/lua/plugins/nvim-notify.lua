-- Better `vim.notify()`

return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
  end,
}
