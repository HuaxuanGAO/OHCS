const {environment} = require('@rails/webpacker')
const webpack = require('webpack')

module.exports = environment

environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        jquery: 'jquery',
        'window.jQuery': 'jquery',
        "window.$": "jquery",
        Popper: ['popper.js', 'default'],
        Rails: ['@rails/ujs']
    })
)