local cmd = vim.cmd
local fn = vim.fn

local M = {
    -- to use the colors defined here in your own customizations, call require('neosolarized').init() to set them up
    colors = require('colorbuddy.init').colors,
    styles = require('colorbuddy.init').styles,
    -- TODO: comment_underline = false, for example
    settings = {},
    -- so users can grab these without the requires to create options themselves
    cb = {
        Group = require('colorbuddy.init').Group,
        Color = require('colorbuddy.init').Color,
    },
    initialized = false,
}
-- TODO
local Color = require('colorbuddy.init').Color
local Group = require('colorbuddy.init').Group
local groups = require('colorbuddy.init').groups
local styles = require('colorbuddy.init').styles

function M.init()
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

    --Color.new('bg', colors.base03.to_rgb)

    M.initialized = true
    return M
end

function M.setup_highlights(opts)
    local hl = {}
    local colors = require('colorbuddy.init').colors

    hl['Normal']    = { colors.base0    }
    hl['Comment']   = { colors.base01,  colors.none,    styles.italic }
    hl['Constant']  = { colors.cyan     }
    -- Any variable name, function or class name
    hl['Identifier'] = { colors.blue    }
    -- any statement, conditional, repeat (for, do while), label, operator
    hl['Statement'] = { colors.green    }
    hl['PreProc']   = { colors.orange   }
    hl['Type']      = { colors.yellow   }
    hl['Special']   = { colors.red      }

    hl['Underlined'] = { colors.violet  }
    hl['Ignore']     = { colors.none    }
    hl['Error']      = { colors.red     }
    hl['TODO']       = { colors.magenta }

    hl['SpecialKey']    = { colors.base00,        colors.base02,    styles.bold     }
    hl['NonText']       = { colors.base00,        colors.NONE,      styles.bold     }
    hl['StatusLine']    = { colors.base1,         colors.base02,    styles.reverse  }
    hl['StatusLineNC']  = { colors.base00,        colors.base02,    styles.reverse  }
    hl['Visual']        = { colors.base01,        colors.base03,    styles.reverse  }
    hl['Directory']     = { colors.blue,          colors.none,      styles.NONE     }
    hl['ErrorMsg']      = { colors.red,           colors.none,      styles.reverse  }

    hl['IncSearch'] = { colors.orange,        colors.none,      styles.standout     }
    hl['Search']    = { colors.yellow,        colors.none,      styles.reverse      }

    hl['MoreMsg']       = { colors.blue     }
    hl['ModeMsg']       = { colors.blue     }
    hl['LineNr']        = { colors.base01,  colors.base02,    styles.NONE     }
    hl['Question']      = { colors.cyan,    colors.none,      styles.bold     }
    hl['VertSplit']     = { colors.base00,  colors.none,      styles.NONE     }
    hl['Title']         = { colors.orange,  colors.none,      styles.bold     }
    hl['VisualNOS']     = { colors.none,    colors.base02,    styles.reverse  }
    hl['WarningMsg']    = { colors.red,     colors.none,      styles.NONE     }
    hl['WildMenu']      = { colors.base2,   colors.base02,    styles.reverse  }
    hl['Folded']        = { colors.base0,   colors.base02,    styles.bold,      colors.base03 }
    hl['FoldColumn']    = { colors.base0,   colors.base02   }

    hl['DiffAdd']       = { colors.green,   colors.base02,    styles.bold,      colors.green  }
    hl['DiffChange']    = { colors.yellow,  colors.base02,    styles.bold,      colors.yellow }
    hl['DiffDelete']    = { colors.red,     colors.base02,    styles.bold     }
    hl['DiffText']      = { colors.blue,    colors.base02,    styles.bold,      colors.blue   }

    hl['SignColumn']    = { colors.base0,   colors.none,    styles.NONE     }
    hl['Conceal']       = { colors.blue,    colors.none,    styles.NONE     }

    hl['SpellBad']      = { colors.none,     colors.none, styles.undercurl, colors.red      }
    hl['SpellCap']      = { colors.none,     colors.none, styles.undercurl, colors.violet   }
    hl['SpellRare']     = { colors.none,     colors.none, styles.undercurl, colors.cyan     }
    hl['SpellLocal']    = { colors.none,     colors.none, styles.undercurl, colors.yellow   }

    -- pum (popup menu)
    hl['Pmenu']         = { colors.base0,    colors.base02,  styles.reverse }
    hl['PmenuSel']      = { colors.base01,   colors.base2,   styles.reverse }
    hl['PmenuSbar']     = { colors.base2,    colors.base0,   styles.reverse }
    hl['PmenuThumb']    = { colors.base0,    colors.base03,  styles.reverse }

    hl['CmpItemKind']      = { colors.base0,    colors.base02,  styles.reverse  }
    hl['CmpItemMenu']      = { colors.base0,    colors.base02,  styles.reverse  }
    hl['CmpItemAbbr']      = { colors.base0,    colors.base02,  styles.reverse  }
    hl['CmpItemAbbrMatch'] = { colors.base0,    colors.base02,  styles.reverse  }

    hl['TabLine']       = { colors.base0,    colors.base02,  styles.NONE,        colors.base0  }
    hl['TabLineFill']   = { colors.base0,    colors.base02,  styles.NONE,        colors.base0  }
    hl['TabLineSel']    = { colors.base01,   colors.base2,   styles.reverse,     colors.base0  }

    hl['CursorLine']    = { colors.none,     colors.base02,  styles.NONE,   colors.base1  }
    hl['CursorLineNr']  = { colors.none,     colors.base02,  styles.NONE,   colors.base1  }
    hl['ColorColumn']   = { colors.none,     colors.base02,  styles.NONE    }
    hl['Cursor']        = { colors.base03,   colors.base0,   styles.NONE    }
    --hl['lCursor']       = { groups.Cursor,   groups.Cursor,  groups.Cursor  }

    hl['MatchParen']    = { colors.red,     colors.base01,  styles.bold     }

    hl['GitGutterAdd']          = { colors.green }
    hl['GitGutterChange']       = { colors.yellow }
    hl['GitGutterDelete']       = { colors.red }
    hl['GitGutterChangeDelete'] = { colors.red }

