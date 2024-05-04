local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    use 'junegunn/vim-easy-align'
    use 'mbbill/undotree'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'wbthomason/packer.nvim'

    -- rice 
    use 'ellisonleao/gruvbox.nvim'
    use 'nordtheme/vim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'



    -- harpoon
    use "nvim-lua/plenary.nvim"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    if packer_bootstrap then
        require('packer').sync()
    end
end)
