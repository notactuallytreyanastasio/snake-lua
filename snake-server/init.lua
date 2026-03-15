local temper = require('temper-core');
local newMultiGame, multiTick, multiRender, changePlayerDirection, isMultiGameOver, addPlayer, playerHeadChar, PlayerSnake, Right, Dead, Down, Left, Up, console_0, detectedCols__31, detectedRows__32, boardWidth__33, boardHeight__34, game__35, wsConns__36, nextId__37, running__38, fn__269, fn__268, exports;
newMultiGame = temper.import('snake', 'newMultiGame');
multiTick = temper.import('snake', 'multiTick');
multiRender = temper.import('snake', 'multiRender');
changePlayerDirection = temper.import('snake', 'changePlayerDirection');
isMultiGameOver = temper.import('snake', 'isMultiGameOver');
addPlayer = temper.import('snake', 'addPlayer');
playerHeadChar = temper.import('snake', 'playerHeadChar');
PlayerSnake = temper.import('snake', 'PlayerSnake');
Right = temper.import('snake', 'Right');
Dead = temper.import('snake', 'Dead');
Down = temper.import('snake', 'Down');
Left = temper.import('snake', 'Left');
Up = temper.import('snake', 'Up');
console_0 = 0.0;
detectedCols__31 = temper.stdtermcols();
detectedRows__32 = temper.stdtermrows();
boardWidth__33 = nil;
if (detectedCols__31 > 100) then
  boardWidth__33 = temper.int32_sub(detectedCols__31, 4);
else
  boardWidth__33 = 80;
end
boardHeight__34 = nil;
if (detectedRows__32 > 30) then
  boardHeight__34 = temper.int32_sub(detectedRows__32, 12);
else
  boardHeight__34 = 30;
end
game__35 = newMultiGame(boardWidth__33, boardHeight__34, 0, 42);
wsConns__36 = temper.listbuilder_constructor();
nextId__37 = 0;
running__38 = true;
fn__269 = temper.adapt_generator_fn(function()
  local t_1, t_2, t_3, t_4, t_5, t_6, local_7, local_8, local_9;
  local_7, local_8, local_9 = temper.pcall(function()
    while true do
      if not (temper.list_length(game__35.snakes) == 0) then
        break;
      end
      temper.stdsleep(500):await();
    end
    temper.log('Game starting!');
    while running__38 do
      local dirs__49, i__50, frame__52, conns__53, ci__54;
      dirs__49 = temper.listbuilder_constructor();
      i__50 = 0;
      while true do
        local snake__51;
        t_1 = temper.list_length(game__35.snakes);
        if not (i__50 < t_1) then
          break;
        end
        t_2 = game__35.snakes;
        t_3 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
        snake__51 = temper.listed_getor(t_2, i__50, t_3);
        temper.listbuilder_add(dirs__49, snake__51.direction);
        i__50 = temper.int32_add(i__50, 1);
      end
      t_4 = temper.listbuilder_tolist(dirs__49);
      t_5 = multiTick(game__35, t_4);
      game__35 = t_5;
      frame__52 = multiRender(game__35);
      conns__53 = temper.listbuilder_tolist(wsConns__36);
      ci__54 = 0;
      while true do
        local local_10, local_11, local_12;
        t_6 = temper.list_length(conns__53);
        if not (ci__54 < t_6) then
          break;
        end
        local_10, local_11, local_12 = temper.pcall(function()
          local conn__55;
          conn__55 = temper.list_get(conns__53, ci__54);
          temper.wssend(conn__55, frame__52):await();
        end);
        if local_10 then
        end
        ci__54 = temper.int32_add(ci__54, 1);
      end
      temper.stdsleep(200):await();
    end
  end);
  if local_7 then
  end
end);
temper.async_launch(fn__269);
fn__268 = temper.adapt_generator_fn(function()
  local t_15, t_16, local_17, local_18, local_19;
  local_17, local_18, local_19 = temper.pcall(function()
    local server__40;
    temper.log('Snake Multiplayer Server');
    temper.log('Starting on port 8080...');
    server__40 = temper.wslisten(8080):await();
    temper.log('Listening on ws://localhost:8080');
    temper.log('Waiting for players to connect...');
    while running__38 do
      local ws__41, playerId__42, symbol__43, connId__44, connWs__45, fn__231;
      t_16 = temper.wsaccept(server__40):await();
      ws__41 = t_16;
      playerId__42 = nextId__37;
      nextId__37 = temper.int32_add(nextId__37, 1);
      game__35 = addPlayer(game__35, temper.int32_add(temper.int32_mul(playerId__42, 7), 13));
      temper.listbuilder_add(wsConns__36, ws__41);
      symbol__43 = playerHeadChar(playerId__42);
      t_15 = temper.int32_tostring(playerId__42);
      temper.log(temper.concat('Player ', t_15, ' (', symbol__43, ') connected!'));
      connId__44 = playerId__42;
      connWs__45 = ws__41;
      fn__231 = function()
        local t_20, t_21, t_22, t_23, t_24, t_25, t_26, t_27, t_28, t_29, t_30, t_31, local_32, local_33, local_34;
        local_32, local_33, local_34 = temper.pcall(function()
          while running__38 do
            local msg__47;
            t_30 = temper.wsrecv(connWs__45):await();
            msg__47 = t_30;
            if not temper.is_null(msg__47) then
              t_20 = (type(msg__47) == 'string');
            else
              t_20 = false;
            end
            if t_20 then
              if temper.is_null(msg__47) then
                t_31 = temper.bubble();
              else
                t_31 = msg__47;
              end
              if temper.str_eq(t_31, 'u') then
                t_21 = Up();
                t_22 = changePlayerDirection(game__35, connId__44, t_21);
                game__35 = t_22;
              elseif temper.str_eq(t_31, 'd') then
                t_23 = Down();
                t_24 = changePlayerDirection(game__35, connId__44, t_23);
                game__35 = t_24;
              elseif temper.str_eq(t_31, 'l') then
                t_25 = Left();
                t_26 = changePlayerDirection(game__35, connId__44, t_25);
                game__35 = t_26;
              elseif temper.str_eq(t_31, 'r') then
                t_27 = Right();
                t_28 = changePlayerDirection(game__35, connId__44, t_27);
                game__35 = t_28;
              end
            else
              t_29 = temper.int32_tostring(connId__44);
              temper.log(temper.concat('Player ', t_29, ' disconnected'));
              break;
            end
          end
        end);
        if local_32 then
        end
      end;
      fn__231 = temper.adapt_generator_fn(fn__231);
      temper.async_launch(fn__231);
    end
  end);
  if local_17 then
  end
end);
temper.async_launch(fn__268);
temper.run_scheduler();
exports = {};
return exports;
