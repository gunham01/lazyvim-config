return {
  "voldikss/vim-floaterm",
  lazy = true,
  keys = {
    { "<leader><leader>", function() end },
    { "ft", "<cmd>FloatermToggle<cr>", desc = "Floaterm" },
    { "fn", "<cmd>FloatermNew<cr>", desc = "Floaterm New" },
    { "fk", "<cmd>FloatermKill<cr>FloatermPrev<cr>", desc = "Floaterm Kill" },
    { "fl", "<cmd>FloatermNext<cr>", desc = "Floaterm Next" },
    { "fh", "<cmd>FloatermPrev<cr>", desc = "Floaterm Prev" },
  },
  config = function() end,
}
