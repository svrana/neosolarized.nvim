# neosolarized.nvim

A truecolor, solarized dark colorscheme using [tjdevries/colorbuddy.vim](https://github.com/tjdevries/colorbuddy.vim) for neovim.

Based on [NeoSolarized](https://github.com/overcache/NeoSolarized).

![](https://github.com/svrana/neosolarized.nvim/blob/assets/assets/screenshot1.png)

## Why?

I've used a bunch of solarized themes. The best I have found is NeoSolarized. Despite it
being fantastic, like most themes, I wanted to tweak it here and there and really wanted a
lua solution for this in the style of the latest and greatest neovim plugins that allow
customizations via a setup function.

## Limitations

- dark only
- termguicolors only
- neovim only

## Installation

Make sure you have [colorbuddy](https://github.com/tjdevries/colorbuddy.vim) installed.

After installed colorbuddy and neosolarized.nvim with your favorite package manager, from your init.vim:

```
lua << EOF
  require('neosolarized').setup({
    comment_italics = true,
  })
EOF
```

Example above is with the default settings.

This will change the foreground color of the TODO highlight.

```
lua << EOF
  n = require('neosolarized').setup({
    comment_italics = true,
  })
  n.Group.new('TODO', n.colors.blue)
EOF
```

The `Group` above is from [colorbuddy](https://github.com/tjdevries/colorbuddy.vim). The
solarized colors are defined in n.colors and returned so you do not need to define them
again.

## Features

- Easy customization without messing with nvim highlights
- LSP diagnostic colors (no need for lsp-colors, for example)

### Plugins supported

- nvim-cmp
- lsp-saga
- telescope
- vim-gitgutter
- neomake

### TODO

- pum/lsp-cmp style improvements (A dark background option would be nice)
- treesitter highlights have not been defined. I do use treesitter for highlighting but
  the existing groups have worked well enough for me up to this point.
- port the remaining features from neosolarized if they are requested by others

```

```
