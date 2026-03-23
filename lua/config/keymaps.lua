-- ============================================================
-- ATALHOS GERAIS (sem leader)
-- ============================================================

-- Navegação entre abas
vim.keymap.set("n", "<Tab>",   ":BufferLineCycleNext<CR>", { desc = "Próxima aba" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Aba anterior" })

-- Navegação entre janelas divididas (Ctrl + hjkl)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Janela esquerda" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Janela abaixo" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Janela acima" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Janela direita" })

-- Mover linhas selecionadas no Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Mover seleção pra baixo" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Mover seleção pra cima" })

-- Manter cursor no centro ao rolar
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Limpar highlight de busca com Esc
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Limpar busca" })

-- ============================================================
-- ATALHOS COM LEADER (Space)
-- ============================================================

-- Explorador
vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal<CR>", { desc = "Abrir/fechar explorador" })
vim.keymap.set("n", "<leader><Tab>", function()
  local neotree_wins = vim.tbl_filter(function(win)
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
    return ft == "neo-tree"
  end, vim.api.nvim_list_wins())

  local current_ft = vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_get_current_buf() })

  if current_ft == "neo-tree" then
    -- Está no explorador → volta pro código (janela anterior)
    vim.cmd("wincmd p")
  elseif #neotree_wins > 0 then
    -- Está no código → foca no explorador
    vim.api.nvim_set_current_win(neotree_wins[1])
  else
    -- Explorador fechado → abre e foca
    vim.cmd("Neotree reveal")
  end
end, { desc = "Alternar foco explorador ↔ código" })

-- Arquivo
vim.keymap.set("n", "<leader>w",  ":w<CR>",    { desc = "Salvar arquivo" })
vim.keymap.set("n", "<leader>W",  ":wa<CR>",   { desc = "Salvar todos" })
vim.keymap.set("n", "<leader>q",  ":q<CR>",    { desc = "Fechar janela" })
vim.keymap.set("n", "<leader>Q",  ":qa!<CR>",  { desc = "Fechar tudo (sem salvar)" })

-- Busca (Telescope)
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>",                  { desc = "Buscar arquivo por nome" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>",                   { desc = "Buscar texto nos arquivos" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>",                     { desc = "Arquivos abertos" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>",                   { desc = "Ajuda do Neovim" })
vim.keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>",                    { desc = "Arquivos recentes" })
vim.keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>",                     { desc = "Ver todos os atalhos" })
vim.keymap.set("n", "<leader>fs", ":Telescope grep_string<CR>",                 { desc = "Buscar palavra sob cursor" })
vim.keymap.set("n", "<leader>fc", ":Telescope colorscheme<CR>",                 { desc = "Trocar tema" })
vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics<CR>",                 { desc = "Ver erros do projeto" })

-- Buffers (abas)
vim.keymap.set("n", "<leader>bx", ":bdelete<CR>",              { desc = "Fechar aba atual" })
vim.keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>",  { desc = "Próxima aba" })
vim.keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>",  { desc = "Aba anterior" })
vim.keymap.set("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>", { desc = "Ir pra aba 1" })
vim.keymap.set("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>", { desc = "Ir pra aba 2" })
vim.keymap.set("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>", { desc = "Ir pra aba 3" })
vim.keymap.set("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>", { desc = "Ir pra aba 4" })
vim.keymap.set("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>", { desc = "Ir pra aba 5" })

-- Janelas (splits)
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>",   { desc = "Dividir vertical" })
vim.keymap.set("n", "<leader>sh", ":split<CR>",    { desc = "Dividir horizontal" })
vim.keymap.set("n", "<leader>sx", ":close<CR>",    { desc = "Fechar divisão atual" })
vim.keymap.set("n", "<leader>so", "<C-w>o",        { desc = "Fechar outras divisões" })
vim.keymap.set("n", "<leader>s=", "<C-w>=",        { desc = "Equalizar tamanho das divisões" })

-- LSP (preenchido ao conectar um servidor de linguagem)
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover,           { desc = "Documentação da função" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition,      { desc = "Ir pra definição" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references,      { desc = "Ver referências" })
vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename,          { desc = "Renomear símbolo" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action,     { desc = "Ações de código" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format,          { desc = "Formatar arquivo" })
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float,   { desc = "Ver erro na linha" })
vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next,    { desc = "Próximo erro" })
vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev,    { desc = "Erro anterior" })

-- Plugins
vim.keymap.set("n", "<leader>pp", ":Lazy<CR>",         { desc = "Gerenciador de plugins" })
vim.keymap.set("n", "<leader>pu", ":Lazy update<CR>",  { desc = "Atualizar plugins" })
vim.keymap.set("n", "<leader>ps", ":Lazy sync<CR>",    { desc = "Sincronizar plugins" })
