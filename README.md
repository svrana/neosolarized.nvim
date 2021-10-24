# neosolarized.nvim

A truecolor, solarized dark colorscheme using [tjdevries/colorbuddy.vim](https://github.com/tjdevries/colorbuddy.vim) for neovim.

Based on [NeoSolarized](https://github.com/overcache/NeoSolarized).

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

From your init.vim:

```
lua << EOF
  require('neosolarized').setup({
    comment_italics = true,
  })
EOF
```

Example above is with the default settings.

## Features

- Easy customization without messing with nvim highlights
- LSP diagnostic colors (no need for lsp-colors, for example)

### TODO

- pum/lsp-cmp style improvements
