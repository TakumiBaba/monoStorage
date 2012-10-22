fs = require 'fs'
Users = {}

exports.AppController = (app) ->

  {App} = app.settings.models

  return {
    index: (req, res, next) ->
      res.render 'index'
        req: req

    json: (req, res, next)->

      imageDir = fs.readdirSync './public/takumibaba'
      hoge =[]
      for key in imageDir
        hoge.push key

      console.log hoge
      res.json hoge

    data: (req, res, next)->
      fs.readFile './public/takumibaba/research.pdf', (err, data)->
        if err
          console.log err
        console.log data
        res.type 'pdf'
        res.send data
    websocket:
      users: {}
      connection: (socket)->
        socket.on 'setid', (data)->
          Users[data.id] = socket
          console.log Users


      mount: (req, res, next)->
        Users[req.params.id].emit 'mount'
        res.render 'index'
          req: req

      unmount: (req, res, next)->
        Users[req.params.id].emit 'unmount'
        res.render 'index'
          req: req
  }
