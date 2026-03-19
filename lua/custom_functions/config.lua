local config = {
    base_dir = "/Users/kazuya.mito/work",
    custom_paths = {},
    add_paths = {
        {
            name = "nvim config",
            path_command = "vim.fn.stdpath('config') .. '/lua'"
        },
        {
            name = "user root",
            path_command = "os.getenv('HOME')"
        },
    },
}

return config
