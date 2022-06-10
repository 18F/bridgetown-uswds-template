const path = require('path');
const { merge } = require('webpack-merge');
const CopyPlugin = require('copy-webpack-plugin');

var config = require("./config/webpack.defaults.js");

// Add any overrides to the default webpack config here:
//
// Eg:
//
//  ```
//    const path = require("path")
//    config.resolve.modules.push(path.resolve(__dirname, 'frontend', 'components'))
//    config.resolve.alias.frontendComponents = path.resolve(__dirname, 'frontend', 'components')
//  ```
//
// You can also merge in a custom config using the included `webpack-merge` package.
// Complete docs available at: https://github.com/survivejs/webpack-merge
//
// Eg:
//
//  ```
//    const customConfig = { ..... }
//    config = merge(config, customConfig)
//  ```
const customConfig = {
  plugins: [
    new CopyPlugin({
      patterns: [
        {
          from: path.resolve(__dirname, "node_modules", "@uswds", "uswds", "dist", "img"),
          to: "../images/"
        },
        {
          from: path.resolve(__dirname, "node_modules", "@uswds", "uswds", "dist", "fonts"),
          to: "../fonts/"
        },
        {
          from: path.resolve(__dirname, "node_modules", "@uswds", "uswds", "dist", "js", "uswds-init.js"),
          to: ""
        },
        {
          from: path.resolve(__dirname, "node_modules", "@uswds", "uswds", "dist", "js", "uswds.js"),
          to: ""
        },
        {
          from: path.resolve(__dirname, "node_modules", "@uswds", "uswds", "dist", "css", "uswds.css"),
          to: "../css/"
        },
        {
          from: path.resolve(__dirname, "node_modules", "@uswds", "uswds", "dist", "css", "uswds.min.css"),
          to: "../css/"
        },
        {
          from: path.resolve(__dirname, "node_modules", "@uswds", "uswds", "dist", "css", "uswds.min.css.map"),
          to: "../css/"
        }
      ]
    })
  ]
};

config = merge(config, customConfig);


////////////////////////////////////////////////////////

module.exports = config;
