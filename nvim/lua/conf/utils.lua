require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'python', 'java', 'c', 'cpp', 'go', 'gomod', 'gosum', 'typescript', 'svelte', 'tsx', 'css', 'html', 'scss', 'javascript', 'json', 'vimdoc', 'gitignore' },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false, -- Disable legacy syntax
    }
}
require 'treesitter-context'.setup {
    enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
}

require("telescope").load_extension("file_browser")

require("telescope").load_extension('harpoon')

require("telescope").setup {
    pickers = {
        buffers = {
            initial_mode = "normal"
        },
        lsp_references = {
            initial_mode = "normal",
            show_line = false,
        },
        diagnostics = {
            initial_mode = "normal"
        },
        git_status = {
            initial_mode = "normal"
        },
        live_grep = {
            additional_args = function(opts)
                return { "--hidden" }
            end
        },
        find_files = {
        }
    },
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            width = 0.99,
            preview_width = 0.55,
            preview_cutoff = 0.5,
        },
        -- path_display={"tail"},
        path_display = { "smart" },
        file_ignore_patterns = { "node_modules" },
    },
}

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 40,
    }
})

vim.api.nvim_create_autocmd({ "Filetype" }, {
    pattern = "harpoon",
    callback = function()
        vim.opt.cursorline = true
        vim.api.nvim_set_hl(0, 'HarpoonWindow', { link = 'Normal' })
        vim.api.nvim_set_hl(0, 'HarpoonBorder', { link = 'Normal' })
    end
})
