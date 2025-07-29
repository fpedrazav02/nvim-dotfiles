return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("nvim-treesitter no se pudo cargar", vim.log.levels.ERROR)
      return
    end

    configs.setup({
      ensure_installed = {
        "lua", "python", "json", "yaml", "bash", "html", "css", "javascript", "c", "cpp"
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local ok = pcall(vim.treesitter.get_parser, buf, lang)
          return not ok
        end,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
