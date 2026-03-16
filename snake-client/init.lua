local temper = require('temper-core');
local console_0, connected__11, fn__107, exports;
console_0 = 0.0;
connected__11 = true;
fn__107 = temper.adapt_generator_fn(function()
  local t_1, t_2, t_3, t_4, local_5, local_6, local_7;
  local_5, local_6, local_7 = temper.pcall(function()
    local ws__14, local_8, local_9, local_10, fn__95, local_35, local_36, local_37;
    temper.log('Snake Multiplayer Client');
    temper.log('Connecting to ws://localhost:8080...');
    t_2 = temper.wsconnect('ws://localhost:8080'):await();
    ws__14 = t_2;
    local_8, local_9, local_10 = temper.pcall(function()
      temper.wssend(ws__14, 'join'):await();
    end);
    if local_8 then
    end
    temper.log('Connected! Use w/a/s/d to move.');
    fn__95 = function()
      local t_12, t_13, t_14, local_15, local_16, local_17;
      local_15, local_16, local_17 = temper.pcall(function()
        while connected__11 do
          local line__16;
          t_13 = temper.stdreadline():await();
          line__16 = t_13;
          if not temper.is_null(line__16) then
            t_12 = (type(line__16) == 'string');
          else
            t_12 = false;
          end
          if t_12 then
            local local_18, local_19, local_20, local_22, local_23, local_24, local_26, local_27, local_28;
            if temper.is_null(line__16) then
              t_14 = temper.bubble();
            else
              t_14 = line__16;
            end
            if temper.str_eq(t_14, 'w') then
              local local_30, local_31, local_32;
              local_30, local_31, local_32 = temper.pcall(function()
                temper.wssend(ws__14, 'u'):await();
              end);
              if local_30 then
              end
            elseif temper.str_eq(t_14, 's') then
              local_18, local_19, local_20 = temper.pcall(function()
                temper.wssend(ws__14, 'd'):await();
              end);
              if local_18 then
              end
            elseif temper.str_eq(t_14, 'a') then
              local_22, local_23, local_24 = temper.pcall(function()
                temper.wssend(ws__14, 'l'):await();
              end);
              if local_22 then
              end
            elseif temper.str_eq(t_14, 'd') then
              local_26, local_27, local_28 = temper.pcall(function()
                temper.wssend(ws__14, 'r'):await();
              end);
              if local_26 then
              end
            end
          else
            break;
          end
        end
      end);
      if local_15 then
      end
    end;
    fn__95 = temper.adapt_generator_fn(fn__95);
    temper.async_launch(fn__95);
    while connected__11 do
      local msg__17;
      t_3 = temper.wsrecv(ws__14):await();
      msg__17 = t_3;
      if not temper.is_null(msg__17) then
        t_1 = (type(msg__17) == 'string');
      else
        t_1 = false;
      end
      if t_1 then
        if temper.is_null(msg__17) then
          t_4 = temper.bubble();
        else
          t_4 = msg__17;
        end
        temper.log(t_4);
      else
        temper.log('Disconnected from server.');
        connected__11 = false;
      end
    end
    local_35, local_36, local_37 = temper.pcall(function()
      temper.wsclose(ws__14):await();
    end);
    if local_35 then
    end
  end);
  if local_5 then
  end
end);
temper.async_launch(fn__107);
temper.run_scheduler();
exports = {};
return exports;
