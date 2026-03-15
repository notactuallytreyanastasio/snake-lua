local temper = require('temper-core');
local Direction, Up, Down, Left, Right, Point, GameStatus, Playing, GameOver, RandomResult, SnakeGame, FoodPlacement__32, PlayerStatus, Alive, Dead, PlayerSnake, MultiSnakeGame, SpawnInfo__33, move, pointEquals, isOpposite, directionDelta, nextRandom, placeFood__92, newGame, changeDirection, tick, cellChar__93, render, spawnPosition__94, collectAllSegments__95, newMultiGame, multiTick, changePlayerDirection, isMultiGameOver, addPlayer, removePlayer, playerHeadChar, playerBodyChar, multiCellChar__96, multiRender, directionToString, stringToDirection, exports;
Direction = temper.type('Direction');
Up = temper.type('Up', Direction);
Up.constructor = function(this__35)
  return nil;
end;
Down = temper.type('Down', Direction);
Down.constructor = function(this__37)
  return nil;
end;
Left = temper.type('Left', Direction);
Left.constructor = function(this__39)
  return nil;
end;
Right = temper.type('Right', Direction);
Right.constructor = function(this__41)
  return nil;
end;
Point = temper.type('Point');
Point.constructor = function(this__43, x__110, y__111)
  this__43.x__107 = x__110;
  this__43.y__108 = y__111;
  return nil;
end;
Point.get.x = function(this__413)
  return this__413.x__107;
end;
Point.get.y = function(this__416)
  return this__416.y__108;
end;
GameStatus = temper.type('GameStatus');
Playing = temper.type('Playing', GameStatus);
Playing.constructor = function(this__45)
  return nil;
end;
GameOver = temper.type('GameOver', GameStatus);
GameOver.constructor = function(this__47)
  return nil;
end;
RandomResult = temper.type('RandomResult');
RandomResult.constructor = function(this__52, value__125, nextSeed__126)
  this__52.value__122 = value__125;
  this__52.nextSeed__123 = nextSeed__126;
  return nil;
end;
RandomResult.get.value = function(this__427)
  return this__427.value__122;
end;
RandomResult.get.nextSeed = function(this__430)
  return this__430.nextSeed__123;
end;
SnakeGame = temper.type('SnakeGame');
SnakeGame.constructor = function(this__55, width__143, height__144, snake__145, direction__146, food__147, score__148, status__149, rngSeed__150)
  this__55.width__134 = width__143;
  this__55.height__135 = height__144;
  this__55.snake__136 = snake__145;
  this__55.direction__137 = direction__146;
  this__55.food__138 = food__147;
  this__55.score__139 = score__148;
  this__55.status__140 = status__149;
  this__55.rngSeed__141 = rngSeed__150;
  return nil;
end;
SnakeGame.get.width = function(this__433)
  return this__433.width__134;
end;
SnakeGame.get.height = function(this__436)
  return this__436.height__135;
end;
SnakeGame.get.snake = function(this__439)
  return this__439.snake__136;
end;
SnakeGame.get.direction = function(this__442)
  return this__442.direction__137;
end;
SnakeGame.get.food = function(this__445)
  return this__445.food__138;
end;
SnakeGame.get.score = function(this__448)
  return this__448.score__139;
end;
SnakeGame.get.status = function(this__451)
  return this__451.status__140;
end;
SnakeGame.get.rngSeed = function(this__454)
  return this__454.rngSeed__141;
end;
FoodPlacement__32 = temper.type('FoodPlacement__32');
FoodPlacement__32.constructor = function(this__58, point__154, seed__155)
  this__58.point__151 = point__154;
  this__58.seed__152 = seed__155;
  return nil;
end;
FoodPlacement__32.get.point = function(this__457)
  return this__457.point__151;
end;
FoodPlacement__32.get.seed = function(this__460)
  return this__460.seed__152;
end;
PlayerStatus = temper.type('PlayerStatus');
Alive = temper.type('Alive', PlayerStatus);
Alive.constructor = function(this__66)
  return nil;
end;
Dead = temper.type('Dead', PlayerStatus);
Dead.constructor = function(this__68)
  return nil;
end;
PlayerSnake = temper.type('PlayerSnake');
PlayerSnake.constructor = function(this__70, id__222, segments__223, direction__224, score__225, status__226)
  this__70.id__216 = id__222;
  this__70.segments__217 = segments__223;
  this__70.direction__218 = direction__224;
  this__70.score__219 = score__225;
  this__70.status__220 = status__226;
  return nil;
end;
PlayerSnake.get.id = function(this__466)
  return this__466.id__216;
end;
PlayerSnake.get.segments = function(this__469)
  return this__469.segments__217;
end;
PlayerSnake.get.direction = function(this__472)
  return this__472.direction__218;
end;
PlayerSnake.get.score = function(this__475)
  return this__475.score__219;
end;
PlayerSnake.get.status = function(this__478)
  return this__478.status__220;
end;
MultiSnakeGame = temper.type('MultiSnakeGame');
MultiSnakeGame.constructor = function(this__73, width__234, height__235, snakes__236, food__237, rngSeed__238, tickCount__239)
  this__73.width__227 = width__234;
  this__73.height__228 = height__235;
  this__73.snakes__229 = snakes__236;
  this__73.food__230 = food__237;
  this__73.rngSeed__231 = rngSeed__238;
  this__73.tickCount__232 = tickCount__239;
  return nil;
end;
MultiSnakeGame.get.width = function(this__481)
  return this__481.width__227;
end;
MultiSnakeGame.get.height = function(this__484)
  return this__484.height__228;
end;
MultiSnakeGame.get.snakes = function(this__487)
  return this__487.snakes__229;
end;
MultiSnakeGame.get.food = function(this__490)
  return this__490.food__230;
end;
MultiSnakeGame.get.rngSeed = function(this__493)
  return this__493.rngSeed__231;
end;
MultiSnakeGame.get.tickCount = function(this__496)
  return this__496.tickCount__232;
end;
SpawnInfo__33 = temper.type('SpawnInfo__33');
SpawnInfo__33.constructor = function(this__77, point__259, direction__260)
  this__77.point__256 = point__259;
  this__77.direction__257 = direction__260;
  return nil;
