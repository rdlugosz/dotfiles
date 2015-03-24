# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)

# Used by vim-mode keymappings to allow for multi-char mappings, e.g., jj = ESC
atom.commands.add 'atom-text-editor', 'insert-incomplete-binding', (e) ->
  if oe = e.originalEvent && e.originalEvent.originalEvent
    char = String.fromCharCode(oe.which)
    char = char.toLowerCase() unless oe.shift
    atom.workspace.activePaneItem.insertText(char)
