vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use('EdenEast/nightfox.nvim')
    use('thesimonho/kanagawa-paper.nvim')
    use('gbprod/nord.nvim')
    use('scottmckendry/cyberdream.nvim')
    use('folke/tokyonight.nvim')

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('neovim/nvim-lspconfig')
    use('williamboman/mason.nvim')
    use {
        'williamboman/mason-lspconfig.nvim',
        after = 'mason.nvim',  -- Load after mason
    }
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')
    use('OmniSharp/omnisharp-vim')
    use({
        'MeanderingProgrammer/render-markdown.nvim',
        after = { 'nvim-treesitter' },
        requires = { 'echasnovski/mini.nvim', opt = true },
        config = function()
            require('render-markdown').setup({})
        end,
    })
    use {
        'nvimtools/none-ls.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.prettier,
                },
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.json", "*.css", "*.html", "*.md" },
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end,
    }
    use {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    }
end)
