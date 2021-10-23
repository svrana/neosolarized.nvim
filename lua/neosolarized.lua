vim.cmd('packadd! colorbuddy.nvim')

local Color = require('colorbuddy.init').Color
local colors = require('colorbuddy.init').colors
local Group = require('colorbuddy.init').Group
local groups = require('colorbuddy.init').groups
local styles = require('colorbuddy.init').styles

vim.g.colors_name = 'neosolarized'

Color.new('base03', '#002b36')
Color.new('base02', '#073642')
Color.new('base01', '#586e75')
Color.new('base00', '#657b83')
Color.new('base0',  '#839496')
Color.new('base1',  '#93a1a1')
Color.new('base2',  '#eee8d5')
Color.new('base3',  '#fdf6e3')
Color.new('yellow', '#b58900')
Color.new('orange', '#cb4b16')
Color.new('red',    '#dc322f')
Color.new('magenta','#d33682')
Color.new('violet', '#6c71c4')
Color.new('blue',   '#268bd2')
Color.new('cyan',   '#2aa198')
Color.new('green',  '#719e07')

Color.new('bg', colors.base03.to_rgb)

Group.new('Normal',         colors.base0,         colors.NONE,      styles.NONE)
Group.new('Comment',        colors.base01,        colors.none,      styles.italic)
Group.new('Constant',       colors.cyan,          colors.none,      styles.NONE)
-- Any variable name, function or class name
Group.new('Identifier',     colors.blue,          colors.none,      styles.NONE)

-- any statement, conditional, repeat (for, do while), label, operator
Group.new('Statement',      colors.green,         colors.none,      styles.NONE)
Group.new('PreProc',        colors.orange,        colors.none,      styles.NONE)
Group.new('Type',           colors.yellow,        colors.none,      styles.NONE)
Group.new('Special',        colors.red,           colors.none,      styles.NONE)
Group.new('Underlined',     colors.violet,        colors.none,      styles.NONE)
Group.new('Ignore',         colors.none,          colors.none,      styles.NONE)
Group.new('Error',          colors.red,           colors.none,      styles.NONE)
Group.new('TODO',           colors.magenta,       colors.none,      styles.bold)

Group.new('SpecialKey',     colors.base00,        colors.base02,    styles.bold)
Group.new('NonText',        colors.base00,        colors.NONE,      styles.bold)
Group.new('StatusLine',     colors.base1,         colors.base02,    styles.reverse)
Group.new('StatusLineNC',   colors.base00,        colors.base02,    styles.reverse)
Group.new('Visual',         colors.base01,        colors.base03,    styles.reverse)
Group.new('Directory',      colors.blue,          colors.none,      styles.NONE)
Group.new('ErrorMsg',       colors.red,           colors.none,      styles.reverse)

Group.new('IncSearch',      colors.orange,        colors.none,      styles.standout)
Group.new('Search',         colors.yellow,        colors.none,      styles.reverse)

Group.new('MoreMsg',        colors.blue,          colors.none,      styles.NONE)
Group.new('ModeMsg',        colors.blue,          colors.none,      styles.NONE)
Group.new('LineNr',         colors.base01,        colors.base02,    styles.NONE)
Group.new('Question',       colors.cyan,          colors.none,      styles.bold)
Group.new('VertSplit',      colors.base00,        colors.none,      styles.NONE)
Group.new('Title',          colors.orange,        colors.none,      styles.bold)
Group.new('VisualNOS',      colors.none,          colors.base02,    styles.reverse)
Group.new('WarningMsg',     colors.red,           colors.none,      styles.NONE)
Group.new('WildMenu',       colors.base2,         colors.base02,    styles.reverse)
Group.new('Folded',         colors.base0,         colors.base02,    styles.bold,      colors.base03)
Group.new('FoldColumn',     colors.base0,         colors.base02,    styles.NONE)

Group.new('DiffAdd',        colors.green,         colors.base02,    styles.bold,      colors.green)
Group.new('DiffChange',     colors.yellow,        colors.base02,    styles.bold,      colors.yellow)
Group.new('DiffDelete',     colors.red,           colors.base02,    styles.bold)
Group.new('DiffText',       colors.blue,          colors.base02,    styles.bold,      colors.blue)

Group.new('SignColumn',     colors.base0,           colors.none,    styles.NONE)
Group.new('Conceal',        colors.blue,            colors.none,    styles.NONE)

-- needs undercurl
Group.new('SpellBad',      colors.none,     colors.none, styles.undercurl, colors.red)
Group.new('SpellCap',      colors.none,     colors.none, styles.undercurl, colors.violet)
Group.new('SpellRare',     colors.none,     colors.none, styles.undercurl, colors.cyan)
Group.new('SpellLocal',    colors.none,     colors.none, styles.undercurl, colors.yellow)