end;
SpawnInfo__33.get.point = function(this__499)
  return this__499.point__256;
end;
SpawnInfo__33.get.direction = function(this__502)
  return this__502.direction__257;
end;
move = function(head__97, body__98, food__99, width__100, height__101)
  return Right();
end;
pointEquals = function(a__114, b__115)
  local return__49, t_0, t_1;
  if (a__114.x == b__115.x) then
    t_0 = a__114.y;
    t_1 = b__115.y;
    return__49 = (t_0 == t_1);
  else
    return__49 = false;
  end
  return return__49;
end;
isOpposite = function(a__117, b__118)
  local return__50;
  if temper.instance_of(a__117, Up) then
    return__50 = temper.instance_of(b__118, Down);
  elseif temper.instance_of(a__117, Down) then
    return__50 = temper.instance_of(b__118, Up);
  elseif temper.instance_of(a__117, Left) then
    return__50 = temper.instance_of(b__118, Right);
  elseif temper.instance_of(a__117, Right) then
    return__50 = temper.instance_of(b__118, Left);
  else
    return__50 = false;
  end
  return return__50;
end;
directionDelta = function(dir__120)
  local return__51;
  if temper.instance_of(dir__120, Up) then
    return__51 = Point(0, -1);
  elseif temper.instance_of(dir__120, Down) then
    return__51 = Point(0, 1);
  elseif temper.instance_of(dir__120, Left) then
    return__51 = Point(-1, 0);
  elseif temper.instance_of(dir__120, Right) then
    return__51 = Point(1, 0);
  else
    return__51 = Point(0, 0);
  end
  return return__51;
end;
nextRandom = function(seed__127, max__128)
  local t_2, t_3, raw__130, masked__131, posVal__132, value__133;
  raw__130 = temper.int32_add(temper.int32_mul(seed__127, 1664525), 1013904223);
  masked__131 = temper.band(raw__130, 2147483647);
  if (masked__131 < 0) then
    posVal__132 = temper.int32_unm(masked__131);
  else
    posVal__132 = masked__131;
  end
  value__133 = 0;
  if (max__128 > 0) then
    local local_4, local_5, local_6;
    local_4, local_5, local_6 = temper.pcall(function()
      t_2 = temper.int32_mod(posVal__132, max__128);
      t_3 = t_2;
    end);
    if local_4 then
    else
      t_3 = 0;
    end
    value__133 = t_3;
  end
  return RandomResult(value__133, masked__131);
end;
placeFood__92 = function(snake__156, width__157, height__158, seed__159)
  local return__60, t_8, t_9, t_10, t_11, t_12, t_13, totalCells__161, currentSeed__162, attempt__163, y__170;
  ::continue_1::totalCells__161 = temper.int32_mul(width__157, height__158);
  currentSeed__162 = seed__159;
  attempt__163 = 0;
  while (attempt__163 < totalCells__161) do
    local result__164, px__165, py__166, candidate__167, occupied__168, fn__2754;
    result__164 = nextRandom(currentSeed__162, totalCells__161);
    t_8 = result__164.nextSeed;
    currentSeed__162 = t_8;
    px__165 = 0;
    py__166 = 0;
    if (width__157 > 0) then
      local local_14, local_15, local_16, local_18, local_19, local_20;
      local_14, local_15, local_16 = temper.pcall(function()
        t_10 = temper.int32_mod(result__164.value, width__157);
        t_11 = t_10;
      end);
      if local_14 then
      else
        t_11 = 0;
      end
      px__165 = t_11;
      local_18, local_19, local_20 = temper.pcall(function()
        t_12 = temper.int32_div(result__164.value, width__157);
        t_13 = t_12;
      end);
      if local_18 then
      else
        t_13 = 0;
      end
      py__166 = t_13;
    end
    candidate__167 = Point(px__165, py__166);
    occupied__168 = false;
    fn__2754 = function(seg__169)
      if pointEquals(seg__169, candidate__167) then
        occupied__168 = true;
      end
      return nil;
    end;
    temper.list_foreach(snake__156, fn__2754);
    if not occupied__168 then
      return__60 = FoodPlacement__32(candidate__167, currentSeed__162);
      goto break_0;
    end
    attempt__163 = temper.int32_add(attempt__163, 1);
  end
  y__170 = 0;
  while (y__170 < height__158) do
    local x__171;
    x__171 = 0;
    while (x__171 < width__157) do
      local candidate__172, free__173, fn__2753;
      candidate__172 = Point(x__171, y__170);
      free__173 = true;
      fn__2753 = function(seg__174)
        if pointEquals(seg__174, candidate__172) then
          free__173 = false;
        end
        return nil;
      end;
      temper.list_foreach(snake__156, fn__2753);
      if free__173 then
        return__60 = FoodPlacement__32(candidate__172, currentSeed__162);
        goto break_0;
      end
      x__171 = temper.int32_add(x__171, 1);
    end
    y__170 = temper.int32_add(y__170, 1);
  end
  t_9 = Point(0, 0);
  return__60 = FoodPlacement__32(t_9, currentSeed__162);
  ::break_0::return return__60;
end;
newGame = function(width__175, height__176, seed__177)
  local t_22, t_23, t_24, t_25, centerX__179, centerY__180, snake__181, foodResult__182, t_26, t_27, t_28, t_29;
  centerX__179 = 0;
  centerY__180 = 0;
  if (width__175 > 0) then
    t_22 = temper.int32_div(width__175, 2);
    t_23 = t_22;
    centerX__179 = t_23;
  end
  if (height__176 > 0) then
    t_24 = temper.int32_div(height__176, 2);
    t_25 = t_24;
    centerY__180 = t_25;
  end
  snake__181 = temper.listof(Point(centerX__179, centerY__180), Point(temper.int32_sub(centerX__179, 1), centerY__180), Point(temper.int32_sub(centerX__179, 2), centerY__180));
  foodResult__182 = placeFood__92(snake__181, width__175, height__176, seed__177);
  t_26 = Right();
  t_27 = foodResult__182.point;
  t_28 = Playing();
  t_29 = foodResult__182.seed;
  return SnakeGame(width__175, height__176, snake__181, t_26, t_27, 0, t_28, t_29);
