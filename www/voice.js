
var exec = require('cordova/exec');

var PLUGIN_NAME = 'VoiceCordovaPlugin';

var VoiceCordovaPlugin = {
  isSiriInitilized: function(cb) {
    exec(cb, null, PLUGIN_NAME, 'isSiriInitilized', []);
  },
  getDate: function(cb) {
    exec(cb, null, PLUGIN_NAME, 'getDate', []);
  },
  clearData: function(cb) {
    exec(cb, null, PLUGIN_NAME, 'clearData', []);
  },
  setSupportedCurrency: function(curreny, cb) {
    exec(cb, null, PLUGIN_NAME, 'setSupportedCurrency', [curreny]);
  }
};

module.exports = VoiceCordovaPlugin;