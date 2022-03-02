const webpack = require('webpack')

module.exports = new webpack.ProvidePlugin({
  $: "jquery/src/jquery",
  jQuery: "jquery/src/jquery",
});