end;
changeDirection = function(game__183, dir__184)
  local return__62, t_30, t_31, t_32, t_33, t_34, t_35, t_36;
  if isOpposite(game__183.direction, dir__184) then
    return__62 = game__183;
  else
    t_30 = game__183.width;
    t_31 = game__183.height;
    t_32 = game__183.snake;
    t_33 = game__183.food;
    t_34 = game__183.score;
    t_35 = game__183.status;
    t_36 = game__183.rngSeed;
    return__62 = SnakeGame(t_30, t_31, t_32, dir__184, t_33, t_34, t_35, t_36);
  end
  return return__62;
end;
tick = function(game__186)
  local return__63, t_37, t_38, t_39, t_40, t_41, t_42, t_43, t_44, t_45, t_46, t_47, t_48, t_49, t_50, t_51, t_52, t_53, t_54, t_55, t_56, t_57, t_58, t_59, t_60, t_61, t_62, t_63, t_64, t_65, t_66, t_67, t_68, t_69, t_70, t_71, t_72, t_73, t_74, t_75, t_76, t_77, t_78, t_79, t_80, t_81, delta__188, head__189, newHead__190, eating__191, checkLength__192, i__193, newSnakeBuilder__194, keepLength__195, i__196, newSnake__197;
  ::continue_3::
  if temper.instance_of(game__186.status, GameOver) then
    return__63 = game__186;
    goto break_2;
  end
  delta__188 = directionDelta(game__186.direction);
  head__189 = temper.listed_getor(game__186.snake, 0, Point(0, 0));
  newHead__190 = Point(temper.int32_add(head__189.x, delta__188.x), temper.int32_add(head__189.y, delta__188.y));
  if (newHead__190.x < 0) then
    t_81 = true;
  else
    if (newHead__190.x >= game__186.width) then
      t_80 = true;
    else
      if (newHead__190.y < 0) then
        t_79 = true;
      else
        t_37 = newHead__190.y;
        t_38 = game__186.height;
        t_79 = (t_37 >= t_38);
      end
      t_80 = t_79;
    end
    t_81 = t_80;
  end
  if t_81 then
    t_39 = game__186.width;
    t_40 = game__186.height;
    t_41 = game__186.snake;
    t_42 = game__186.direction;
    t_43 = game__186.food;
    t_44 = game__186.score;
    t_45 = GameOver();
    t_46 = game__186.rngSeed;
    return__63 = SnakeGame(t_39, t_40, t_41, t_42, t_43, t_44, t_45, t_46);
    goto break_2;
  end
  eating__191 = pointEquals(newHead__190, game__186.food);
  if eating__191 then
    t_47 = temper.list_length(game__186.snake);
    checkLength__192 = t_47;
  else
    t_48 = temper.list_length(game__186.snake);
    checkLength__192 = temper.int32_sub(t_48, 1);
  end
  i__193 = 0;
  while (i__193 < checkLength__192) do
    t_49 = game__186.snake;
    t_50 = Point(-1, -1);
    if pointEquals(newHead__190, temper.listed_getor(t_49, i__193, t_50)) then
      t_51 = game__186.width;
      t_52 = game__186.height;
      t_53 = game__186.snake;
      t_54 = game__186.direction;
      t_55 = game__186.food;
      t_56 = game__186.score;
      t_57 = GameOver();
      t_58 = game__186.rngSeed;
      return__63 = SnakeGame(t_51, t_52, t_53, t_54, t_55, t_56, t_57, t_58);
      goto break_2;
    end
    i__193 = temper.int32_add(i__193, 1);
  end
  newSnakeBuilder__194 = temper.listbuilder_constructor();
  temper.listbuilder_add(newSnakeBuilder__194, newHead__190);
  if eating__191 then
    t_59 = temper.list_length(game__186.snake);
    keepLength__195 = t_59;
  else
    t_60 = temper.list_length(game__186.snake);
    keepLength__195 = temper.int32_sub(t_60, 1);
  end
  i__196 = 0;
  while (i__196 < keepLength__195) do
    t_61 = game__186.snake;
    t_62 = Point(0, 0);
    temper.listbuilder_add(newSnakeBuilder__194, temper.listed_getor(t_61, i__196, t_62));
    i__196 = temper.int32_add(i__196, 1);
  end
  newSnake__197 = temper.listbuilder_tolist(newSnakeBuilder__194);
  if eating__191 then
    local newScore__198, foodResult__199;
    newScore__198 = temper.int32_add(game__186.score, 1);
    t_63 = game__186.width;
    t_64 = game__186.height;
    t_65 = game__186.rngSeed;
    foodResult__199 = placeFood__92(newSnake__197, t_63, t_64, t_65);
    t_66 = game__186.width;
    t_67 = game__186.height;
    t_68 = game__186.direction;
    t_69 = foodResult__199.point;
    t_70 = Playing();
    t_71 = foodResult__199.seed;
    return__63 = SnakeGame(t_66, t_67, newSnake__197, t_68, t_69, newScore__198, t_70, t_71);
  else
    t_72 = game__186.width;
    t_73 = game__186.height;
    t_74 = game__186.direction;
    t_75 = game__186.food;
    t_76 = game__186.score;
    t_77 = game__186.status;
    t_78 = game__186.rngSeed;
    return__63 = SnakeGame(t_72, t_73, newSnake__197, t_74, t_75, t_76, t_77, t_78);
  end
  ::break_2::return return__63;
end;
cellChar__93 = function(game__209, p__210)
  local return__65, t_82, t_83, t_84, t_85, t_86, head__212, i__213;
  ::continue_5::head__212 = temper.listed_getor(game__209.snake, 0, Point(-1, -1));
  if pointEquals(p__210, head__212) then
    return__65 = '@';
    goto break_4;
  end
  i__213 = 1;
  while true do
    t_82 = temper.list_length(game__209.snake);
    if not (i__213 < t_82) then
      break;
    end
    t_83 = game__209.snake;
    t_84 = Point(-1, -1);
    t_85 = temper.listed_getor(t_83, i__213, t_84);
    if pointEquals(p__210, t_85) then
      return__65 = 'o';
      goto break_4;
    end
    i__213 = temper.int32_add(i__213, 1);
  end
  t_86 = game__209.food;
  if pointEquals(p__210, t_86) then
    return__65 = '*';
    goto break_4;
  end
  return__65 = ' ';
  ::break_4::return return__65;
