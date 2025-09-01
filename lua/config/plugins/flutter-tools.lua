return {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim',
    },
    config = function()
        require('flutter-tools').setup {
            ui = {
                border = "rounded",
                notification_style = 'native'
            },
            reload_on_save = true,
            decorations = {
                statusline = {
                    app_version = false,
                    device = true,
                    project_config = false,
                },
            },
            debugger = {
                enabled = false,
                run_via_dap = false,
            },
            flutter_lookup_cmd = nil,
            fvm = false,
            widget_guides = {
                enabled = false,
            },
            closing_tags = {
                highlight = "Comment",
                prefix = "//",
                enabled = true
            },
            dev_log = {
                enabled = true,
                notify_errors = false,
                open_cmd = "tabedit",
            },
            dev_tools = {
                autostart = false,
                auto_open_browser = false,
            },
            outline = {
                open_cmd = "30vnew",
                auto_open = false
            },
            lsp = {
                color = {
                    enabled = false,
                    background = false,
                    background_color = nil,
                    foreground = false,
                    virtual_text = true,
                    virtual_text_str = "■",
                },
                on_attach = nil,
                capabilities = nil,
                init_options = {
                    onlyAnalyzeProjectsWithOpenFiles = true,
                    suggestFromUnimportedLibraries = true,
                    closingLabels = true,
                    outline = true,
                    flutterOutline = true
                },
                settings = {
                    showTodos = true,
                    completeFunctionCalls = true,
                    renameFilesWithClasses = "prompt",
                    enableSnippets = true,
                    updateImportsOnRename = true,
                }
            }
        }
        
        -- Key mappings for Flutter development
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>Fr', '<cmd>FlutterRun<cr>', opts)
        vim.keymap.set('n', '<leader>Fq', '<cmd>FlutterQuit<cr>', opts)
        vim.keymap.set('n', '<leader>Fs', '<cmd>FlutterRestart<cr>', opts)
        vim.keymap.set('n', '<leader>FR', '<cmd>FlutterReload<cr>', opts)
        vim.keymap.set('n', '<leader>Fd', '<cmd>FlutterDevices<cr>', opts)
        vim.keymap.set('n', '<leader>Fe', '<cmd>FlutterEmulators<cr>', opts)
        vim.keymap.set('n', '<leader>Fo', '<cmd>FlutterOutlineToggle<cr>', opts)
        vim.keymap.set('n', '<leader>Ft', '<cmd>FlutterDevTools<cr>', opts)
        vim.keymap.set('n', '<leader>Fc', '<cmd>FlutterLogClear<cr>', opts)
        vim.keymap.set('n', '<leader>Fl', '<cmd>FlutterLogToggle<cr>', opts)
        vim.keymap.set('n', '<leader>FL', '<cmd>FlutterLspRestart<cr>', opts)
    end
}