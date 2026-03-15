local temper = require('temper-core');
local sleep, readLine, terminalColumns, terminalRows, exports;
sleep = function(ms__4)
  return temper.bubble();
end;
readLine = function()
  return temper.bubble();
end;
terminalColumns = function()
  return temper.bubble();
end;
terminalRows = function()
  return temper.bubble();
end;
temper.run_scheduler();
exports = {};
exports.sleep = sleep;
exports.readLine = readLine;
exports.terminalColumns = terminalColumns;
exports.terminalRows = terminalRows;
return exports;
