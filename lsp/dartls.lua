---@brief
---
--- https://github.com/dart-lang/sdk/tree/main/pkg/analysis_server
---
--- The Dart analysis server, shipped with the Dart SDK. It serves both Dart
--- and Flutter projects through a single language server.

---@type vim.lsp.Config
local dartls = {
  cmd = { 'dart', 'language-server', '--protocol=lsp' },
  filetypes = Lang.lsp_get_ft 'dartls',
  root_dir = require 'utils.fs'.cwd(),
  workspace_required = false,
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = true,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = true,
    flutterOutline = true,
  },
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
}

return dartls
