local temper = require('temper-core');
local newMultiGame, multiTick, multiRender, changePlayerDirection, isMultiGameOver, addPlayer, playerHeadChar, PlayerSnake, Right, Dead, Down, Left, Up, console_0, detectedCols__35, detectedRows__36, boardWidth__37, boardHeight__38, game__39, wsConns__40, nextId__41, running__42, fn__330, fn__329, exports;
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
detectedCols__35 = temper.stdtermcols();
detectedRows__36 = temper.stdtermrows();
boardWidth__37 = nil;
if (detectedCols__35 > 100) then
  boardWidth__37 = temper.int32_sub(detectedCols__35, 4);
else
  boardWidth__37 = 80;
end
boardHeight__38 = nil;
if (detectedRows__36 > 30) then
  boardHeight__38 = temper.int32_sub(detectedRows__36, 12);
else
  boardHeight__38 = 30;
end
game__39 = newMultiGame(boardWidth__37, boardHeight__38, 0, 42);
wsConns__40 = temper.listbuilder_constructor();
nextId__41 = 0;
running__42 = true;
fn__330 = temper.adapt_generator_fn(function()
  local t_1, t_2, t_3, t_4, t_5, local_6, local_7, local_8;
  local_6, local_7, local_8 = temper.pcall(function()
    while true do
      if not (temper.list_length(game__39.snakes) == 0) then
        break;
      end
      temper.stdsleep(500):await();
    end
    temper.log('Game starting!');
    while running__42 do
      local dirs__55, i__56, frame__58, conns__59, fn__305;
      dirs__55 = temper.listbuilder_constructor();
      i__56 = 0;
      while true do
        local snake__57;
        t_1 = temper.list_length(game__39.snakes);
        if not (i__56 < t_1) then
          break;
        end
        t_2 = game__39.snakes;
        t_3 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
        snake__57 = temper.listed_getor(t_2, i__56, t_3);
        temper.listbuilder_add(dirs__55, snake__57.direction);
        i__56 = temper.int32_add(i__56, 1);
      end
      t_4 = temper.listbuilder_tolist(dirs__55);
      t_5 = multiTick(game__39, t_4);
      game__39 = t_5;
      frame__58 = multiRender(game__39);
      conns__59 = temper.listbuilder_tolist(wsConns__40);
      fn__305 = function(conn__60)
        temper.wssend(conn__60, frame__58);
        return nil, 'return';
      end;
      temper.list_foreach(conns__59, fn__305);
      temper.stdsleep(200):await();
    end
  end);
  if local_6 then
    if (local_8 == 'return') then
      return local_7;
    end
  end
end);
temper.async_launch(fn__330);
fn__329 = temper.adapt_generator_fn(function()
  local t_10, t_11, t_12, t_13, t_14, t_15, t_16, t_17, t_18, t_19, t_20, t_21, t_22, t_23, t_24, t_25, t_26, local_27, local_28, local_29;
  local_27, local_28, local_29 = temper.pcall(function()
    local server__44;
    temper.log('Snake Multiplayer Server');
    temper.log('Starting on port 8080...');
    server__44 = temper.wslisten(8080):await();
    temper.log('Listening on ws://localhost:8080');
    temper.log('Waiting for players to connect...');
    while running__42 do
      local ws__45, local_30, local_31, local_32, firstMsgRaw__46, isSpectator__47;
      t_22 = temper.wsaccept(server__44):await();
      ws__45 = t_22;
      local_30, local_31, local_32 = temper.pcall(function()
        t_23 = temper.wsrecv(ws__45):await();
        t_24 = t_23;
      end);
      if local_30 then
      else
        t_24 = temper.null;
      end
      firstMsgRaw__46 = t_24;
      isSpectator__47 = false;
      if not temper.is_null(firstMsgRaw__46) then
        t_10 = (type(firstMsgRaw__46) == 'string');
      else
        t_10 = false;
      end
      if t_10 then
        if temper.is_null(firstMsgRaw__46) then
          t_25 = temper.bubble();
        else
          t_25 = firstMsgRaw__46;
        end
        if temper.str_eq(t_25, 'spectate') then
          isSpectator__47 = true;
        end
      end
      if isSpectator__47 then
        temper.listbuilder_add(wsConns__40, ws__45);
        temper.log('Spectator connected!');
      else
        local playerId__48, symbol__49, connId__50, connWs__51, fn__279;
        playerId__48 = nextId__41;
        nextId__41 = temper.int32_add(nextId__41, 1);
        t_11 = addPlayer(game__39, temper.int32_add(temper.int32_mul(playerId__48, 7), 13));
        game__39 = t_11;
        temper.listbuilder_add(wsConns__40, ws__45);
        symbol__49 = playerHeadChar(playerId__48);
        t_12 = temper.int32_tostring(playerId__48);
        temper.log(temper.concat('Player ', t_12, ' (', symbol__49, ') connected!'));
        if not temper.is_null(firstMsgRaw__46) then
          t_13 = (type(firstMsgRaw__46) == 'string');
        else
          t_13 = false;
        end
        if t_13 then
          if temper.is_null(firstMsgRaw__46) then
            t_26 = temper.bubble();
          else
            t_26 = firstMsgRaw__46;
          end
          if temper.str_eq(t_26, 'u') then
            t_14 = Up();
            t_15 = changePlayerDirection(game__39, playerId__48, t_14);
            game__39 = t_15;
          elseif temper.str_eq(t_26, 'd') then
            t_16 = Down();
            t_17 = changePlayerDirection(game__39, playerId__48, t_16);
            game__39 = t_17;
          elseif temper.str_eq(t_26, 'l') then
            t_18 = Left();
            t_19 = changePlayerDirection(game__39, playerId__48, t_18);
            game__39 = t_19;
          elseif temper.str_eq(t_26, 'r') then
            t_20 = Right();
            t_21 = changePlayerDirection(game__39, playerId__48, t_20);
            game__39 = t_21;
          end
        end
        connId__50 = playerId__48;
        connWs__51 = ws__45;
        fn__279 = function()
          local t_34, t_35, t_36, t_37, t_38, t_39, t_40, t_41, t_42, t_43, t_44, t_45, local_46, local_47, local_48;
          local_46, local_47, local_48 = temper.pcall(function()
            while running__42 do
              local msg__53;
              t_44 = temper.wsrecv(connWs__51):await();
              msg__53 = t_44;
              if not temper.is_null(msg__53) then
                t_34 = (type(msg__53) == 'string');
              else
                t_34 = false;
              end
              if t_34 then
                if temper.is_null(msg__53) then
                  t_45 = temper.bubble();
                else
                  t_45 = msg__53;
                end
                if temper.str_eq(t_45, 'u') then
                  t_35 = Up();
                  t_36 = changePlayerDirection(game__39, connId__50, t_35);
                  game__39 = t_36;
                elseif temper.str_eq(t_45, 'd') then
                  t_37 = Down();
                  t_38 = changePlayerDirection(game__39, connId__50, t_37);
                  game__39 = t_38;
                elseif temper.str_eq(t_45, 'l') then
                  t_39 = Left();
                  t_40 = changePlayerDirection(game__39, connId__50, t_39);
                  game__39 = t_40;
                elseif temper.str_eq(t_45, 'r') then
                  t_41 = Right();
                  t_42 = changePlayerDirection(game__39, connId__50, t_41);
                  game__39 = t_42;
                end
              else
                t_43 = temper.int32_tostring(connId__50);
                temper.log(temper.concat('Player ', t_43, ' disconnected'));
                break;
              end
            end
          end);
          if local_46 then
          end
        end;
        fn__279 = temper.adapt_generator_fn(fn__279);
        temper.async_launch(fn__279);
      end
    end
  end);
  if local_27 then
  end
end);
temper.async_launch(fn__329);
temper.run_scheduler();
exports = {};
return exports;
