" if you want to customize, instead of using `colorscheme neosolarized' pass
" pass in options to neosolarized.
lua << EOF
    local n = require('neosolarized').init()
    n.setup({
        TODO = { n.colors.blue },
    })
EOF

"
" Example customization

" lua << EOF
"    n = require('neosolarized').init()
"    n.setup({
"        TODO = { n.colors.blue },
"    })
" EOF