end;
render = function(game__200)
  local t_87, t_88, t_89, t_90, sb__202, x__203, y__204, x__207, statusText__208, t_91;
  sb__202 = temper.stringbuilder_constructor();
  temper.stringbuilder_append(sb__202, '\x1b[2J\x1b[H');
  temper.stringbuilder_append(sb__202, '#');
  x__203 = 0;
  while true do
    t_87 = game__200.width;
    if not (x__203 < t_87) then
      break;
    end
    temper.stringbuilder_append(sb__202, '#');
    x__203 = temper.int32_add(x__203, 1);
  end
  temper.stringbuilder_append(sb__202, '#\r\n');
  y__204 = 0;
  while true do
    local x__205;
    t_88 = game__200.height;
    if not (y__204 < t_88) then
      break;
    end
    temper.stringbuilder_append(sb__202, '#');
    x__205 = 0;
    while true do
      local p__206;
      t_89 = game__200.width;
      if not (x__205 < t_89) then
        break;
      end
      p__206 = Point(x__205, y__204);
      temper.stringbuilder_append(sb__202, cellChar__93(game__200, p__206));
      x__205 = temper.int32_add(x__205, 1);
    end
    temper.stringbuilder_append(sb__202, '#\r\n');
    y__204 = temper.int32_add(y__204, 1);
  end
  temper.stringbuilder_append(sb__202, '#');
  x__207 = 0;
  while true do
    t_90 = game__200.width;
    if not (x__207 < t_90) then
      break;
    end
    temper.stringbuilder_append(sb__202, '#');
    x__207 = temper.int32_add(x__207, 1);
  end
  temper.stringbuilder_append(sb__202, '#\r\n');
  t_91 = game__200.status;
  if temper.instance_of(t_91, Playing) then
    statusText__208 = 'Playing';
  elseif temper.instance_of(t_91, GameOver) then
    statusText__208 = 'GAME OVER';
  else
    statusText__208 = '';
  end
  temper.stringbuilder_append(sb__202, temper.concat('Score: ', temper.int32_tostring(game__200.score), '  ', statusText__208, '\r', '\n'));
  return temper.stringbuilder_tostring(sb__202);
end;
spawnPosition__94 = function(width__261, height__262, index__263, total__264)
  local return__79, t_92, t_93, t_94, t_95, t_96, t_97, t_98, t_99, t_100, t_101, t_102, t_103, t_104, t_105, t_106, t_107, t_108, t_109, cx__266, cy__267, qx__268, qy__269, slot__270;
  ::continue_7::cx__266 = 0;
  cy__267 = 0;
  if (width__261 > 0) then
    t_100 = temper.int32_div(width__261, 2);
    t_101 = t_100;
    cx__266 = t_101;
  end
  if (height__262 > 0) then
    t_102 = temper.int32_div(height__262, 2);
    t_103 = t_102;
    cy__267 = t_103;
  end
  qx__268 = 0;
  qy__269 = 0;
  if (width__261 > 0) then
    t_104 = temper.int32_div(width__261, 4);
    t_105 = t_104;
    qx__268 = t_105;
  end
  if (height__262 > 0) then
    t_106 = temper.int32_div(height__262, 4);
    t_107 = t_106;
    qy__269 = t_107;
  end
  slot__270 = 0;
  if (total__264 > 0) then
    t_108 = temper.int32_mod(index__263, 4);
    t_109 = t_108;
    slot__270 = t_109;
  end
  if (slot__270 == 0) then
    t_92 = Point(qx__268, cy__267);
    t_93 = Right();
    return__79 = SpawnInfo__33(t_92, t_93);
    goto break_6;
  end
  if (slot__270 == 1) then
    t_94 = Point(temper.int32_sub(temper.int32_sub(width__261, qx__268), 1), cy__267);
    t_95 = Left();
    return__79 = SpawnInfo__33(t_94, t_95);
    goto break_6;
  end
  if (slot__270 == 2) then
    t_96 = Point(cx__266, qy__269);
    t_97 = Down();
    return__79 = SpawnInfo__33(t_96, t_97);
    goto break_6;
  end
  t_98 = Point(cx__266, temper.int32_sub(temper.int32_sub(height__262, qy__269), 1));
  t_99 = Up();
  return__79 = SpawnInfo__33(t_98, t_99);
  ::break_6::return return__79;
end;
collectAllSegments__95 = function(snakes__271)
  local t_110, t_111, t_112, t_113, t_114, builder__273, i__274;
  builder__273 = temper.listbuilder_constructor();
  i__274 = 0;
  while true do
    local snake__275, j__276;
    t_110 = temper.list_length(snakes__271);
    if not (i__274 < t_110) then
      break;
    end
    t_111 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__275 = temper.listed_getor(snakes__271, i__274, t_111);
    j__276 = 0;
    while true do
      t_112 = temper.list_length(snake__275.segments);
      if not (j__276 < t_112) then
        break;
      end
      t_113 = snake__275.segments;
      t_114 = Point(0, 0);
      temper.listbuilder_add(builder__273, temper.listed_getor(t_113, j__276, t_114));
      j__276 = temper.int32_add(j__276, 1);
    end
    i__274 = temper.int32_add(i__274, 1);
  end
  return temper.listbuilder_tolist(builder__273);
