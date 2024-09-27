return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  -- event = "InsertEnter",
  build = ":Copilot auth",
  -- config = function()
  --   require("copilot").setup({})
  -- end,
  opts = {
    suggestion = {
      enabled = false,
      auto_trigger = true,
    },
    panel = {
      enabled = false,
    },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
