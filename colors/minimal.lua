-- minimal
--
-- Se comporta casi como t_Co=0: todo hereda el fg/bg de la terminal y la
-- estructura se da con atributos (bold / underline / reverse). Sólo unas
-- pocas cosas llevan color: comentarios, funciones, variables y diagnosticos.
--
-- Los colores son indices ANSI 0-15, o sea la paleta de tu terminal: si
-- cambias el tema de la terminal, nvim lo sigue. Requiere termguicolors off.

vim.o.termguicolors = false

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "minimal"

-- Paleta. nil = sin color (usa el fg por defecto de la terminal).
-- 0-7 normales, 8-15 brillantes. Cambia cualquiera a nil para apagarlo.
local c = {
	fn = 4, -- funciones y metodos
	var = 6, -- variables, parametros, campos
	type = nil, -- tipos, structs, clases
	kw = nil, -- keywords, operadores, preproc
	str = nil, -- strings
	const = nil, -- numeros, booleanos, constantes
	dim = 8, -- comentarios y cromo de la UI

	err = 1,
	warn = 3,
	info = 4,
	hint = 8,
	add = 2,
	del = 1,
	mod = 3,
}

local hi = {}
local link = {}

-- UI ------------------------------------------------------------------------
hi.Normal = {}
hi.NormalNC = {}
hi.NormalFloat = {}
hi.FloatBorder = { ctermfg = c.dim }
hi.FloatTitle = { cterm = { bold = true } }
hi.FloatFooter = { ctermfg = c.dim }
hi.MsgArea = {}
hi.MsgSeparator = { ctermfg = c.dim }

hi.Cursor = { cterm = { reverse = true } }
hi.lCursor = { cterm = { reverse = true } }
hi.CursorIM = { cterm = { reverse = true } }
hi.TermCursor = { cterm = { reverse = true } }
hi.TermCursorNC = {}

hi.CursorLine = {}
hi.CursorColumn = {}
hi.ColorColumn = { ctermbg = c.dim }
hi.LineNr = { ctermfg = c.dim }
hi.CursorLineNr = { cterm = { bold = true } }
hi.SignColumn = {}
hi.FoldColumn = { ctermfg = c.dim }
hi.Folded = { ctermfg = c.dim }
hi.WinSeparator = { ctermfg = c.dim }

hi.StatusLine = { cterm = { bold = true, reverse = true } }
hi.StatusLineNC = { cterm = { reverse = true } }
hi.WinBar = { cterm = { bold = true } }
hi.WinBarNC = { ctermfg = c.dim }
hi.TabLine = { cterm = { reverse = true } }
hi.TabLineFill = {}
hi.TabLineSel = { cterm = { bold = true } }

hi.Pmenu = {}
hi.PmenuSel = { cterm = { reverse = true } }
hi.PmenuKind = { ctermfg = c.dim }
hi.PmenuExtra = { ctermfg = c.dim }
hi.PmenuSbar = {}
hi.PmenuThumb = { ctermbg = c.dim }
hi.PmenuMatch = { cterm = { bold = true } }
hi.PmenuMatchSel = { cterm = { bold = true, reverse = true } }
hi.ComplMatchIns = { ctermfg = c.dim }
hi.SnippetTabstop = { cterm = { underline = true } }
hi.WildMenu = { cterm = { standout = true } }

hi.Visual = { cterm = { reverse = true } }
hi.VisualNOS = { cterm = { bold = true, underline = true } }
hi.Search = { cterm = { reverse = true } }
hi.IncSearch = { ctermfg = c.warn, cterm = { reverse = true } }
hi.CurSearch = { ctermfg = c.warn, cterm = { reverse = true } }
hi.Substitute = { ctermfg = c.warn, cterm = { reverse = true } }
hi.MatchParen = { cterm = { bold = true, underline = true } }
hi.QuickFixLine = { cterm = { bold = true } }

hi.NonText = { ctermfg = c.dim }
hi.EndOfBuffer = { ctermfg = c.dim }
hi.SpecialKey = { ctermfg = c.dim }
hi.Whitespace = { ctermfg = c.dim }
hi.Conceal = { ctermfg = c.dim }
hi.Directory = { cterm = { bold = true } }
hi.Title = { cterm = { bold = true } }
hi.Question = { cterm = { bold = true } }
hi.ModeMsg = { cterm = { bold = true } }
hi.MoreMsg = { ctermfg = c.dim }
hi.ErrorMsg = { ctermfg = c.err }
hi.WarningMsg = { ctermfg = c.warn }

hi.SpellBad = { cterm = { undercurl = true } }
hi.SpellCap = { cterm = { undercurl = true } }
hi.SpellLocal = { cterm = { undercurl = true } }
hi.SpellRare = { cterm = { undercurl = true } }

hi.DiffAdd = { ctermfg = c.add }
hi.DiffChange = { ctermfg = c.mod }
hi.DiffDelete = { ctermfg = c.del }
hi.DiffText = { ctermfg = c.mod, cterm = { bold = true } }
hi.Added = { ctermfg = c.add }
hi.Changed = { ctermfg = c.mod }
hi.Removed = { ctermfg = c.del }