end;
newMultiGame = function(width__240, height__241, numPlayers__242, seed__243)
  local t_115, snakeBuilder__245, currentSeed__246, i__247, t_116, allSegments__254, foodResult__255, t_117, t_118, t_119;
  snakeBuilder__245 = temper.listbuilder_constructor();
  currentSeed__246 = seed__243;
  i__247 = 0;
  while (i__247 < numPlayers__242) do
    local spawn__248, dir__249, startX__250, startY__251, delta__252, segments__253;
    spawn__248 = spawnPosition__94(width__240, height__241, i__247, numPlayers__242);
    dir__249 = spawn__248.direction;
    startX__250 = spawn__248.point.x;
    startY__251 = spawn__248.point.y;
    delta__252 = directionDelta(dir__249);
    segments__253 = temper.listof(Point(startX__250, startY__251), Point(temper.int32_sub(startX__250, delta__252.x), temper.int32_sub(startY__251, delta__252.y)), Point(temper.int32_sub(startX__250, temper.int32_mul(delta__252.x, 2)), temper.int32_sub(startY__251, temper.int32_mul(delta__252.y, 2))));
    t_115 = Alive();
    temper.listbuilder_add(snakeBuilder__245, PlayerSnake(i__247, segments__253, dir__249, 0, t_115));
    i__247 = temper.int32_add(i__247, 1);
  end
  t_116 = temper.listbuilder_tolist(snakeBuilder__245);
  allSegments__254 = collectAllSegments__95(t_116);
  foodResult__255 = placeFood__92(allSegments__254, width__240, height__241, currentSeed__246);
  t_117 = temper.listbuilder_tolist(snakeBuilder__245);
  t_118 = foodResult__255.point;
  t_119 = foodResult__255.seed;
  return MultiSnakeGame(width__240, height__241, t_117, t_118, t_119, 0);
