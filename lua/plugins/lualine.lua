return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local icons = require("lazyvim.config").icons

    opts.options = {
      section_separators = { left = " ", right = " " },
      component_separators = { left = " ", right = " " },
    }
    opts.sections.lualine_a = {}
    opts.sections.lualine_b = {}
    opts.sections.lualine_c = {}
    opts.sections.lualine_x = {}
    opts.sections.lualine_y = {}
    opts.sections.lualine_z = {}

    table.insert(opts.sections.lualine_c, "mode")
    table.insert(opts.sections.lualine_c, {
      "filename",
      path = 4,
    })
    table.insert(opts.sections.lualine_c, {
      "diagnostics",
      symbols = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info,
        hint = icons.diagnostics.Hint,
      },
    })
    table.insert(opts.sections.lualine_c, {
      "buffers",
      mode = 1,
      buffers_color = {
        active = { fg = "#98BF83" },
        inactive = { fg = "#6E675D" },
      },
      symbols = {
        modified = "",
        alternate_file = "",
      },
    })

    table.insert(opts.sections.lualine_x, "location")
    table.insert(opts.sections.lualine_x, "progress")
    table.insert(opts.sections.lualine_x, "encoding")
    table.insert(opts.sections.lualine_x, "selectioncount")
    table.insert(opts.sections.lualine_x, {
      "diff",
      symbols = {
        added = " ",
        modified = " ",
        removed = " ",
      },
    })
    table.insert(opts.sections.lualine_x, "branch")
    -- table.insert(opts.sections.lualine_x, {
    --     "filetype",
    --     icon = { align = "right" },
    -- })
    local colors = {
      [""] = LazyVim.ui.fg("Special"),
      ["Normal"] = LazyVim.ui.fg("Special"),
      ["Warning"] = LazyVim.ui.fg("DiagnosticError"),
      ["InProgress"] = LazyVim.ui.fg("DiagnosticWarn"),
    }
    table.insert(opts.sections.lualine_x, 2, {
      function()
        local icon = LazyVim.config.icons.kinds.Copilot
        local status = require("copilot.api").status.data
        return icon .. (status.message or "")
      end,
      cond = function()
        if not package.loaded["copilot"] then
          return
        end
        local ok, clients = pcall(LazyVim.lsp.get_clients, { name = "copilot", bufnr = 0 })
        if not ok then
          return false
        end
        return ok and #clients > 0
      end,
      color = function()
        if not package.loaded["copilot"] then
          return
        end
        local status = require("copilot.api").status.data
        return colors[status.status] or colors[""]
      end,
    })
  end,
}
