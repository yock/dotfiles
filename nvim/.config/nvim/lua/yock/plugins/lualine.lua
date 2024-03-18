return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    local colors = {
      black = '#100F0F',
      white = '#FFFCF0',
      red = '#AF3029',
      green = '#66800B',
      blue = '#205EA6',
      yellow = '#AD8301',
      gray = '#B7B5AC',
      darkgray = '#6F6E69',
      lightgray = '#DAD8CE',
      inactivegray = '#F2F0E5',
    }

    local flexoki_dark = {
      normal = {
        a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.black},
        c = { bg = colors.lightgray, fg = colors.white },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.inactivegray, fg = colors.black },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.black, fg = colors.white },
      },
      command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.black },
        c = { bg = colors.inactivegray, fg = colors.black },
      },
      inactive = {
        a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
        b = { bg = colors.darkgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
    }
    local flexoki_light = {normal = {
      a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
      b = { bg = colors.lightgray, fg = colors.black },
      c = { bg = colors.white, fg = colors.black },
    },
    insert = {
      a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
      b = { bg = colors.lightgray, fg = colors.black },
      c = { bg = colors.lightgray, fg = colors.black },
    },
    visual = {
      a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
      b = { bg = colors.lightgray, fg = colors.black },
      c = { bg = colors.inactivegray, fg = colors.black },
    },
    replace = {
      a = { bg = colors.red, fg = colors.black, gui = 'bold' },
      b = { bg = colors.lightgray, fg = colors.black },
      c = { bg = colors.inactivegray, fg = colors.black  },
    },
    command = {
      a = { bg = colors.green, fg = colors.black, gui = 'bold' },
      b = { bg = colors.lightgray, fg = colors.black },
      c = { bg = colors.inactivegray, fg = colors.black },
    },
    inactive = {
      a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
      b = { bg = colors.darkgray, fg = colors.gray },
      c = { bg = colors.darkgray, fg = colors.gray },
    },
  }
  require('lualine').setup({
    options = { theme = flexoki_light },
  })
end,
}