end;
multiTick = function(game__277, directions__278)
  local t_120, t_121, t_122, t_123, t_124, t_125, t_126, t_127, t_128, t_129, t_130, t_131, t_132, t_133, t_134, t_135, t_136, t_137, t_138, t_139, t_140, t_141, t_142, t_143, t_144, t_145, t_146, t_147, t_148, t_149, t_150, t_151, t_152, t_153, t_154, t_155, t_156, t_157, t_158, t_159, t_160, t_161, t_162, t_163, t_164, t_165, t_166, t_167, t_168, t_169, t_170, newDirs__280, i__281, newHeads__284, i__285, headsList__290, dirsList__291, aliveBuilder__292, i__293, aliveList__304, eaterIndex__305, i__306, resultSnakes__308, i__309, resultSnakesList__318, t_171, newFood__319, t_172, newSeed__320, t_173, t_174, t_175;
  newDirs__280 = temper.listbuilder_constructor();
  i__281 = 0;
  while true do
    local snake__282, inputDir__283;
    t_120 = temper.list_length(game__277.snakes);
    if not (i__281 < t_120) then
      break;
    end
    t_121 = game__277.snakes;
    t_122 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__282 = temper.listed_getor(t_121, i__281, t_122);
    t_123 = snake__282.direction;
    inputDir__283 = temper.listed_getor(directions__278, i__281, t_123);
    if isOpposite(snake__282.direction, inputDir__283) then
      temper.listbuilder_add(newDirs__280, snake__282.direction);
    else
      temper.listbuilder_add(newDirs__280, inputDir__283);
    end
    i__281 = temper.int32_add(i__281, 1);
  end
  newHeads__284 = temper.listbuilder_constructor();
  i__285 = 0;
  while true do
    local snake__286;
    t_124 = temper.list_length(game__277.snakes);
    if not (i__285 < t_124) then
      break;
    end
    t_125 = game__277.snakes;
    t_126 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__286 = temper.listed_getor(t_125, i__285, t_126);
    if temper.instance_of(snake__286.status, Alive) then
      local dir__287, delta__288, head__289;
      t_127 = temper.listbuilder_tolist(newDirs__280);
      t_128 = Right();
      dir__287 = temper.listed_getor(t_127, i__285, t_128);
      delta__288 = directionDelta(dir__287);
      head__289 = temper.listed_getor(snake__286.segments, 0, Point(0, 0));
      temper.listbuilder_add(newHeads__284, Point(temper.int32_add(head__289.x, delta__288.x), temper.int32_add(head__289.y, delta__288.y)));
    else
      temper.listbuilder_add(newHeads__284, Point(-1, -1));
    end
    i__285 = temper.int32_add(i__285, 1);
  end
  headsList__290 = temper.listbuilder_tolist(newHeads__284);
  dirsList__291 = temper.listbuilder_tolist(newDirs__280);
  aliveBuilder__292 = temper.listbuilder_constructor();
  i__293 = 0;
  while true do
    local snake__294;
    t_129 = temper.list_length(game__277.snakes);
    if not (i__293 < t_129) then
      break;
    end
    t_130 = game__277.snakes;
    t_131 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__294 = temper.listed_getor(t_130, i__293, t_131);
    if not temper.instance_of(snake__294.status, Alive) then
      temper.listbuilder_add(aliveBuilder__292, false);
    else
      local nh__295, dead__296;
      t_132 = Point(-1, -1);
      nh__295 = temper.listed_getor(headsList__290, i__293, t_132);
      dead__296 = false;
      if (nh__295.x < 0) then
        t_168 = true;
      else
        if (nh__295.x >= game__277.width) then
          t_167 = true;
        else
          if (nh__295.y < 0) then
            t_166 = true;
          else
            t_133 = nh__295.y;
            t_134 = game__277.height;
            t_166 = (t_133 >= t_134);
          end
          t_167 = t_166;
        end
        t_168 = t_167;
      end
      if t_168 then
        dead__296 = true;
      end
      if not dead__296 then
        local s__297;
        s__297 = 0;
        while true do
          t_135 = temper.list_length(snake__294.segments);
          if not (s__297 < temper.int32_sub(t_135, 1)) then
            break;
          end
          t_136 = snake__294.segments;
          t_137 = Point(-2, -2);
          if pointEquals(nh__295, temper.listed_getor(t_136, s__297, t_137)) then
            dead__296 = true;
          end
          s__297 = temper.int32_add(s__297, 1);
        end
      end
      if not dead__296 then
        local j__298;
        j__298 = 0;
        while true do
          t_138 = temper.list_length(game__277.snakes);
          if not (j__298 < t_138) then
            break;
          end
          if (j__298 ~= i__293) then
            local other__299;
            t_139 = game__277.snakes;
            t_140 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
            other__299 = temper.listed_getor(t_139, j__298, t_140);
            if temper.instance_of(other__299.status, Alive) then
              local s__300;
              s__300 = 0;
              while true do
                t_141 = temper.list_length(other__299.segments);
                if not (s__300 < temper.int32_sub(t_141, 1)) then
                  break;
                end
                t_142 = other__299.segments;
                t_143 = Point(-2, -2);
                if pointEquals(nh__295, temper.listed_getor(t_142, s__300, t_143)) then
                  dead__296 = true;
                end
                s__300 = temper.int32_add(s__300, 1);
              end
            end
          end
          j__298 = temper.int32_add(j__298, 1);
        end
      end
      if not dead__296 then
        local j__301;
        j__301 = 0;
        while true do
          t_144 = temper.list_length(game__277.snakes);
          if not (j__301 < t_144) then
            break;
          end
          if (j__301 ~= i__293) then
            local otherSnake__302;
            t_145 = game__277.snakes;
            t_146 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
            otherSnake__302 = temper.listed_getor(t_145, j__301, t_146);
            if temper.instance_of(otherSnake__302.status, Alive) then
              local otherHead__303;
              t_147 = Point(-3, -3);
              otherHead__303 = temper.listed_getor(headsList__290, j__301, t_147);
              if pointEquals(nh__295, otherHead__303) then
                dead__296 = true;
              end
            end
          end
          j__301 = temper.int32_add(j__301, 1);
        end
      end
      temper.listbuilder_add(aliveBuilder__292, not dead__296);
    end
    i__293 = temper.int32_add(i__293, 1);
  end
  aliveList__304 = temper.listbuilder_tolist(aliveBuilder__292);
  eaterIndex__305 = -1;
  i__306 = 0;
  while true do
    t_148 = temper.list_length(game__277.snakes);
    if not (i__306 < t_148) then
      break;
    end
    if temper.listed_getor(aliveList__304, i__306, false) then
      local nh__307;
      t_149 = Point(-1, -1);
      nh__307 = temper.listed_getor(headsList__290, i__306, t_149);
      if pointEquals(nh__307, game__277.food) then
        eaterIndex__305 = i__306;
      end
    end
    i__306 = temper.int32_add(i__306, 1);
  end
  resultSnakes__308 = temper.listbuilder_constructor();
  i__309 = 0;
  while true do
    local snake__310;
    t_150 = temper.list_length(game__277.snakes);
    if not (i__309 < t_150) then
      break;
    end
    t_151 = game__277.snakes;
    t_152 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__310 = temper.listed_getor(t_151, i__309, t_152);
    if not temper.instance_of(snake__310.status, Alive) then
      temper.listbuilder_add(resultSnakes__308, snake__310);
    elseif not temper.listed_getor(aliveList__304, i__309, false) then
      temper.listbuilder_add(resultSnakes__308, PlayerSnake(snake__310.id, snake__310.segments, snake__310.direction, snake__310.score, Dead()));
    else
      local nh__311, dir__312, isEating__313, keepLen__314, newSegs__315, s__316, newScore__317;
      t_153 = Point(0, 0);
      nh__311 = temper.listed_getor(headsList__290, i__309, t_153);
      t_154 = snake__310.direction;
      dir__312 = temper.listed_getor(dirsList__291, i__309, t_154);
      isEating__313 = (i__309 == eaterIndex__305);
      if isEating__313 then
        t_155 = temper.list_length(snake__310.segments);
        t_169 = t_155;
      else
        t_156 = temper.list_length(snake__310.segments);
        t_169 = temper.int32_sub(t_156, 1);
      end
      keepLen__314 = t_169;
      newSegs__315 = temper.listbuilder_constructor();
      temper.listbuilder_add(newSegs__315, nh__311);
      s__316 = 0;
      while (s__316 < keepLen__314) do
        t_157 = snake__310.segments;
        t_158 = Point(0, 0);
        temper.listbuilder_add(newSegs__315, temper.listed_getor(t_157, s__316, t_158));
        s__316 = temper.int32_add(s__316, 1);
      end
      if isEating__313 then
        t_159 = snake__310.score;
        t_170 = temper.int32_add(t_159, 1);
      else
        t_160 = snake__310.score;
        t_170 = t_160;
      end
      newScore__317 = t_170;
      temper.listbuilder_add(resultSnakes__308, PlayerSnake(snake__310.id, temper.listbuilder_tolist(newSegs__315), dir__312, newScore__317, Alive()));
    end
    i__309 = temper.int32_add(i__309, 1);
  end
  resultSnakesList__318 = temper.listbuilder_tolist(resultSnakes__308);
  t_171 = game__277.food;
  newFood__319 = t_171;
  t_172 = game__277.rngSeed;
  newSeed__320 = t_172;
  if (eaterIndex__305 >= 0) then
    local allSegs__321, foodResult__322;
    allSegs__321 = collectAllSegments__95(resultSnakesList__318);
    t_161 = game__277.width;
    t_162 = game__277.height;
    t_163 = game__277.rngSeed;
    foodResult__322 = placeFood__92(allSegs__321, t_161, t_162, t_163);
    t_164 = foodResult__322.point;
    newFood__319 = t_164;
    t_165 = foodResult__322.seed;
    newSeed__320 = t_165;
  end
  t_173 = game__277.width;
  t_174 = game__277.height;
  t_175 = game__277.tickCount;
  return MultiSnakeGame(t_173, t_174, resultSnakesList__318, newFood__319, newSeed__320, temper.int32_add(t_175, 1));
end;
changePlayerDirection = function(game__323, playerId__324, dir__325)
  local t_176, t_177, t_178, t_179, t_180, t_181, t_182, t_183, t_184, t_185, newSnakes__327, i__328;
  newSnakes__327 = temper.listbuilder_constructor();
  i__328 = 0;
  while true do
    local snake__329;
    t_176 = temper.list_length(game__323.snakes);
    if not (i__328 < t_176) then
      break;
    end
    t_177 = game__323.snakes;
    t_178 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__329 = temper.listed_getor(t_177, i__328, t_178);
    if (snake__329.id == playerId__324) then
      if temper.instance_of(snake__329.status, Alive) then
        t_179 = snake__329.direction;
        t_184 = not isOpposite(t_179, dir__325);
      else
        t_184 = false;
      end
      t_185 = t_184;
    else
      t_185 = false;
    end
    if t_185 then
      t_180 = snake__329.id;
      t_181 = snake__329.segments;
      t_182 = snake__329.score;
      t_183 = snake__329.status;
      temper.listbuilder_add(newSnakes__327, PlayerSnake(t_180, t_181, dir__325, t_182, t_183));
    else
      temper.listbuilder_add(newSnakes__327, snake__329);
    end
    i__328 = temper.int32_add(i__328, 1);
  end
  return MultiSnakeGame(game__323.width, game__323.height, temper.listbuilder_tolist(newSnakes__327), game__323.food, game__323.rngSeed, game__323.tickCount);
