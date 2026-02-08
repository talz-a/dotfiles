vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
end

vim.o.termguicolors = true
vim.g.colors_name = 'temp'

local c = {
    bg          = '#292929',
    fg          = '#D3B58D',

    bg_dark     = '#1e1e1e',
    bg_light    = '#353535',

    cursor      = '#ffffff',
    line_nr     = '#5a5a5a',
    visual      = '#0000FF',
    search_bg   = '#d7ba7d',
    search_fg   = '#000000',
    match_paren = '#ffaf00',

    comment     = '#FFFF00',
    string      = '#BEBEBE',
    keyword     = '#ffffff',
    constant    = '#BFC9DB',
    func        = '#ffffff',
    type        = '#98FB98',
    variable    = '#D3B58D',
    number      = '#7AD0C6',
    macro       = '#E67D74',

    error       = '#ff0000',
    warning     = '#E4D97D',
    todo        = '#000000',
}

local function set_hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
set_hl('Normal', { fg = c.fg, bg = c.bg })
set_hl('SignColumn', { bg = c.bg })
set_hl('Cursor', { fg = c.bg, bg = c.cursor })
set_hl('CursorLine', { bg = c.bg_light })
set_hl('LineNr', { fg = c.line_nr })
set_hl('CursorLineNr', { fg = c.keyword })
set_hl('VertSplit', { fg = c.line_nr, bg = c.bg })
set_hl('WinSeparator', { fg = c.line_nr, bg = c.bg })
set_hl('Visual', { bg = c.visual })
set_hl('Search', { fg = c.search_fg, bg = c.search_bg })
set_hl('IncSearch', { fg = c.search_fg, bg = c.search_bg })
set_hl('MatchParen', { fg = c.match_paren })
set_hl('StatusLine', { fg = c.bg, bg = c.fg })
set_hl('StatusLineNC', { fg = c.fg, bg = c.bg_dark })

-- Syntax
set_hl('Comment', { fg = c.comment })
set_hl('String', { fg = c.string })
set_hl('Character', { fg = c.string })
set_hl('Delimiter', { fg = c.fg })
set_hl('Number', { fg = c.number })
set_hl('Boolean', { fg = c.constant })
set_hl('Float', { fg = c.number })
set_hl('Constant', { fg = c.constant })
set_hl('Identifier', { fg = c.variable })
set_hl('Function', { fg = c.func })

-- Keywords ONLY
set_hl('Keyword', { fg = c.keyword })
set_hl('Conditional', { fg = c.keyword })
set_hl('Repeat', { fg = c.keyword })
set_hl('Exception', { fg = c.keyword })

-- Statements but not keywords
set_hl('Statement', { fg = c.fg })
set_hl('Label', { fg = c.fg })
set_hl('Operator', { fg = c.fg })

-- Types & structure
set_hl('Type', { fg = c.type })
set_hl('Structure', { fg = c.type })
set_hl('Typedef', { fg = c.type })
set_hl('PreProc', { fg = c.macro })
set_hl('Special', { fg = c.fg })
set_hl('Error', { fg = c.error })
set_hl('Todo', { fg = c.todo, bg = c.comment })

-- LSP / Neovim diagnostic groups
set_hl('DiagnosticError', { fg = c.error })
set_hl('DiagnosticWarn', { fg = c.warning })
set_hl('DiagnosticInfo', { fg = c.constant })
set_hl('DiagnosticHint', { fg = c.comment })
set_hl('DiagnosticVirtualTextError', { fg = c.error })
set_hl('DiagnosticVirtualTextWarn', { fg = c.warning })
set_hl('DiagnosticVirtualTextInfo', { fg = c.constant })
set_hl('DiagnosticVirtualTextHint', { fg = c.comment })

-- Completion menu
set_hl('Pmenu', { fg = c.fg, bg = c.bg_dark })
set_hl('PmenuSel', { fg = c.keyword, bg = c.visual })
set_hl('PmenuSbar', { bg = c.bg_dark })
set_hl('PmenuThumb', { bg = c.line_nr })

-- Floating windows
set_hl('NormalFloat', { fg = c.fg, bg = c.bg_dark })
set_hl('FloatBorder', { fg = c.line_nr, bg = c.bg_dark })
set_hl('FloatTitle', { fg = c.fg, bg = c.bg_dark })

-- Treesitter
set_hl('@variable', { fg = c.variable })
set_hl('@variable.builtin', { fg = c.constant })
set_hl('@function', { fg = c.func })
set_hl('@function.builtin', { fg = c.func })
set_hl('@function.macro', { fg = c.macro })
set_hl('@constant', { fg = c.constant })
set_hl('@constant.builtin', { fg = c.constant })
set_hl('@string', { fg = c.string })
set_hl('@number', { fg = c.number })
set_hl('@number.float', { fg = c.number })
set_hl('@keyword', { fg = c.keyword })
set_hl('@type', { fg = c.type })
set_hl('@type.builtin', { fg = c.type })
set_hl('@type.qualifier', { fg = c.type })
set_hl('@boolean', { fg = c.constant })
set_hl('@operator', { fg = c.fg })
set_hl('@comment', { fg = c.comment })
set_hl('@punctuation.bracket', { fg = c.fg })
set_hl('@punctuation.delimiter', { fg = c.fg })
