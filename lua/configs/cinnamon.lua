local status_ok, cinnamon = pcall(require, "cinnamon")
if status_ok then
  cinnamon.setup(astronvim.user_plugin_opts("plugins.cinnamon", {
   default_delay = 2
  }))
end
