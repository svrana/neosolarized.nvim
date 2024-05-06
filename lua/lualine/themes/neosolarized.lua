local colors = {
  black        = '#002b36',
  white        = '#93a1a1',
  red          = '#dc322f',
  green        = '#859900',
  blue         = '#268bd2',
  yellow       = '#b58900',
  gray         = '#839496',
  darkgray     = '#073642',
  lightgray    = '#586e75',
  inactivegray = '#073642',
}

return {
  normal = {
    a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  insert = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  visual = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  replace = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  command = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.gray, fg = colors.black},
    c = {bg = colors.darkgray, fg = colors.white}
  }
}