--     -- vim highlighting
--     hl['vimVar']        =   { groups.Identifier,   groups.Identifier, groups.Identifier    }
--     hl['vimFunc']       =   { groups.Identifier,   groups.Identifier, groups.Identifier    }
--     hl['vimUserFunc']   =   { groups.Identifier,   groups.Identifier, groups.Identifier    }
--     hl['helpSpecial']   =   { groups.Special,      groups.Special, groups.Special          }
--     hl['vimSet']        =   { groups.Normal,       groups.Normal, groups.Normal            }
--     hl['vimSetEqual']   =   { groups.Normal,       groups.Normal, groups.Normal            }

    hl['vimCommentString']      = { colors.violet }
    hl['vimCommand']            = { colors.yellow }
    hl['vimCmdSep']             = { colors.blue,        colors.NONE,        styles.bold }
    hl['helpExample']           = { colors.base1 }
    hl['helpOption']            = { colors.cyan }
    hl['helpNote']              = { colors.magenta }
    hl['helpVim']               = { colors.magenta }
    hl['helpHyperTextJump']     = { colors.blue,        colors.NONE,        styles.underline }
    hl['helpHyperTextEntry']    = { colors.green }
    hl['vimIsCommand']          = { colors.base00 }
    hl['vimSynMtchOpt']         = { colors.yellow }
    hl['vimSynType']            = { colors.cyan }
    hl['vimHiLink']             = { colors.blue }
    hl['vimGroup']              = { colors.blue,        colors.NONE,        styles.underline + styles.bold }

