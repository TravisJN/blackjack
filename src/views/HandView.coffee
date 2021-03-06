class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>) <span class="finalMsg"></span></h2>'

  initialize: ->
    @collection.on 'add remove change flip2', => @render()
    @collection.on 'bust', => @renderBust()
    @collection.on 'playerLost', =>
      console.log('playerlost')
      @renderLoss()
    @collection.on 'playerWin', =>
      console.log('playerwin')
      @renderWin()
    @collection.on 'push', =>
      console.log('push')
      @renderPush()
    @collection.on 'blackJack', =>
      @renderBlackJack()
    @render()

  render: ->
    # debugger
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]

  renderBust: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    @$('.finalMsg').text " - Busted!"

  renderWin: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    @$('.finalMsg').text " - You WIN!"

  renderLoss: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    @$('.finalMsg').text " - You Lost!"

  renderPush: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    @$('.finalMsg').text " - Push"

  renderBlackJack: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]
    @$('.finalMsg').text " - BLACKJACK!"

