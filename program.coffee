express = require 'express'
multer = require 'multer'
url = require 'url'
path = require 'path'
upload = multer()
app = express()

app.set 'view engine', 'pug'
app.set 'views', path.join __dirname, 'views'
app.use express.static path.join __dirname, 'public'

getData = (obj) ->
  {name : obj.originalname,
  size : obj.size}

app.get '/', (req,res) ->
  res.render 'index'

app.post '/file', upload.single('files'), (req, res) ->
  res.send getData req.file

listener = app.listen process.env.PORT, ->
  console.log 'Your app is listening on port ' + listener.address().port
