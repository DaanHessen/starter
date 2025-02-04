-- Plugin loader for custom plugins
return {
  -- Load all custom plugin configurations
  { import = "plugins.git" },
  { import = "plugins.transparency" },
  { import = "plugins.autocomplete" },
  { import = "plugins.copilot" },
  { import = "plugins.editorconfig" },
  { import = "plugins.colorschemes" },
  { import = "plugins.markdown" },
} 