-- Sintaxis ------------------------------------------------------------------
hi.Comment = { ctermfg = c.dim, cterm = { italic = true } }
hi.Constant = { ctermfg = c.const }
hi.String = { ctermfg = c.str }
hi.Identifier = { ctermfg = c.var }
hi.Function = { ctermfg = c.fn }
hi.Statement = { ctermfg = c.kw, cterm = { bold = true } }
hi.PreProc = { ctermfg = c.kw }
hi.Type = { ctermfg = c.type }
hi.Special = { ctermfg = c.const }
hi.Underlined = { cterm = { underline = true } }
hi.Ignore = { ctermfg = c.dim }
hi.Error = { ctermfg = c.err }
hi.Todo = { ctermfg = c.warn, cterm = { bold = true } }

link.Character = "String"
link.Number = "Constant"
link.Boolean = "Constant"
link.Float = "Constant"
link.Conditional = "Statement"
link.Repeat = "Statement"
link.Label = "Statement"
link.Operator = "Statement"
link.Keyword = "Statement"
link.Exception = "Statement"
link.Include = "PreProc"
link.Define = "PreProc"
link.Macro = "PreProc"
link.PreCondit = "PreProc"
link.StorageClass = "Type"
link.Structure = "Type"
link.Typedef = "Type"
link.SpecialChar = "Special"
link.Tag = "Special"
link.Delimiter = "Special"
link.SpecialComment = "Special"
link.Debug = "Special"
link.LineNrAbove = "LineNr"
link.LineNrBelow = "LineNr"
link.CursorLineFold = "FoldColumn"
link.CursorLineSign = "SignColumn"
link.VertSplit = "WinSeparator"
link.PmenuKindSel = "PmenuSel"
link.PmenuExtraSel = "PmenuSel"
link.StatusLineTerm = "StatusLine"
link.StatusLineTermNC = "StatusLineNC"

-- Diagnosticos y LSP --------------------------------------------------------
hi.DiagnosticError = { ctermfg = c.err }
hi.DiagnosticWarn = { ctermfg = c.warn }
hi.DiagnosticInfo = { ctermfg = c.info }
hi.DiagnosticHint = { ctermfg = c.hint }
hi.DiagnosticOk = { ctermfg = c.add }
hi.DiagnosticUnderlineError = { cterm = { undercurl = true } }
hi.DiagnosticUnderlineWarn = { cterm = { undercurl = true } }
hi.DiagnosticUnderlineInfo = { cterm = { underline = true } }
hi.DiagnosticUnderlineHint = { cterm = { underline = true } }
hi.DiagnosticUnderlineOk = { cterm = { underline = true } }
hi.DiagnosticVirtualTextError = { ctermfg = c.err, cterm = { italic = true } }
hi.DiagnosticVirtualTextWarn = { ctermfg = c.warn, cterm = { italic = true } }
hi.DiagnosticVirtualTextInfo = { ctermfg = c.info, cterm = { italic = true } }
hi.DiagnosticVirtualTextHint = { ctermfg = c.hint, cterm = { italic = true } }
hi.DiagnosticDeprecated = { cterm = { strikethrough = true } }
hi.DiagnosticUnnecessary = { ctermfg = c.dim }

hi.LspReferenceText = { cterm = { underline = true } }
hi.LspReferenceRead = { cterm = { underline = true } }
hi.LspReferenceWrite = { cterm = { underline = true } }
hi.LspReferenceTarget = { cterm = { underline = true } }
hi.LspInlayHint = { ctermfg = c.dim, cterm = { italic = true } }
hi.LspCodeLens = { ctermfg = c.dim, cterm = { italic = true } }
hi.LspCodeLensSeparator = { ctermfg = c.dim }
hi.LspSignatureActiveParameter = { cterm = { bold = true, underline = true } }

-- Treesitter ----------------------------------------------------------------
hi["@variable"] = { ctermfg = c.var }
hi["@variable.builtin"] = { ctermfg = c.var, cterm = { italic = true } }
hi["@variable.parameter"] = { ctermfg = c.var }
hi["@variable.member"] = { ctermfg = c.var }
hi["@property"] = { ctermfg = c.var }
hi["@field"] = { ctermfg = c.var }

hi["@function"] = { ctermfg = c.fn }
hi["@function.call"] = { ctermfg = c.fn }
hi["@function.builtin"] = { ctermfg = c.fn }
hi["@function.method"] = { ctermfg = c.fn }
hi["@function.method.call"] = { ctermfg = c.fn }
hi["@constructor"] = { ctermfg = c.fn }

hi["@type"] = { ctermfg = c.type }
hi["@type.builtin"] = { ctermfg = c.type }
hi["@module"] = {}
hi["@label"] = {}
hi["@operator"] = { ctermfg = c.kw }
hi["@punctuation.delimiter"] = {}
hi["@punctuation.bracket"] = {}
hi["@punctuation.special"] = {}

