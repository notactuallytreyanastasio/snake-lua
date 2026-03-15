local temper = require('temper-core');
local newGame, changeDirection, tick, render, Right, Down, Left, Up, Direction, Playing, console_0, inputDirection__20, parseInput__6, fn__145, fn__144, exports;
newGame = temper.import('snake', 'newGame');
changeDirection = temper.import('snake', 'changeDirection');
tick = temper.import('snake', 'tick');
render = temper.import('snake', 'render');
Right = temper.import('snake', 'Right');
Down = temper.import('snake', 'Down');
Left = temper.import('snake', 'Left');
Up = temper.import('snake', 'Up');
Direction = temper.import('snake', 'Direction');
Playing = temper.import('snake', 'Playing');
console_0 = 0.0;
inputDirection__20 = Right();
parseInput__6 = function(line__21)
  local return__5;
  if temper.str_eq(line__21, 'w') then
    return__5 = Up();
  elseif temper.str_eq(line__21, 's') then
    return__5 = Down();
  elseif temper.str_eq(line__21, 'a') then
    return__5 = Left();
  elseif temper.str_eq(line__21, 'd') then
    return__5 = Right();
  else
    return__5 = temper.null;
  end
  return return__5;
end;
fn__145 = temper.adapt_generator_fn(function()
  local t_1, t_2, t_3, t_4, local_5, local_6, local_7;
  local_5, local_6, local_7 = temper.pcall(function()
    while true do
      local line__24;
      t_3 = temper.stdreadline():await();
      line__24 = t_3;
      if not temper.is_null(line__24) then
        t_1 = (type(line__24) == 'string');
      else
        t_1 = false;
      end
      if t_1 then
        local dir__25;
        if temper.is_null(line__24) then
          t_4 = temper.bubble();
        else
          t_4 = line__24;
        end
        dir__25 = parseInput__6(t_4);
        if not temper.is_null(dir__25) then
          t_2 = temper.instance_of(dir__25, Direction);
        else
          t_2 = false;
        end
        if t_2 then
          if temper.is_null(dir__25) then
            inputDirection__20 = temper.bubble();
          else
            inputDirection__20 = dir__25;
          end
        end
      else
        break;
      end
    end
  end);
  if local_5 then
  end
end);
temper.async_launch(fn__145);
fn__144 = temper.adapt_generator_fn(function()
  local t_9, t_10, t_11, t_12, t_13, local_14, local_15, local_16;
  local_14, local_15, local_16 = temper.pcall(function()
    local game__27;
    temper.log('Snake! Use w/a/s/d + Enter to move.');
    temper.log('Starting in 1 second...');
    temper.stdsleep(1000):await();
    t_9 = newGame(20, 10, 42);
    game__27 = t_9;
    while true do
      if not temper.instance_of(game__27.status, Playing) then
        break;
      end
      game__27 = changeDirection(game__27, inputDirection__20);
      t_10 = tick(game__27);
      game__27 = t_10;
      t_11 = render(game__27);
      temper.log(t_11);
      temper.stdsleep(200):await();
    end
    t_12 = render(game__27);
    temper.log(t_12);
    t_13 = temper.int32_tostring(game__27.score);
    temper.log(temper.concat('Final score: ', t_13));
  end);
  if local_14 then
  end
end);
temper.async_launch(fn__144);
temper.run_scheduler();
exports = {};
return exports;
