return {
  'f-person/auto-dark-mode.nvim',
  lazy = false,
  opts = {
    update_interval = 3000,
    set_dark_mode = function()
      vim.api.nvim_set_option_value("background", "dark", {})
      vim.cmd.colorscheme('tempus_classic')
    end,
    set_light_mode = function()
      vim.api.nvim_set_option_value("background", "light", {})
      vim.cmd.colorscheme('tempus_past')
    end,
  }
}