hi["@string"] = { ctermfg = c.str }
hi["@string.escape"] = { ctermfg = c.const, cterm = { bold = true } }
hi["@character"] = { ctermfg = c.str }
hi["@number"] = { ctermfg = c.const }
hi["@boolean"] = { ctermfg = c.const }
hi["@constant"] = { ctermfg = c.const }
hi["@constant.builtin"] = { ctermfg = c.const }

hi["@comment.error"] = { ctermfg = c.err }
hi["@comment.warning"] = { ctermfg = c.warn }
hi["@comment.todo"] = { ctermfg = c.warn, cterm = { bold = true } }
hi["@comment.note"] = { ctermfg = c.info }

hi["@markup.heading"] = { cterm = { bold = true } }
hi["@markup.strong"] = { cterm = { bold = true } }
hi["@markup.italic"] = { cterm = { italic = true } }
hi["@markup.strikethrough"] = { cterm = { strikethrough = true } }
hi["@markup.underline"] = { cterm = { underline = true } }
hi["@markup.link"] = { cterm = { underline = true } }
hi["@markup.link.url"] = { ctermfg = c.dim, cterm = { underline = true } }
hi["@markup.raw"] = { ctermfg = c.dim }
hi["@markup.list"] = { cterm = { bold = true } }
hi["@markup.quote"] = { ctermfg = c.dim, cterm = { italic = true } }

hi["@diff.plus"] = { ctermfg = c.add }
hi["@diff.minus"] = { ctermfg = c.del }
hi["@diff.delta"] = { ctermfg = c.mod }

hi["@tag"] = { ctermfg = c.kw }
hi["@tag.attribute"] = { ctermfg = c.var }
hi["@tag.delimiter"] = { ctermfg = c.dim }

-- Semantic tokens del LSP (mandan sobre los de arriba cuando hay servidor) ---
hi["@lsp.type.function"] = { ctermfg = c.fn }
hi["@lsp.type.method"] = { ctermfg = c.fn }
hi["@lsp.type.decorator"] = { ctermfg = c.fn }
hi["@lsp.type.variable"] = { ctermfg = c.var }
hi["@lsp.type.parameter"] = { ctermfg = c.var }
hi["@lsp.type.property"] = { ctermfg = c.var }
hi["@lsp.type.class"] = { ctermfg = c.type }
hi["@lsp.type.struct"] = { ctermfg = c.type }
hi["@lsp.type.enum"] = { ctermfg = c.type }
hi["@lsp.type.interface"] = { ctermfg = c.type }
hi["@lsp.type.type"] = { ctermfg = c.type }
hi["@lsp.type.typeParameter"] = { ctermfg = c.type }
hi["@lsp.type.enumMember"] = { ctermfg = c.const }
hi["@lsp.type.namespace"] = {}
hi["@lsp.type.macro"] = { ctermfg = c.kw }
hi["@lsp.type.keyword"] = { ctermfg = c.kw }
hi["@lsp.type.operator"] = { ctermfg = c.kw }
hi["@lsp.type.string"] = { ctermfg = c.str }
hi["@lsp.type.number"] = { ctermfg = c.const }
hi["@lsp.type.comment"] = { ctermfg = c.dim, cterm = { italic = true } }
hi["@lsp.mod.deprecated"] = { cterm = { strikethrough = true } }

-- Plugins -------------------------------------------------------------------
hi.CmpItemAbbr = {}
hi.CmpItemAbbrMatch = { cterm = { bold = true } }
hi.CmpItemAbbrMatchFuzzy = { cterm = { bold = true } }
hi.CmpItemAbbrDeprecated = { ctermfg = c.dim, cterm = { strikethrough = true } }
hi.CmpItemKind = { ctermfg = c.dim }
hi.CmpItemMenu = { ctermfg = c.dim, cterm = { italic = true } }
hi.CmpGhostText = { ctermfg = c.dim, cterm = { italic = true } }

hi.FzfLuaNormal = {}
hi.FzfLuaBorder = { ctermfg = c.dim }
hi.FzfLuaTitle = { cterm = { bold = true } }
hi.FzfLuaPreviewNormal = {}
hi.FzfLuaPreviewBorder = { ctermfg = c.dim }
hi.FzfLuaPreviewTitle = { cterm = { bold = true } }
hi.FzfLuaCursorLine = { cterm = { reverse = true } }
hi.FzfLuaHeaderText = { ctermfg = c.dim }
hi.FzfLuaHeaderBind = { ctermfg = c.dim }
hi.FzfLuaBufNr = { ctermfg = c.dim }
hi.FzfLuaBufFlagCur = { ctermfg = c.dim }
hi.FzfLuaBufFlagAlt = { ctermfg = c.dim }
hi.FzfLuaPathLineNr = { ctermfg = c.dim }
hi.FzfLuaPathColNr = { ctermfg = c.dim }

-- Espacios sobrantes (usar con :match ExtraWhitespace /\s\+$/)
hi.ExtraWhitespace = { ctermfg = c.err, cterm = { reverse = true } }

-- ---------------------------------------------------------------------------
for group, spec in pairs(hi) do
	vim.api.nvim_set_hl(0, group, spec)
end

for from, to in pairs(link) do
	vim.api.nvim_set_hl(0, from, { link = to })
end