--     hl['gitcommitSummary']          = { colors.green    }
--     hl['gitcommitComment']          = { colors.base01,  colors.NONE,    styles.italic }
--     hl['gitcommitUntracked']        = { groups.gitcommitComment,    groups.gitcommitComment,    groups.gitcommitComment }
--     hl['gitcommitDiscarded']        = { groups.gitcommitComment,    groups.gitcommitComment,    groups.gitcommitComment }
--     hl['gitcommitSelected']         = { groups.gitcommitComment }
--     hl['gitcommitUnmerged']         = { colors.green,               colors.NONE,            styles.bold }
--     hl['gitcommitOnBranch']         = { colors.base01,              colors.NONE,            styles.bold }
--     hl['gitcommitBranch']           = { colors.magenta,             colors.NONE,            styles.bold }
--     hl['gitcommitNoBranch']         = { groups.gitcommitBranch, groups.gitcommitBranch, groups.gitcommitBranch }
--     hl['gitcommitDiscardedType']    = { colors.red      }
--     hl['gitcommitSelectedType']     = { colors.green    }
--     hl['gitcommitHeader']           = { colors.base01   }
--     hl['gitcommitUntrackedFile']    = { colors.cyan     }
--     hl['gitcommitDiscardedFile']    = { colors.red      }
--     hl['gitcommitSelectedFile']     = { colors.green    }
--     hl['gitcommitUnmergedFile']     = { colors.yellow   }
--     hl['gitcommitFile']             = { colors.base0    }
--     hl['gitcommitDiscardedArrow']   = { groups.gitCommitDiscardedFile,  groups.gitCommitDiscardedFile,  groups.gitCommitDiscardedFile   }
--     hl['gitcommitSelectedArrow']    = { groups.gitCommitSelectedFile,   groups.gitCommitSelectedFile,   groups.gitCommitSelectedFile    }
--     hl['gitcommitUnmergedArrow']    = { groups.gitCommitUnmergedFile,   groups.gitCommitUnmergedFile,   groups.gitCommitUnmergedFile    }

--     hl['diffAdded'] = { groups.Statement    }
--     hl['diffLine']  = { groups.Identifier   }

    hl['NeomakeErrorSign']          = { colors.orange   }
    hl['NeomakeWarningSign']        = { colors.yellow   }
    hl['NeomakeMessageSign']        = { colors.cyan     }
    hl['NeomakeNeomakeInfoSign']    = { colors.green    }

--     hl['TelescopeMatching']     =  { colors.orange,  groups.Special,     groups.Special,     groups.Special     }

    -- lsp / diagnostic colors. ripped from lsp-colors
    local lspColors = {
        Error = colors.red,
        Warning = colors.yellow,
        Information = colors.blue,
        Hint = colors.cyan,
    }

    local function translate(group)
      if fn.has("nvim-0.6.0") == 0 then
        return group
      end

      if not string.match(group, "^LspDiagnostics") then
        return group
      end

      local translated = group
      translated = string.gsub(translated, "^LspDiagnosticsDefault", "Diagnostic")
      translated = string.gsub(translated, "^LspDiagnostics", "Diagnostic")
      translated = string.gsub(translated, "Warning$", "Warn")
      translated = string.gsub(translated, "Information$", "Info")
      return translated
    end

    for _, lsp in pairs({ "Error", "Warning", "Information", "Hint" }) do
        local lspcolor = lspColors[lsp]
        hl[translate("LspDiagnosticsDefault" .. lsp)]       = { lspcolor }
        hl[translate("LspDiagnosticsVirtualText" .. lsp)]   = { lspcolor }
        hl[translate("LspDiagnosticsUnderline" .. lsp)]     = { colors.none, colors.none, styles.undercurl, lspcolor }
    end

    -- for  _, name in pairs({ "LspReferenceText", "LspReferenceRead", "LspReferenceWrite" }) do
    --     hl[translate(name)] = { groups.CursorLine, groups.CursorLine, groups.CursorLine }
    -- end


    local highlight = function(name, hls, mod)
        local fg = mod[1] or hls[1] or colors.none
        local bg = mod[2] or hls[2] or colors.none
        local style = mod[3] or hls[3] or styles.NONE
        local guisp = mod[4] or hls[5] or colors.none

        -- print("name: ", name)
        -- print("hls1: ", hls[1])
        -- print("fg: ", fg)
        -- print("bg: ", bg)
        -- print("style: ", style)
        -- print("guisp: ", guisp)

        Group.new(name, fg, bg, style, guisp)
    end

    for group, highlights in pairs(hl) do
        highlight(group, highlights, opts[group] or {})
	end
end

function M.setup(opts)
    if not opts then
        opts = {}
    end

    cmd([[
        packadd! colorbuddy.nvim
        highlight clear
    ]])

    if fn.exists('syntax_on') then
        cmd('syntax reset')
    end

    vim.g.colors_name = 'neosolarized'

    if not M.initialized then
        M.init()
    end

    M.setup_highlights(opts)
end

return M
