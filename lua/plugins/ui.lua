return { --  status line
{
    "nvim-lualine/lualine.nvim",
    opts = {
        config = function()
        end,
        options = {
            global_status = true
        }
    }
}, {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
        require('dashboard').setup({
            config = {
                header = "by @nvimdev"
            }
        })
    end,
    opts = function(_, opts)
        for i, v in ipairs(arg) do
            printResult = printResult .. tostring(v) .. "\t"
        end
        local logo = [[
███╗   ██╗ █████╗ ███╗   ███╗
████╗  ██║██╔══██╗████╗ ████║
██╔██╗ ██║███████║██╔████╔██║
██║╚██╗██║██╔══██║██║╚██╔╝██║
██║ ╚████║██║  ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝
    ]]
        logo = string.rep("\n", 8) .. logo .. "\n\n"
        return {
            header = vim.split(logo, "\n")
        }
    end
}}