end;
isMultiGameOver = function(game__330)
  local return__83, t_186, t_187, t_188, aliveCount__332, i__333;
  aliveCount__332 = 0;
  i__333 = 0;
  while true do
    local snake__334;
    t_186 = temper.list_length(game__330.snakes);
    if not (i__333 < t_186) then
      break;
    end
    t_187 = game__330.snakes;
    t_188 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__334 = temper.listed_getor(t_187, i__333, t_188);
    if temper.instance_of(snake__334.status, Alive) then
      aliveCount__332 = temper.int32_add(aliveCount__332, 1);
    end
    i__333 = temper.int32_add(i__333, 1);
  end
  if (temper.list_length(game__330.snakes) == 0) then
    return__83 = false;
  elseif (temper.list_length(game__330.snakes) == 1) then
    return__83 = (aliveCount__332 == 0);
  else
    return__83 = (aliveCount__332 <= 1);
  end
  return return__83;
end;
addPlayer = function(game__335, seed__336)
  local t_189, t_190, t_191, newId__338, spawn__339, dir__340, delta__341, startX__342, startY__343, segments__344, newSnake__345, builder__346, i__347, t_192, allSegs__348, t_193, t_194, foodResult__349;
  newId__338 = temper.list_length(game__335.snakes);
  spawn__339 = spawnPosition__94(game__335.width, game__335.height, newId__338, temper.int32_add(newId__338, 1));
  dir__340 = spawn__339.direction;
  delta__341 = directionDelta(dir__340);
  startX__342 = spawn__339.point.x;
  startY__343 = spawn__339.point.y;
  segments__344 = temper.listof(Point(startX__342, startY__343), Point(temper.int32_sub(startX__342, delta__341.x), temper.int32_sub(startY__343, delta__341.y)), Point(temper.int32_sub(startX__342, temper.int32_mul(delta__341.x, 2)), temper.int32_sub(startY__343, temper.int32_mul(delta__341.y, 2))));
  newSnake__345 = PlayerSnake(newId__338, segments__344, dir__340, 0, Alive());
  builder__346 = temper.listbuilder_constructor();
  i__347 = 0;
  while true do
    t_189 = temper.list_length(game__335.snakes);
    if not (i__347 < t_189) then
      break;
    end
    t_190 = game__335.snakes;
    t_191 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    temper.listbuilder_add(builder__346, temper.listed_getor(t_190, i__347, t_191));
    i__347 = temper.int32_add(i__347, 1);
  end
  temper.listbuilder_add(builder__346, newSnake__345);
  t_192 = temper.listbuilder_tolist(builder__346);
  allSegs__348 = collectAllSegments__95(t_192);
  t_193 = game__335.width;
  t_194 = game__335.height;
  foodResult__349 = placeFood__92(allSegs__348, t_193, t_194, seed__336);
  return MultiSnakeGame(game__335.width, game__335.height, temper.listbuilder_tolist(builder__346), foodResult__349.point, foodResult__349.seed, game__335.tickCount);
end;
removePlayer = function(game__350, playerId__351)
  local t_195, t_196, t_197, builder__353, i__354;
  builder__353 = temper.listbuilder_constructor();
  i__354 = 0;
  while true do
    local snake__355;
    t_195 = temper.list_length(game__350.snakes);
    if not (i__354 < t_195) then
      break;
    end
    t_196 = game__350.snakes;
    t_197 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__355 = temper.listed_getor(t_196, i__354, t_197);
    if (snake__355.id ~= playerId__351) then
      temper.listbuilder_add(builder__353, snake__355);
    end
    i__354 = temper.int32_add(i__354, 1);
  end
  return MultiSnakeGame(game__350.width, game__350.height, temper.listbuilder_tolist(builder__353), game__350.food, game__350.rngSeed, game__350.tickCount);
end;
playerHeadChar = function(id__368)
  local return__87;
  if (id__368 == 0) then
    return__87 = '@';
  elseif (id__368 == 1) then
    return__87 = '#';
  elseif (id__368 == 2) then
    return__87 = '$';
  elseif (id__368 == 3) then
    return__87 = '%';
  else
    return__87 = '&';
  end
  return return__87;
end;
playerBodyChar = function(id__370)
  local return__88;
  if (id__370 == 0) then
    return__88 = 'o';
  elseif (id__370 == 1) then
    return__88 = '+';
  elseif (id__370 == 2) then
    return__88 = '~';
  elseif (id__370 == 3) then
    return__88 = '=';
  else
    return__88 = '.';
  end
  return return__88;
