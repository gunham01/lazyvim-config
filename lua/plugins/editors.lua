return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "Increname",
    config = function()
      require("inc_rename").setup()
    end,
  },

  -- auto import js
  {
    "ludovicchabant/vim-gutentags",
  },
  {
    "kristijanhusak/vim-js-file-import",
  },

  -- auto import php
  {
    "arnaud-lb/vim-php-namespace",
  },
}
