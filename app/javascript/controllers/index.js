// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const controllers = require.context("controllers", true, /.js$/)
controllers.keys().forEach(controllers)
