mongoose = require 'mongoose'
Schema   = mongoose.Schema

AppSchema = new Schema
  title:
    type: String
  content:
    type: String

UserSchema = new Schema
  name:
    type: String
  password:
    type: String
  id:
    type: String

FileSchema = new Schema
  name:
    type: String
  url:
    type: String
  date:
    type: Date
  id:
    type: String

module.exports =
  AppSchema: AppSchema
  App: mongoose.model 'apps', AppSchema
  FileSchema: FileSchema
  File: mongoose.model 'files', FileSchema