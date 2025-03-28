vim.g.colors_name = "defaults_override"

-- Default colours are defined in
-- https://github.com/neovim/neovim/blob/master/src/nvim/highlight_group.c.

local highlights = {
    Normal = { bg = "#111111" },
    ColorColumn = { bg = "#121212" },
    CursorLineNr = { bold = false, fg = "#adadad" },
    Visual = { bg = "#323239" },
    FloatBorder = { fg = "NvimDarkGrey4" },

    Added = { fg = "Green" },
    Changed = { fg = "#bbbb00" },
    Removed = { fg = "Red3" },

    diffLine = { fg = "NvimLightCyan" },
    diffFile = { fg = "DarkCyan" },
    diffOldFile = { fg = "DarkRed" },
    diffNewFile = { fg = "DarkGreen" },
    diffIndexLine = { fg = "DarkCyan" },
    diffSubname = { fg = "Grey", bold = true },

    GitSignsStagedDelete = { link = "DiffOldFile", bold = true },
    gitcommitSummary = { link = "Title" },

    UndotreeTimeStamp = { link = "Normal" },
    UndotreeNode = { link = "Normal" },

    NetrwClassify = { link = "Normal" },
    NetrwTreeBar = { fg = "NvimDarkGrey3" },

    QuickFixLine = { bg = "NvimDarkGrey2", bold = true },
    qfFileName = { link = "Identifier" },
    qfLineNr = { fg = "NvimLightGreen" },

    StatusLine = { fg = "Black", bg = "NvimLightGrey4" },
    StatusLineModeNormal = { fg = "Black", bg = "NvimDarkBlue", bold = true },
    StatusLineModeInsert = { fg = "Black", bg = "Green", bold = true },
    StatusLineModeVisual = { fg = "Black", bg = "NvimDarkGrey4", bold = true },
    StatusLineModeReplace = { fg = "Black", bg = "NvimDarkRed", bold = true },
    StatusLineModeCommand = { fg = "NvimLightGrey4", bg = "Grey8", bold = true },
    StatusLineModeTerminal = { link = "StatusLineModeCommand" },
    StatusLineModeUnknown = { fg = "Black", bg = "DarkOrange3", bold = true },

    WildMenu = { fg = "NvimLightGrey3", bg = "None" },

    Keyword = { fg = "SteelBlue1", bold = true },
    Function = { fg = "NvimLightGrey2" },
    Type = { fg = "LightGoldenrod" },
    Comment = { fg = "#6a6a6a" },
    Special = { link = "Function" },
    Number = { fg = "Violet" },
    Boolean = { link = "Number" },
    Constant = { fg = "Peru" },
    PreProc = { fg = "CornflowerBlue" },
    Statement = { fg = "SteelBlue1" },

    manSubHeading = { link = "manSectionHeading" },

    CmpItemAbbrMatch = { bold = true },
    CmpItemAbbrDeprecated = { strikethrough = true },
    CmpItemKind = { link = "Identifier" },
    CmpItemMenu = { link = "Comment" },

    LspReferenceText = { underdotted = true },
    LspInlayHint = { fg = "#6a6a6a" },

    DiagnosticUnnecessary = {},

    ["@function.builtin"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.method.call"] = { link = "@function.call" },
    ["@type.builtin"] = { link = "Type" },
    ["@variable.builtin"] = { link = "Keyword" },
    ["@variable.builtin.python"] = { fg = "NvimLightBlue" },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.directive"] = { fg = "SteelBlue4" },
    ["@constructor"] = { link = "Type" },
    ["@constructor.lua"] = { link = "Delimiter" },
    ["@markup.raw"] = { bg = "NvimDarkGrey3" },
    ["@markup.raw.block.vimdoc"] = {},
    ["@markup.quote"] = { fg = "NvimLightGrey4" },
    ["@markup.list"] = { link = "Number" },
    ["@tag.attribute"] = { link = "PreProc" },
    ["@punctuation.special.diff"] = { link = "Comment" },
    ["@attribute.diff"] = { link = "diffLine" },
    ["@string.special.path.diff"] = { link = "diffFile" },

    TexMathMatcher = { link = "Normal" },
    texMathZoneX = { link = "TexMathMatcher" },
    texMathZoneW = { link = "TexMathMatcher" },
    texRefZone = { link = "@markup.link" },

    ["@markup.math.latex"] = { link = "Normal" },
    ["@function.macro.latex"] = { link = "Statement" },
    ["@function.latex"] = { link = "@function.macro.latex" },
    ["@module.latex"] = { link = "PreProc" },
    ["@label.latex"] = { link = "Constant" },
    ["@punctuation.special.latex"] = { link = "Statement" }
}

for group, options in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, options)
end
