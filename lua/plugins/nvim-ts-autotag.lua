return {
  "windwp/nvim-ts-autotag",
  ft = {
    "javascript",
    "typescript",
    "html",
    "javascriptreact",
    "typescriptreact",
    "svelte",
    "vue",
    "twig",
    "php",
    "vue",
    "php",
    "lua",
    "javascript",
  },
  event = "LazyFile",
  opts = {

    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = true, -- Auto close on trailing </
  },
  per_filetype = {
    ["html"] = {
      enable_close = false,
    },
  },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}
