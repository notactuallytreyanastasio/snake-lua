local temper = require('temper-core');
local WsServer, WsConnection, wsListen, wsAccept, wsConnect, wsSend, wsRecv, wsClose, exports;
WsServer = temper.type('WsServer');
WsConnection = temper.type('WsConnection');
wsListen = function(port__6)
  return temper.bubble();
end;
wsAccept = function(server__8)
  return temper.bubble();
end;
wsConnect = function(url__10)
  return temper.bubble();
end;
wsSend = function(conn__12, msg__13)
  return temper.bubble();
end;
wsRecv = function(conn__15)
  return temper.bubble();
end;
wsClose = function(conn__17)
  return temper.bubble();
end;
temper.run_scheduler();
exports = {};
exports.WsServer = WsServer;
exports.WsConnection = WsConnection;
exports.wsListen = wsListen;
exports.wsAccept = wsAccept;
exports.wsConnect = wsConnect;
exports.wsSend = wsSend;
exports.wsRecv = wsRecv;
exports.wsClose = wsClose;
return exports;
