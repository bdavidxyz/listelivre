const { environment } = require('@rails/webpacker')
// OVER HERE 🙌 ----- Require the new alias file
const customConfig = require('./alias')

const nodeModulesLoader = environment.loaders.get('nodeModules')
if (!Array.isArray(nodeModulesLoader.exclude)) {
  nodeModulesLoader.exclude = (nodeModulesLoader.exclude == null)
    ? []
    : [nodeModulesLoader.exclude]
}

// DOWN HERE ALSO 🙌 ----- Merge new resolve alias to our existing configuration
environment.config.merge(customConfig)

module.exports = environment  
