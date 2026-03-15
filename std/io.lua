local temper = require('temper-core');
local sleep, readLine, exports;
sleep = function(ms__2)
  return temper.bubble();
end;
readLine = function()
  return temper.bubble();
end;
exports = {};
exports.sleep = sleep;
exports.readLine = readLine;
return exports;