-- pum (popup menu)
Group.new('Pmenu',         colors.base0,    colors.base02,  styles.reverse)
Group.new('PmenuSel',      colors.base01,   colors.base2,   styles.reverse)
Group.new('PmenuSbar',     colors.base2,    colors.base0,   styles.reverse)
Group.new('PmenuThumb',    colors.base0,    colors.base03,  styles.reverse)

-- after convergence with neosolarized, tweak these or even unset them?
Group.new('CmpItemKind',        colors.base0,    colors.base02,  styles.reverse)
Group.new('CmpItemMenu',        colors.base0,    colors.base02,  styles.reverse)
Group.new('CmpItemAbbr',        colors.base0,    colors.base02,  styles.reverse)
Group.new('CmpItemAbbrMatch',   colors.base0,    colors.base02,  styles.reverse)

Group.new('TabLine',       colors.base0,    colors.base02,  styles.NONE,        colors.base0)
Group.new('TabLineFill',   colors.base0,    colors.base02,  styles.NONE,        colors.base0)
Group.new('TabLineSel',    colors.base01,   colors.base2,   styles.reverse,     colors.base0)

Group.new('CursorLine',    colors.none,     colors.base02,  styles.NONE, colors.base1)
Group.new('CursorLineNr',  colors.none,     colors.base02,  styles.NONE, colors.base1)
Group.new('ColorColumn',   colors.none,     colors.base02,  styles.NONE)
Group.new('Cursor',        colors.base03,   colors.base0,   styles.NONE)
Group.link('lCursor',      groups.Cursor)

Group.new('MatchParen',     colors.red,     colors.base01,  styles.bold)

Group.new('GitGutterAdd',           colors.green)
Group.new('GitGutterChange',        colors.yellow)
Group.new('GitGutterDelete',        colors.red)
Group.new('GitGutterChangeDelete',  colors.red)

-- vim highlighting (these don't seem to be working)
Group.link('vimVar',            groups.Identifier)
Group.link('vimFunc',           groups.Identifier)
Group.link('vimUserFunc',       groups.Identifier)
Group.link('helpSpecial',       groups.Special)
Group.link('vimSet',            groups.Normal)
Group.link('vimSetEqual',       groups.Normal)

Group.new('vimCommentString',   colors.violet)
Group.new('vimCommand',         colors.yellow)
Group.new('vimCmdSep',          colors.blue,        colors.NONE,        styles.bold)
Group.new('helpExample',        colors.base1)
Group.new('helpOption',         colors.cyan)
Group.new('helpNote',           colors.magenta)
Group.new('helpVim',            colors.magenta)
Group.new('helpHyperTextJump',  colors.blue,        colors.NONE,        styles.underline)
Group.new('helpHyperTextEntry', colors.green)
Group.new('vimIsCommand',       colors.base00)
Group.new('vimSynMtchOpt',      colors.yellow)
Group.new('vimSynType',         colors.cyan)
Group.new('vimHiLink',          colors.blue)
Group.new('vimGroup',           colors.blue,        colors.NONE,        styles.underline + styles.bold)

Group.new('gitcommitSummary',           colors.green)
Group.new('gitcommitComment',           colors.base01,              colors.NONE,            styles.italic)
Group.link('gitcommitUntracked',        groups.gitcommitComment)
Group.link('gitcommitDiscarded',        groups.gitcommitComment)
Group.new('gitcommitSelected',          groups.gitcommitComment)
Group.new('gitcommitUnmerged',          colors.green,               colors.NONE,            styles.bold)
Group.new('gitcommitOnBranch',          colors.base01,              colors.NONE,            styles.bold)
Group.new('gitcommitBranch',            colors.magenta,             colors.NONE,            styles.bold)
Group.link('gitcommitNoBranch',         groups.gitcommitBranch)
Group.new('gitcommitDiscardedType',     colors.red)
Group.new('gitcommitSelectedType',      colors.green)
Group.new('gitcommitHeader',            colors.base01)
Group.new('gitcommitUntrackedFile',     colors.cyan)
Group.new('gitcommitDiscardedFile',     colors.red)
Group.new('gitcommitSelectedFile',      colors.green)
Group.new('gitcommitUnmergedFile',      colors.yellow)
Group.new('gitcommitFile',              colors.base0)
Group.link('gitcommitDiscardedArrow',   groups.gitCommitDiscardedFile)
Group.link('gitcommitSelectedArrow',    groups.gitCommitSelectedFile)
Group.link('gitcommitUnmergedArrow',    groups.gitCommitUnmergedFile)

Group.link('diffAdded',  groups.Statement)
Group.link('diffLine',   groups.Identifier)

Group.new('NeomakeErrorSign',       colors.orange)
Group.new('NeomakeWarningSign',     colors.yellow)
Group.new('NeomakeMessageSign',     colors.cyan)
Group.new('NeomakeNeomakeInfoSign', colors.green)

Group.new('TelescopeMatching',  colors.orange,  groups.Special,     groups.Special,     groups.Special)

Group.new('DefinitionIcon', colors.cyan)
