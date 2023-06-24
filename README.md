# neosolarized.nvim

A truecolor, solarized dark colorscheme using [tjdevries/colorbuddy.vim](https://github.com/tjdevries/colorbuddy.vim) for neovim.

Based on [NeoSolarized](https://github.com/overcache/NeoSolarized).

![](https://github.com/svrana/neosolarized.nvim/blob/assets/assets/screenshot2.png)

## Why?

I've used a bunch of solarized themes. The best I have found is NeoSolarized. Despite it
being fantastic, like most themes, I wanted to tweak it here and there and really wanted a
lua solution for this in the style of the latest and greatest neovim plugins. TJ's
[colorbuddy](https://github.com/tjdevries/colorbuddy.vim) plugin makes dealing with colors in neovim
a pleasant experience. All the solarized colors and groups defined by this plugin are returned back
to you in the setup call for reuse.

## Limitations

- dark only
- termguicolors only
- neovim only

## Prerequisites

Make sure you have [colorbuddy](https://github.com/tjdevries/colorbuddy.vim) installed.

### Setup

After installing colorbuddy and neosolarized.nvim with your favorite package manager add
the following lua snippet to your init.vim:

```
lua << EOF
  require('neosolarized').setup({
    comment_italics = true,
    background_set = false,
  })
EOF
```

Example above is with the default settings that assumes a transparent terminal. If you
would like this colorscheme to set the background (as in the screenshots above) change the
`background_set` option to true, i.e.,

```
lua << EOF
  require('neosolarized').setup({
    comment_italics = true,
    background_set = false,
  })
EOF
```

### Customization

neosolarized aims to be simple to customize.

The following is how I setup neosolarized. Ihis changes the color of the WarningMsg
(currently used by some code actions) to a less visible color by linking the group to a
predefined group.

```
lua << EOF
  n = require('neosolarized').setup({
    comment_italics = true,
    background_set = true,
  })
  -- for some reason some code actions get highlighted with WarningMsg and it's too much for me
  n.Group.link('WarningMsg', n.groups.Comment)
EOF
```

You could also just set the color or style, i.e.,:

```
  n.Group.new('TODO', n.colors.blue, n.colors.none, n.styles.underlined + n.styles.bold)
```

The `Group` above is from [colorbuddy](https://github.com/tjdevries/colorbuddy.vim). The
solarized colors are defined in n.colors and returned from setup().

For more information about how to use colorbuddy, check out the colorbuddy's README.

## Features

- Easy customization with colorbuddy without messing with nvim highlights
- LSP diagnostic colors (no need for lsp-colors, for example)
- Treesitter highlights
- Transparency by default (disable with `background_set = true`)

### Plugins supported

- nvim-cmp
- lsp-saga
- telescope
- vim-gitgutter
- neomake
- seblj/nvim-tabline
- kevinwhang91/nvim-bqf
- Primeagen/harpoon
- lewis6991/gitsigns.nvim
- phaazon/hop.nvim
- j-hui/fidget

### TODO

- non-truecolors version for console use
