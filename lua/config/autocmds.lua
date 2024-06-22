-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Define an autocmd group for the blade workaround
local augroup = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true })

-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup,
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
    local file_path = vim.fn.expand("<afile>")
    vim.cmd("!./vendor/bin/pint " .. file_path)
  end,
})

-- Autocommand to run ./vendor/bin/pint on save for .blade.php files
vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = "*.blade.php",
  callback = function()
    local file_path = vim.fn.expand("<afile>")
    vim.cmd("!./vendor/bin/pint " .. file_path)
  end,
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      -- Check if the attached client is 'intelephense'
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.name == "intelephense" and client.attached_buffers[args.buf] then
          vim.api.nvim_buf_set_option(args.buf, "filetype", "blade")
          -- update treesitter parser to blade
          vim.api.nvim_buf_set_option(args.buf, "syntax", "blade")
          break
        end
      end
    end)
  end,
})
