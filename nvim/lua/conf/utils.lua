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

-- harpoon
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
