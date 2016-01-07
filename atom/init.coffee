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

# Allows for a vim-mode keymapping of "kj" to be used as ESC
atom.commands.add 'atom-text-editor', 'activate-normal-mode-if-preceded-by-k': (e) ->
  targetChar = 'k' # This should be the FIRST char in your desired mapping
  editor = @getModel()
  pos = editor.getCursorBufferPosition()
  range = [pos.traverse([0,-1]), pos]
  lastChar = editor.getTextInBufferRange(range)
  if lastChar is targetChar
    editor.backspace() # remove the 'k' character from the buffer
    atom.commands.dispatch(e.currentTarget, 'vim-mode:activate-normal-mode')
  else
    e.abortKeyBinding()
