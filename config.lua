--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.breakindent = true
-- vim.opt.wrap = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
    enabled = true,
    pattern = "*.lua",
    timeout = 1000,
}

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><leader>h"] = ":RustHoverActions<cr>"
lvim.keys.insert_mode["jk"] = "<Esc>"
lvim.keys.insert_mode["JK"] = "<Esc>"
lvim.keys.normal_mode["<leader>bg"] = "<cmd>lua require('user.background').ToggleTransparent()<cr><cmd>LvimReload<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "dracula"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = false


-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    "andrewferrier/wrapping.nvim",
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
    },
    "folke/todo-comments.nvim",
    "neovim/nvim-lspconfig",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    -- "jose-elias-alvarez/null-ls.nvim",
    "untitled-ai/jupyter_ascending.vim",
    "simrat39/rust-tools.nvim",
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
                RGB = true,      -- #RGB hex codes
                RRGGBB = true,   -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true,   -- CSS rgb() and rgba() functions
                hsl_fn = true,   -- CSS hsl() and hsla() functions
                css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    "Mofiqul/dracula.nvim",
    "Olical/conjure",
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.g.mkdp_auto_start = 1
        end
    },
    "tyru/open-browser.vim",
    "aklt/plantuml-syntax",
    "weirongxu/plantuml-previewer.vim",
    "CRAG666/code_runner.nvim",
    "jlcrochet/vim-razor",
    -- "sigmasd/deno-nvim",
    "OmniSharp/omnisharp-vim"
    -- "jlcrochet/vim-cs",
}


require("todo-comments").setup()

require("code_runner").setup({
    -- put here the commands by filetype
    filetype = {
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        python = "python3 -u",
        typescript = "deno run",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        haskell = "cd $dir && ghci $fileName"
    },
})

lvim.keys.normal_mode["<leader>r"] = ":RunCode<CR>"
lvim.keys.normal_mode["<leader>rf"] = ":RunFile<CR>"
lvim.keys.normal_mode["<leader>rft"] = ":RunFile tab<CR>"
lvim.keys.normal_mode["<leader>rp"] = ":RunProject<CR>"
lvim.keys.normal_mode["<leader>rc"] = ":RunClose<CR>"
lvim.keys.normal_mode["<leader>rfc"] = ":CRFiletype<CR>"
lvim.keys.normal_mode["<leader>rpc"] = ":CRProjects<CR>"


-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
local opts = {
    auto_set_mode_filetype_allowlist = {
        "asciidoc",
        "gitcommit",
        "latex",
        "mail",
        "markdown",
        "rst",
        "tex",
        "text",
    },
}

require("wrapping").setup(opts)

opts = {
    server = {
        -- standalone file support
        -- setting it to false may improve startup time
        standalone = true,
        settings = {
                ["rust-analyzer"] = {
                diagnostics = {
                    enable = true,
                    disabled = { "unresolved-proc-macro" },
                    enableExperimental = true,
                },
            }
        },
    }, -- rust-analyzer options
    -- debugging stuff
    dap = {
        adapter = {
            type = "server",
            -- host = "127.0.0.1",
            port = "13000",
            executable = {
                command = "/Users/doribook/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/adapter/codelldb",
                args = { "--port", "13000" },
                name = "rt_lldb"
            }
        }
    }
}

local rt = require("rust-tools")
rt.setup(opts)

local lspconfig = require("lspconfig")
lspconfig.gopls.setup {
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
}

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { "lvim", "vim" }
            }
        }
    }
}

lspconfig.hls.setup {
    settings = {
        haskell = {
            hlintOn = true,
            formattingProvider = "fourmolu"
        }
    }
}
lspconfig.gopls.setup {
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
    flags = {
        debounce_text_changes = 150,
    },
}

lspconfig.golangci_lint_ls.setup {
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
}


-- require("deno-nvim").setup({
--     server = {
--         root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc", "package.json")
--     }
-- })

lspconfig.arduino_language_server.setup {
    cmd = {
        "arduino-language-server",
        "-cli-config", "/Users/doribook/Library/Arduino15/arduino-cli.yaml",
        "-fqbn", "arduino:avr:uno",
        "-cli", "/opt/homebrew/bin/arduino-cli",
        "-clangd", "/usr/bin/clangd"
        -- "-clangd", "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clangd",
    }
}

-- lspconfig.arduino_language_server.setup {
--     on_new_config = function(config, root_dir)
--         local fqbn = my_arduino_fqbn[root_dir]
--         if not fqbn then
--             -- vim.notify(("Could not find which FQBN to use in %q. Defaulting to %q."):format(root_dir, DEFAULT_FQBN))
--             fqbn = DEFAULT_FQBN
--         end
--         config.cmd = {
--             "arduino-language-server",
--             "-cli-config", "/Users/doribook/Library/Arduino15/arduino-cli.yaml",
--             "-fqbn",
--             fqbn
--         }
--     end
-- }

local servers = { "clangd", "svelte", "jsonls", "solidity", }
for _, server in pairs(servers) do
    lspconfig[server].setup({})
end

