return {

-- Tema
{
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      contrast = "hard",
      transparent_mode = true,
      overrides = {
        SignColumn = { bg = "NONE" },
        GruvboxRedSign = { bg = "NONE" },
        GruvboxGreenSign = { bg = "NONE" },
        GruvboxYellowSign = { bg = "NONE" },
        GruvboxBlueSign = { bg = "NONE" },
        GruvboxPurpleSign = { bg = "NONE" },
        GruvboxAquaSign = { bg = "NONE" },
        GruvboxOrangeSign = { bg = "NONE" },
      },
    })
    vim.cmd.colorscheme("gruvbox")
  end,
},

-- Icons
{ "nvim-tree/nvim-web-devicons" },

-- Tree
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim"
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = { enabled = true },  -- destaca o arquivo aberto
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = { width = 35 },
    })
  end,
},

-- Telescope
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        file_ignore_patterns = { "Results/", "Results\\" },
      },
    })
  end,
},

-- Treesitter
{
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "python", "lua", "javascript", "typescript", "bash" },
      highlight = { enable = true },
    })
  end,
},

-- LSP
{
"neovim/nvim-lspconfig"
},

-- Autocomplete
{
"hrsh7th/nvim-cmp",
dependencies = {
"hrsh7th/cmp-nvim-lsp",
"L3MON4D3/LuaSnip",
"saadparwaiz1/cmp_luasnip"
}
},

}
