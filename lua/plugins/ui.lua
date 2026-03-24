return {

  -- Statusline com caminho completo do arquivo
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "gruvbox",
          globalstatus = true,
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 3, shorting_target = 40 } }, -- caminho completo abreviado
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- Abas no topo
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
          diagnostics = "nvim_lsp",
        },
      })
    end,
  },

  -- Menu de atalhos ao apertar Space
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        delay = 400, -- ms para aparecer
      })
      wk.add({
        { "<leader>e",  group = "󰙅 Explorador" },
        { "<leader>f",  group = " Buscar" },
        { "<leader>b",  group = "󰓩 Buffers/Abas" },
        { "<leader>s",  group = " Dividir janela" },
        { "<leader>l",  group = " LSP / Código" },
        { "<leader>p",  group = "󰒲 Plugins" },
        { "<leader>w",  desc  = " Salvar arquivo" },
        { "<leader>W",  desc  = " Salvar todos" },
        { "<leader>q",  desc  = " Fechar janela" },
        { "<leader>Q",  desc  = "󰩈 Fechar tudo" },
      })
    end,
  },

  -- Fecha () [] {} "" automaticamente
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
    end,
  },

  -- Guias visuais de indentação
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { enabled = true },
      })
    end,
  },

}
