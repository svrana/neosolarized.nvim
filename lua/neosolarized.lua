local cmd = vim.cmd
local fn = vim.fn

local defaults = {
    comment_italics = true,
}

local M = {
    Color = require('colorbuddy.init').Color,
    colors = require('colorbuddy.init').colors,
    Group = require('colorbuddy.init').Group,
    groups = require('colorbuddy.init').groups,
    styles = require('colorbuddy.init').styles,
}

function M.setup(opts)
    if not opts then opts = {} end

    for k,v in pairs(defaults) do
        if opts[k] == nil then opts[k] = v end
    end

    -- typos are annoying
    for k,_ in pairs(opts) do
        if defaults[k] == nil then print("neosolarized: unknown setting: ", k) end
    end

    cmd([[
        packadd! colorbuddy.nvim
        highlight clear
    ]])

    if fn.exists('syntax_on') then cmd('syntax reset') end

    vim.g.colors_name = 'neosolarized'

    local Color = M.Color
    local colors = M.colors
    local Group = M.Group
    local groups = M.groups
    local styles = M.styles

    Color.new('base03',     '#002b36')
    Color.new('base02',     '#073642')
    Color.new('base01',     '#586e75')
    Color.new('base00',     '#657b83')
    Color.new('base0',      '#839496')
    Color.new('base1',      '#93a1a1')
    Color.new('base2',      '#eee8d5')
    Color.new('base3',      '#fdf6e3')
    Color.new('yellow',     '#b58900')
    Color.new('orange',     '#cb4b16')
    Color.new('red',        '#dc322f')
    Color.new('magenta',    '#d33682')
    Color.new('violet',     '#6c71c4')
    Color.new('blue',       '#268bd2')
    Color.new('cyan',       '#2aa198')
    Color.new('green',      '#719e07')

    Color.new('bg',             colors.base03)
    Group.new('Error',          colors.red)
    Group.new('Warning',        colors.yellow)
    Group.new('Information',    colors.blue)
    Group.new('Hint',           colors.cyan)

    -- normal non-current text
    Group.new('Normal',     colors.base0,           colors.NONE, styles.NONE)
    Group.new('NormalNC',   colors.base0:dark(),    colors.NONE, styles.NONE)

    Group.new('Comment', colors.base01, colors.none, opts.comment_italics and styles.italic or styles.NONE)
    Group.new('Constant', colors.cyan, colors.none, styles.NONE)
    -- Any variable name, function or class name
    Group.new('Identifier', colors.blue, colors.none, styles.NONE)

    -- any statement, conditional, repeat (for, do while), label, operator
    Group.new('Statement', colors.green, colors.none, styles.NONE)
    Group.new('PreProc', colors.orange, colors.none, styles.NONE)
    Group.new('Type', colors.yellow, colors.none, styles.NONE)
    Group.new('Special', colors.red, colors.none, styles.NONE)
    Group.new('Underlined', colors.violet, colors.none, styles.NONE)
    Group.new('Ignore', colors.none, colors.none, styles.NONE)
    Group.new('Error', colors.red, colors.none, styles.NONE)
    Group.new('TODO', colors.magenta, colors.none, styles.bold)

    Group.new('SpecialKey', colors.base00, colors.base02, styles.bold)
    Group.new('NonText', colors.base00, colors.NONE, styles.bold)
    Group.new('StatusLine', colors.base1, colors.base02, styles.reverse)
    Group.new('StatusLineNC', colors.base00, colors.base02, styles.reverse)
    Group.new('Visual', colors.base01, colors.base03, styles.reverse)
    Group.new('Directory', colors.blue, colors.none, styles.NONE)
    Group.new('ErrorMsg', colors.red, colors.none, styles.reverse)

    Group.new('IncSearch', colors.orange, colors.none, styles.standout)
    Group.new('Search', colors.yellow, colors.none, styles.reverse)

    Group.new('MoreMsg', colors.blue, colors.none, styles.NONE)
    Group.new('ModeMsg', colors.blue, colors.none, styles.NONE)
    Group.new('LineNr', colors.base01, colors.base02, styles.NONE)
    Group.new('Question', colors.cyan, colors.none, styles.bold)
    Group.new('VertSplit', colors.base00, colors.none, styles.NONE)
    Group.new('Title', colors.orange, colors.none, styles.bold)
    Group.new('VisualNOS', colors.none, colors.base02, styles.reverse)
    Group.new('WarningMsg', colors.red, colors.none, styles.NONE)
    Group.new('WildMenu', colors.base2, colors.base02, styles.reverse)
    Group.new('Folded', colors.base0, colors.base02, styles.bold, colors.base03)
    Group.new('FoldColumn', colors.base0, colors.base02, styles.NONE)

    Group.new('DiffAdd', colors.green, colors.base02, styles.bold, colors.green)
    Group.new('DiffChange', colors.yellow, colors.base02, styles.bold, colors.yellow)
    Group.new('DiffDelete', colors.red, colors.base02, styles.bold)
    Group.new('DiffText', colors.blue, colors.base02, styles.bold, colors.blue)

    Group.new('SignColumn', colors.base0, colors.none, styles.NONE)
    Group.new('Conceal', colors.blue, colors.none, styles.NONE)

    Group.new('SpellBad', colors.none, colors.none, styles.undercurl, colors.red)
    Group.new('SpellCap', colors.none, colors.none, styles.undercurl, colors.violet)
    Group.new('SpellRare', colors.none, colors.none, styles.undercurl, colors.cyan)
    Group.new('SpellLocal', colors.none, colors.none, styles.undercurl, colors.yellow)

    -- pum (popup menu)
    Group.new('Pmenu', groups.Normal, colors.base02, styles.none) -- popup menu normal item
    Group.new('PmenuSel', colors.base01, colors.base2, styles.reverse) -- selected item
    Group.new('PmenuSbar', colors.base02, colors.none, styles.reverse)
    Group.new('PmenuThumb', colors.base0, colors.none, styles.reverse)

    -- be nice for this float border to be cyan if active
    Group.new('FloatBorder', colors.base02)

    Group.new('TabLine', colors.base0, colors.base02, styles.NONE, colors.base0)
    Group.new('TabLineFill', colors.base0, colors.base02, styles.NONE, colors.base0)
    Group.new('TabLineSel', colors.base01, colors.base02, styles.reverse, colors.base0)

    Group.new('CursorLine', colors.none, colors.base02, styles.NONE, colors.base1)
    Group.new('CursorLineNr', colors.none, colors.base02, styles.NONE, colors.base1)
    Group.new('ColorColumn', colors.none, colors.base02, styles.NONE)
    Group.new('Cursor', colors.base03, colors.base0, styles.NONE)
    Group.link('lCursor', groups.Cursor)
    Group.link('TermCursor', groups.Cursor)
    Group.new('TermCursorNC', colors.base03, colors.base01)

    Group.new('MatchParen', colors.red, colors.base01, styles.bold)

    Group.new('GitGutterAdd', colors.green)
    Group.new('GitGutterChange', colors.yellow)
    Group.new('GitGutterDelete', colors.red)
    Group.new('GitGutterChangeDelete', colors.red)

    -- vim highlighting
    Group.link('vimVar', groups.Identifier)
    Group.link('vimFunc', groups.Identifier)
    Group.link('vimUserFunc', groups.Identifier)
    Group.link('helpSpecial', groups.Special)
    Group.link('vimSet', groups.Normal)
    Group.link('vimSetEqual', groups.Normal)
    Group.new('vimCommentString', colors.violet)
    Group.new('vimCommand', colors.yellow)
    Group.new('vimCmdSep', colors.blue, colors.NONE, styles.bold)
    Group.new('helpExample', colors.base1)
    Group.new('helpOption', colors.cyan)
    Group.new('helpNote', colors.magenta)
    Group.new('helpVim', colors.magenta)
    Group.new('helpHyperTextJump', colors.blue, colors.NONE, styles.underline)
    Group.new('helpHyperTextEntry', colors.green)
    Group.new('vimIsCommand', colors.base00)
    Group.new('vimSynMtchOpt', colors.yellow)
    Group.new('vimSynType', colors.cyan)
    Group.new('vimHiLink', colors.blue)
    Group.new('vimGroup', colors.blue, colors.NONE, styles.underline + styles.bold)

    Group.new('gitcommitSummary', colors.green)
    Group.new('gitcommitComment', colors.base01, colors.NONE, styles.italic)
    Group.link('gitcommitUntracked', groups.gitcommitComment)
    Group.link('gitcommitDiscarded', groups.gitcommitComment)
    Group.new('gitcommitSelected', groups.gitcommitComment)
    Group.new('gitcommitUnmerged', colors.green, colors.NONE, styles.bold)
    Group.new('gitcommitOnBranch', colors.base01, colors.NONE, styles.bold)
    Group.new('gitcommitBranch', colors.magenta, colors.NONE, styles.bold)
    Group.link('gitcommitNoBranch', groups.gitcommitBranch)
    Group.new('gitcommitDiscardedType', colors.red)
    Group.new('gitcommitSelectedType', colors.green)
    Group.new('gitcommitHeader', colors.base01)
    Group.new('gitcommitUntrackedFile', colors.cyan)
    Group.new('gitcommitDiscardedFile', colors.red)
    Group.new('gitcommitSelectedFile', colors.green)
    Group.new('gitcommitUnmergedFile', colors.yellow)
    Group.new('gitcommitFile', colors.base0)
    Group.link('gitcommitDiscardedArrow', groups.gitCommitDiscardedFile)
    Group.link('gitcommitSelectedArrow', groups.gitCommitSelectedFile)
    Group.link('gitcommitUnmergedArrow', groups.gitCommitUnmergedFile)

    Group.link('diffAdded', groups.Statement)
    Group.link('diffLine', groups.Identifier)

    Group.new('NeomakeErrorSign', colors.orange)
    Group.new('NeomakeWarningSign', colors.yellow)
    Group.new('NeomakeMessageSign', colors.cyan)
    Group.new('NeomakeNeomakeInfoSign', colors.green)

    Group.new('CmpItemKind', colors.green, colors.none, styles.none)
    Group.new('CmpItemMenu', groups.NormalNC, colors.bg, styles.none)
    -- Group.new('CmpItemAbbr', colors.base0, colors.bg, styles.none)
    -- Group.new('CmpItemAbbrMatch', colors.base0, colors.bg, styles.none)

    Group.new('LspSagaCodeActionTitle',         colors.green)
    Group.new('LspSagaBorderTitle',             colors.yellow, colors.none, styles.bold)
    Group.new('LspSagaDiagnosticHeader',        colors.yellow)
    Group.new('ProviderTruncateLine',           colors.base02)
    Group.new('LspSagaShTruncateLine',          groups.ProviderTruncateLine)
    Group.new('LspSagaDocTruncateLine',         groups.ProviderTruncateLine)
    Group.new('LspSagaCodeActionTruncateLine',  groups.ProviderTruncateLine)
    Group.new('LspSagaHoverBorder',             colors.cyan)
    Group.new('LspSagaRenameBorder',            groups.LspSagaHoverBorder)
    Group.new('LSPSagaDiagnosticBorder',        groups.LspSagaHoverBorder)
    Group.new('LspSagaSignatureHelpBorder',     groups.LspSagaHoverBorder)
    Group.new('LspSagaCodeActionBorder',        groups.LspSagaHoverBorder)
    Group.new('LspSagaLspFinderBorder',         groups.LspSagaHoverBorder)
    Group.new('LspSagaFloatWinBorder',          groups.LspSagaHoverBorder)
    Group.new('LspSagaSignatureHelpBorder',     groups.LspSagaHoverBorder)
    Group.new('LspSagaDefPreviewBorder',        groups.LspSagaHoverBorder)
    Group.new('LspSagaAutoPreviewBorder',       groups.LspSagaHoverBorder)
    Group.new('LspFloatWinBorder',              groups.LspSagaHoverBorder)
    Group.new('LspLinesDiagBorder',             groups.LspSagaHoverBorder)
    Group.new('LspSagaFinderSelection',         colors.green, colors.none, styles.bold)
    --Group.new('SagaShadow', colors.base02)

    Group.new('TelescopeMatching',      colors.orange, groups.Special, groups.Special, groups.Special)
    Group.new('TelescopeBorder',        colors.base01) -- float border not quite dark enough, maybe that needs to change?
    Group.new('TelescopePromptBorder',  colors.cyan)   -- active border lighter for clarity
    Group.new('TelescopeTitle',         groups.Normal) -- separate them from the border a little, but not make them pop
    Group.new('TelescopePromptPrefix',  groups.Normal) -- default is groups.Identifier

    Group.new('NeogitDiffAddHighlight', colors.blue, colors.red)
    Group.new('NeogitDiffDeleteHighlight', colors.blue, colors.red)
    Group.new('NeogitHunkHeader', groups.Normal, colors.base02)
    Group.new('NeogitHunkHeaderHighlight', groups.Normal, colors.red)
    Group.new('NeogitDiffContextHighlight', colors.base2, colors.base02)
    Group.new('NeogitCommandText',          groups.Normal)
    Group.new('NeogitCommandTimeText',      groups.Normal)
    Group.new('NeogitCommandCodeNormal',    groups.Normal)
    Group.new('NeogitCommandCodeError',     groups.Error)
    Group.new('NeogitNotificationError',    groups.Error,           colors.none)
    Group.new('NeogitNotificationInfo',     groups.Information,     colors.none)
    Group.new('NeogitNotificationWarning',  groups.Warning,         colors.none)

    -- seblj/nvim-tabline
    Group.new('TabLineSeparatorActive', colors.cyan)
    Group.link('TabLineModifiedSeparatorActive', groups.TablineSeparatorActive)

    function M.translate(group)
        if fn.has("nvim-0.6.0") == 0 then return group end

        if not string.match(group, "^LspDiagnostics") then return group end

        local translated = group
        translated = string.gsub(translated, "^LspDiagnosticsDefault", "Diagnostic")
        translated = string.gsub(translated, "^LspDiagnostics", "Diagnostic")
        translated = string.gsub(translated, "Warning$", "Warn")
        translated = string.gsub(translated, "Information$", "Info")
        return translated
    end

    local lspColors = {
         Error          = groups.Error,
         Warning        = groups.Warning,
         Information    = groups.Information,
         Hint           = groups.Hint,
    }
    for _, lsp in pairs({"Error", "Warning", "Information", "Hint"}) do
        local lspGroup = Group.new(M.translate("LspDiagnosticsDefault" .. lsp), lspColors[lsp])
        Group.link(M.translate("LspDiagnosticsVirtualText" .. lsp), lspGroup)
        Group.new(M.translate("LspDiagnosticsUnderline" .. lsp), colors.none, colors.none, styles.undercurl, lspColors[lsp])
    end

    for _, name in pairs({"LspReferenceText", "LspReferenceRead", "LspReferenceWrite"}) do
        Group.link(M.translate(name), groups.CursorLine)
    end

    return M
end

return M
