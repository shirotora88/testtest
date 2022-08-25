TesttestView = require './testtest-view'
{CompositeDisposable} = require 'atom'

module.exports = Testtest =
  testtestView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @testtestView = new TesttestView(state.testtestViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @testtestView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'testtest:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @testtestView.destroy()

  serialize: ->
    testtestViewState: @testtestView.serialize()

  toggle: ->
    console.log 'Testtest was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
