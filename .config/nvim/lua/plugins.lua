-- See plugins/

return {
  -- Alternative way:
  --{
  --"folke/trouble.nvim",
  --config = function()
  --require("plugins.trouble")
  ---- Set up the plugin in ./plugins/trouble.lua like this:
  ---- require("trouble").setup({
  ----   position = "bottom"
  ---- })
  --end,
  --},

  ----------------------------------------
  -- Plugin spec
  ----------------------------------------
  -- lazy: if true, the plugin will only be loaded when needed. Default: false
  -- enabled: if false, the plugin will not be included in the spec
  -- event: lazy load on event
  -- ft: lazy load on file type
  -- cmd: lazy load on command
  -- opts: Passed to config()
  -- config: Executed when the plugin loads. Default impl: require(MAIN).setup(opts)
  -- init: Always executed during startup
}
