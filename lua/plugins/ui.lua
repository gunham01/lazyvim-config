return { --  status line
{
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            -- theme = "kanagawa",
        }
    }
}, {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
        local logo = [[
 ██████╗ ██╗   ██╗███╗   ██╗██╗  ██╗ █████╗ ███╗   ███╗
██╔════╝ ██║   ██║████╗  ██║██║  ██║██╔══██╗████╗ ████║
██║  ███╗██║   ██║██╔██╗ ██║███████║███████║██╔████╔██║
██║   ██║██║   ██║██║╚██╗██║██╔══██║██╔══██║██║╚██╔╝██║
╚██████╔╝╚██████╔╝██║ ╚████║██║  ██║██║  ██║██║ ╚═╝ ██║
 ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝
    ]]
        logo = string.rep("\n", 8) .. logo .. "\n\n"
        opts.config.header = vim.split(logo, "\n")
    end
}}
