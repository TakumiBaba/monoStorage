module.exports = (app, io) ->

  # Controller
  controllers   = app.settings.controllers
  AppController = controllers.AppController app
  user = {}

  #websocket routing
  io.sockets.on 'connection', AppController.websocket.connection


  # Routing
  app.get '/', AppController.index
  app.get '/json', AppController.json
  app.get '/takumibaba/data', AppController.data
  app.get '/:username\/:id\/mount', AppController.websocket.mount
  app.get '/:username\/:id\/unmount', AppController.websocket.unmount