lspconfig.tsserver.setup({
    on_attach = function(client)
        -- prevent tsserver and denols competeing
        local active_clients = vim.lsp.get_active_clients()
        -- if client.name == "denols" then
        --     for _, client_ in pairs(active_clients) do
        --         -- stop tsserver if denols is already active
        --         if client_.name == "tsserver" then
        --             client_.stop()
        --         end
        --     end
        -- else
        if client.name == "tsserver" then
            for _, client_ in pairs(active_clients) do
                -- prevent tsserver from starting if denols is already active
                if client_.name == "denols" then
                    client.stop()
                end
            end
        end
    end,
    settings = {
        javascript = {
            referencesCodeLens = { enabled = true, showOnAllFunctions = true },
            suggest = { completeFunctionCalls = true },
        },
        typescript = { updateImportsOnFileMove = { enabled = 'always' } },
    },
    root_dir = require('lspconfig.util').root_pattern('package.json', 'tsconfig.json'),
})

vim.cmd([[
    let g:OmniSharp_server_stdio = 1
    let g:OmniSharp_server_use_mono = 0
    let g:OmniSharp_server_use_net6 = 1

]])
lspconfig.omnisharp.setup({
    cmd = { "/Users/doribook/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp", "--languageserver", "--hostPID",
        tostring(vim.fn.getpid()) },
    root_dir = lspconfig.util.root_pattern(".sln", ".git", ".csproj"),
})

-- local lsp_installer_ensure_installed = {
--     -- LSP
--     "bashls",
--     "omnisharp",
--     -- "omnisharp-mono",
--     "cssls",
--     "dockerls",
--     "eslint",
--     "html",
--     "jsonls",
--     "pyright",
--     "tsserver",
--     -- "sumneko_lua",
--     "lua_ls",
--     --"sqls", -- https://github.com/lighttiger2505/sqls
--     "lemminx",
--     "yamlls",

--     -- DAP
--     -- "netcoredbg",

--     -- LINTERS
--     "tflint",

--     -- FORMATTERS
--     -- "csharpier",
--     -- "jq",
--     -- "markdownlint",
--     -- "prettier"
-- }

-- if vim.fn.has("win32") == 1 then
--     table.insert(lsp_installer_ensure_installed, "powershell_es")
-- elseif vim.fn.has("unix") == 1 then
--     table.insert(lsp_installer_ensure_installed, "omnisharp_mono")
--     -- table.insert(lsp_installer_ensure_installed, "omnisharp-mono")
-- end


-- require("mason-lspconfig").setup({
--     ensure_installed = lsp_installer_ensure_installed
-- })

-- local function find_closest_csproj(directory)
--     -- print("currentFileDirectory: " .. directory)
--     local csproj = vim.fn.glob(directory .. "/*.csproj", true, false)
--     if csproj == "" then
--         -- IF NO FILE IN CURRENT DIRECTORY, LOOK IN PARENT DIRECTORY recursively
--         local parent_directory = vim.fn.fnamemodify(directory, ":h")
--         if parent_directory == directory then
--             return nil
--         end
--         return find_closest_csproj(parent_directory)
--         -- elseif there are multiple csproj files, then return the first one
--     elseif string.find(csproj, "\n") ~= nil then
--         local first_csproj = string.sub(csproj, 0, string.find(csproj, "\n") - 1)
--         print("Found multiple csproj files, using: " .. first_csproj)
--         return first_csproj
--     else
--         return csproj
--     end
-- end

-- local function getFrameworkType()
--     local currentFileDirectory = vim.fn.expand("%:p:h")
--     -- print("currentFileDirectory file: " .. currentFileDirectory)
--     local csproj = find_closest_csproj(currentFileDirectory)
--     -- print("csproj file: " .. csproj)
--     if csproj == nil then
--         return false
--     end
--     local f = io.open(csproj, "rb")
--     local content = f:read("*all")
--     f:close()
--     -- return string.find(content, "<TargetFramework>netcoreapp") ~= nil
--     local frameworkType = ""
--     -- IF FILE CONTAINS <TargetFrameworkVersion> THEN IT'S .NET FRAMEWORK
--     if string.find(content, "<TargetFrameworkVersion>") ~= nil then
--         frameworkType = "netframework"
--         -- IF FILE CONTAINS <TargetFramework>net48 THEN IT'S .NET FRAMEWORK
--     elseif string.find(content, "<TargetFramework>net48") ~= nil then
--         frameworkType = "netframework"
--         -- ELSE IT'S .NET CORE
--     else
--         frameworkType = "netcore"
--     end
--     return frameworkType
-- end

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = 'cs',
--     callback = function()
--         if vim.g.dotnetlsp then
--             print("dotnetlsp is already set: " .. vim.g.dotnetlsp)
--             return
--         end
--         -- CHECK THE CSPROJ OR SOMETHING ELSE TO CONFIRM IT'S .NET FRAMEWORK OR .NET CORE PROJECT
--         local frameworkType = getFrameworkType()
--         if frameworkType == "netframework" then
--             print("Found a .NET Framework project, starting .NET Framework OmniSharp")
--             lspconfig.omnisharp_mono.setup {
--                 organize_imports_on_format = true,
--             }
--             vim.g.dotnetlsp = "omnisharp_mono"
--             vim.cmd('LspStart omnisharp_mono')
--         elseif frameworkType == "netcore" then
--             print("Found a .NET Core project, starting .NET Core OmniSharp")
--             lspconfig.omnisharp.setup {
--                 organize_imports_on_format = true,
--             }
--             vim.g.dotnetlsp = "omnisharp"
--             vim.cmd('LspStart omnisharp')
--         else
--             -- print("No .csproj file found")
--             return
--         end
--     end,
--     -- group = vim.api.nvim_create_augroup("_nvim-lspconfig.lua.filetype.csharp", { clear = true })
-- })
