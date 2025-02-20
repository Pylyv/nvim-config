-- Configuration for `Mason`, which takes care about install
-- our LSP servers, DAPs, linters and formatters

return {
    event = 'VeryLazy',
    cmd = 'Mason',
    build = ":MasonUpdate",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
        ensure_installed = {
            -- LSPs
            'rust-analyzer',
            'clangd', -- C/C++
            -- 'ast-grep',
            'asm-lsp', -- Assembly
            'jedi-language-server', -- Python
            'jdtls', -- Java (Eclipse)
            'gopls',
            -- 'golangci-lint-ls',
            'lua-language-server',
            'taplo', -- Markdown

            -- DAPs
            'codelldb',
            'cpptools',
            'java-debug-adapter',
            'java-test',
           
            -- formatters
            'asmfmt',
        },

        ui = {
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗'
            }
        },
    },
    config = function(_, opts)
        require('mason').setup(opts)
        local registry = require("mason-registry")

        registry.refresh(function ()
            return registry.get_all_package_names()
        end)

        local function ensure_installed()
            for _, tool in ipairs(opts.ensure_installed) do
                local p = registry.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end
        if registry.refresh then
            registry.refresh(ensure_installed)
        else
            ensure_installed()
        end
    end
}

