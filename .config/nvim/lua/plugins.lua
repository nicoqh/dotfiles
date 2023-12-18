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
  -- lazy:         If true, the plugin will only be loaded when needed.
  --               Default: false
  -- enabled:      If false, the plugin will not be included in the spec.
  --               Default: true
  -- event:        Lazy load on event.
  -- ft:           Lazy load on file type.
  -- cmd:          Lazy load on command.
  -- dependencies: List of plugin names or specs that should be loaded when the
  --               plugin loads. Lazy loaded by default. Make sure the plugin
  --               spec has been defined somewhere else.
  -- opts:         Passed to config().
  -- config:       Executed when the plugin loads. Default impl: require(MAIN).setup(opts)
  -- init:         Always executed during startup.
}