end;
multiCellChar__96 = function(game__372, p__373)
  local return__89, t_198, t_199, t_200, t_201, t_202, t_203, t_204, t_205, t_206, t_207, t_208, t_209, t_210, i__375, i__378;
  ::continue_9::i__375 = 0;
  while true do
    local snake__376;
    t_198 = temper.list_length(game__372.snakes);
    if not (i__375 < t_198) then
      break;
    end
    t_199 = game__372.snakes;
    t_200 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__376 = temper.listed_getor(t_199, i__375, t_200);
    if (temper.list_length(snake__376.segments) > 0) then
      local head__377;
      head__377 = temper.listed_getor(snake__376.segments, 0, Point(-1, -1));
      if pointEquals(p__373, head__377) then
        t_201 = snake__376.id;
        return__89 = playerHeadChar(t_201);
        goto break_8;
      end
    end
    i__375 = temper.int32_add(i__375, 1);
  end
  i__378 = 0;
  while true do
    local snake__379, j__380;
    t_202 = temper.list_length(game__372.snakes);
    if not (i__378 < t_202) then
      break;
    end
    t_203 = game__372.snakes;
    t_204 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__379 = temper.listed_getor(t_203, i__378, t_204);
    j__380 = 1;
    while true do
      t_205 = temper.list_length(snake__379.segments);
      if not (j__380 < t_205) then
        break;
      end
      t_206 = snake__379.segments;
      t_207 = Point(-1, -1);
      t_208 = temper.listed_getor(t_206, j__380, t_207);
      if pointEquals(p__373, t_208) then
        t_209 = snake__379.id;
        return__89 = playerBodyChar(t_209);
        goto break_8;
      end
      j__380 = temper.int32_add(j__380, 1);
    end
    i__378 = temper.int32_add(i__378, 1);
  end
  t_210 = game__372.food;
  if pointEquals(p__373, t_210) then
    return__89 = '*';
    goto break_8;
  end
  return__89 = ' ';
  ::break_8::return return__89;
end;
multiRender = function(game__356)
  local t_211, t_212, t_213, t_214, t_215, t_216, t_217, t_218, t_219, sb__358, x__359, y__360, x__363, i__364;
  sb__358 = temper.stringbuilder_constructor();
  temper.stringbuilder_append(sb__358, '\x1b[2J\x1b[H');
  temper.stringbuilder_append(sb__358, '#');
  x__359 = 0;
  while true do
    t_211 = game__356.width;
    if not (x__359 < t_211) then
      break;
    end
    temper.stringbuilder_append(sb__358, '#');
    x__359 = temper.int32_add(x__359, 1);
  end
  temper.stringbuilder_append(sb__358, '#\r\n');
  y__360 = 0;
  while true do
    local x__361;
    t_212 = game__356.height;
    if not (y__360 < t_212) then
      break;
    end
    temper.stringbuilder_append(sb__358, '#');
    x__361 = 0;
    while true do
      local p__362;
      t_213 = game__356.width;
      if not (x__361 < t_213) then
        break;
      end
      p__362 = Point(x__361, y__360);
      temper.stringbuilder_append(sb__358, multiCellChar__96(game__356, p__362));
      x__361 = temper.int32_add(x__361, 1);
    end
    temper.stringbuilder_append(sb__358, '#\r\n');
    y__360 = temper.int32_add(y__360, 1);
  end
  temper.stringbuilder_append(sb__358, '#');
  x__363 = 0;
  while true do
    t_214 = game__356.width;
    if not (x__363 < t_214) then
      break;
    end
    temper.stringbuilder_append(sb__358, '#');
    x__363 = temper.int32_add(x__363, 1);
  end
  temper.stringbuilder_append(sb__358, '#\r\n');
  i__364 = 0;
  while true do
    local snake__365, statusText__366, symbol__367;
    t_215 = temper.list_length(game__356.snakes);
    if not (i__364 < t_215) then
      break;
    end
    t_216 = game__356.snakes;
    t_217 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__365 = temper.listed_getor(t_216, i__364, t_217);
    t_218 = snake__365.status;
    if temper.instance_of(t_218, Alive) then
      t_219 = 'Playing';
    elseif temper.instance_of(t_218, Dead) then
      t_219 = 'DEAD';
    else
      t_219 = '';
    end
    statusText__366 = t_219;
    symbol__367 = playerHeadChar(snake__365.id);
    temper.stringbuilder_append(sb__358, temper.concat('P', temper.int32_tostring(snake__365.id), ' ', symbol__367, ': ', temper.int32_tostring(snake__365.score), '  ', statusText__366, '\r', '\n'));
    i__364 = temper.int32_add(i__364, 1);
  end
  return temper.stringbuilder_tostring(sb__358);
end;
directionToString = function(dir__381)
  local return__90;
  if temper.instance_of(dir__381, Up) then
    return__90 = 'up';
  elseif temper.instance_of(dir__381, Down) then
    return__90 = 'down';
  elseif temper.instance_of(dir__381, Left) then
    return__90 = 'left';
  elseif temper.instance_of(dir__381, Right) then
    return__90 = 'right';
  else
    return__90 = 'right';
  end
  return return__90;
end;
stringToDirection = function(s__383)
  local return__91;
  ::continue_11::
  if temper.str_eq(s__383, 'up') then
    return__91 = Up();
    goto break_10;
  end
  if temper.str_eq(s__383, 'down') then
    return__91 = Down();
    goto break_10;
  end
  if temper.str_eq(s__383, 'left') then
    return__91 = Left();
    goto break_10;
  end
  if temper.str_eq(s__383, 'right') then
    return__91 = Right();
    goto break_10;
  end
  return__91 = temper.null;
  ::break_10::return return__91;
end;
temper.run_scheduler();
exports = {};
exports.Direction = Direction;
exports.Up = Up;
exports.Down = Down;
exports.Left = Left;
exports.Right = Right;
exports.Point = Point;
exports.GameStatus = GameStatus;
exports.Playing = Playing;
exports.GameOver = GameOver;
exports.RandomResult = RandomResult;
exports.SnakeGame = SnakeGame;
exports.PlayerStatus = PlayerStatus;
exports.Alive = Alive;
exports.Dead = Dead;
exports.PlayerSnake = PlayerSnake;
exports.MultiSnakeGame = MultiSnakeGame;
exports.move = move;
exports.pointEquals = pointEquals;
exports.isOpposite = isOpposite;
exports.directionDelta = directionDelta;
exports.nextRandom = nextRandom;
exports.newGame = newGame;
exports.changeDirection = changeDirection;
exports.tick = tick;
exports.render = render;
exports.newMultiGame = newMultiGame;
exports.multiTick = multiTick;
exports.changePlayerDirection = changePlayerDirection;
exports.isMultiGameOver = isMultiGameOver;
exports.addPlayer = addPlayer;
exports.removePlayer = removePlayer;
exports.playerHeadChar = playerHeadChar;
exports.playerBodyChar = playerBodyChar;
exports.multiRender = multiRender;
exports.directionToString = directionToString;
exports.stringToDirection = stringToDirection;
return exports;
