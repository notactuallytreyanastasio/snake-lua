local temper = require('temper-core');
local Direction, Up, Down, Left, Right, Point, GameStatus, Playing, GameOver, RandomResult, SnakeGame, FoodPlacement__33, PlayerStatus, Alive, Dead, PlayerSnake, MultiSnakeGame, SpawnInfo__34, move, pointEquals, isOpposite, directionDelta, nextRandom, placeFood__93, newGame, changeDirection, tick, cellChar__94, render, spawnPosition__95, collectAllSegments__96, newMultiGame, multiTick, changePlayerDirection, isMultiGameOver, addPlayer, removePlayer, playerHeadChar, playerBodyChar, multiCellChar__97, multiRender, directionToString, stringToDirection, exports;
Direction = temper.type('Direction');
Up = temper.type('Up', Direction);
Up.constructor = function(this__36)
  return nil;
end;
Down = temper.type('Down', Direction);
Down.constructor = function(this__38)
  return nil;
end;
Left = temper.type('Left', Direction);
Left.constructor = function(this__40)
  return nil;
end;
Right = temper.type('Right', Direction);
Right.constructor = function(this__42)
  return nil;
end;
Point = temper.type('Point');
Point.constructor = function(this__44, x__111, y__112)
  this__44.x__108 = x__111;
  this__44.y__109 = y__112;
  return nil;
end;
Point.get.x = function(this__418)
  return this__418.x__108;
end;
Point.get.y = function(this__421)
  return this__421.y__109;
end;
GameStatus = temper.type('GameStatus');
Playing = temper.type('Playing', GameStatus);
Playing.constructor = function(this__46)
  return nil;
end;
GameOver = temper.type('GameOver', GameStatus);
GameOver.constructor = function(this__48)
  return nil;
end;
RandomResult = temper.type('RandomResult');
RandomResult.constructor = function(this__53, value__126, nextSeed__127)
  this__53.value__123 = value__126;
  this__53.nextSeed__124 = nextSeed__127;
  return nil;
end;
RandomResult.get.value = function(this__432)
  return this__432.value__123;
end;
RandomResult.get.nextSeed = function(this__435)
  return this__435.nextSeed__124;
end;
SnakeGame = temper.type('SnakeGame');
SnakeGame.constructor = function(this__56, width__144, height__145, snake__146, direction__147, food__148, score__149, status__150, rngSeed__151)
  this__56.width__135 = width__144;
  this__56.height__136 = height__145;
  this__56.snake__137 = snake__146;
  this__56.direction__138 = direction__147;
  this__56.food__139 = food__148;
  this__56.score__140 = score__149;
  this__56.status__141 = status__150;
  this__56.rngSeed__142 = rngSeed__151;
  return nil;
end;
SnakeGame.get.width = function(this__438)
  return this__438.width__135;
end;
SnakeGame.get.height = function(this__441)
  return this__441.height__136;
end;
SnakeGame.get.snake = function(this__444)
  return this__444.snake__137;
end;
SnakeGame.get.direction = function(this__447)
  return this__447.direction__138;
end;
SnakeGame.get.food = function(this__450)
  return this__450.food__139;
end;
SnakeGame.get.score = function(this__453)
  return this__453.score__140;
end;
SnakeGame.get.status = function(this__456)
  return this__456.status__141;
end;
SnakeGame.get.rngSeed = function(this__459)
  return this__459.rngSeed__142;
end;
FoodPlacement__33 = temper.type('FoodPlacement__33');
FoodPlacement__33.constructor = function(this__59, point__155, seed__156)
  this__59.point__152 = point__155;
  this__59.seed__153 = seed__156;
  return nil;
end;
FoodPlacement__33.get.point = function(this__462)
  return this__462.point__152;
end;
FoodPlacement__33.get.seed = function(this__465)
  return this__465.seed__153;
end;
PlayerStatus = temper.type('PlayerStatus');
Alive = temper.type('Alive', PlayerStatus);
Alive.constructor = function(this__67)
  return nil;
end;
Dead = temper.type('Dead', PlayerStatus);
Dead.constructor = function(this__69)
  return nil;
end;
PlayerSnake = temper.type('PlayerSnake');
PlayerSnake.constructor = function(this__71, id__223, segments__224, direction__225, score__226, status__227)
  this__71.id__217 = id__223;
  this__71.segments__218 = segments__224;
  this__71.direction__219 = direction__225;
  this__71.score__220 = score__226;
  this__71.status__221 = status__227;
  return nil;
end;
PlayerSnake.get.id = function(this__471)
  return this__471.id__217;
end;
PlayerSnake.get.segments = function(this__474)
  return this__474.segments__218;
end;
PlayerSnake.get.direction = function(this__477)
  return this__477.direction__219;
end;
PlayerSnake.get.score = function(this__480)
  return this__480.score__220;
end;
PlayerSnake.get.status = function(this__483)
  return this__483.status__221;
end;
MultiSnakeGame = temper.type('MultiSnakeGame');
MultiSnakeGame.constructor = function(this__74, width__235, height__236, snakes__237, food__238, rngSeed__239, tickCount__240)
  this__74.width__228 = width__235;
  this__74.height__229 = height__236;
  this__74.snakes__230 = snakes__237;
  this__74.food__231 = food__238;
  this__74.rngSeed__232 = rngSeed__239;
  this__74.tickCount__233 = tickCount__240;
  return nil;
end;
MultiSnakeGame.get.width = function(this__486)
  return this__486.width__228;
end;
MultiSnakeGame.get.height = function(this__489)
  return this__489.height__229;
end;
MultiSnakeGame.get.snakes = function(this__492)
  return this__492.snakes__230;
end;
MultiSnakeGame.get.food = function(this__495)
  return this__495.food__231;
end;
MultiSnakeGame.get.rngSeed = function(this__498)
  return this__498.rngSeed__232;
end;
MultiSnakeGame.get.tickCount = function(this__501)
  return this__501.tickCount__233;
end;
SpawnInfo__34 = temper.type('SpawnInfo__34');
SpawnInfo__34.constructor = function(this__78, point__260, direction__261)
  this__78.point__257 = point__260;
  this__78.direction__258 = direction__261;
  return nil;
end;
SpawnInfo__34.get.point = function(this__504)
  return this__504.point__257;
end;
SpawnInfo__34.get.direction = function(this__507)
  return this__507.direction__258;
end;
move = function(head__98, body__99, food__100, width__101, height__102)
  return Right();
end;
pointEquals = function(a__115, b__116)
  local return__50, t_0, t_1;
  if (a__115.x == b__116.x) then
    t_0 = a__115.y;
    t_1 = b__116.y;
    return__50 = (t_0 == t_1);
  else
    return__50 = false;
  end
  return return__50;
end;
isOpposite = function(a__118, b__119)
  local return__51;
  if temper.instance_of(a__118, Up) then
    return__51 = temper.instance_of(b__119, Down);
  elseif temper.instance_of(a__118, Down) then
    return__51 = temper.instance_of(b__119, Up);
  elseif temper.instance_of(a__118, Left) then
    return__51 = temper.instance_of(b__119, Right);
  elseif temper.instance_of(a__118, Right) then
    return__51 = temper.instance_of(b__119, Left);
  else
    return__51 = false;
  end
  return return__51;
end;
directionDelta = function(dir__121)
  local return__52;
  if temper.instance_of(dir__121, Up) then
    return__52 = Point(0, -1);
  elseif temper.instance_of(dir__121, Down) then
    return__52 = Point(0, 1);
  elseif temper.instance_of(dir__121, Left) then
    return__52 = Point(-1, 0);
  elseif temper.instance_of(dir__121, Right) then
    return__52 = Point(1, 0);
  else
    return__52 = Point(0, 0);
  end
  return return__52;
end;
nextRandom = function(seed__128, max__129)
  local t_2, t_3, raw__131, masked__132, posVal__133, value__134;
  raw__131 = temper.int32_add(temper.int32_mul(seed__128, 1664525), 1013904223);
  masked__132 = temper.band(raw__131, 2147483647);
  if (masked__132 < 0) then
    posVal__133 = temper.int32_unm(masked__132);
  else
    posVal__133 = masked__132;
  end
  value__134 = 0;
  if (max__129 > 0) then
    local local_4, local_5, local_6;
    local_4, local_5, local_6 = temper.pcall(function()
      t_2 = temper.int32_mod(posVal__133, max__129);
      t_3 = t_2;
    end);
    if local_4 then
    else
      t_3 = 0;
    end
    value__134 = t_3;
  end
  return RandomResult(value__134, masked__132);
end;
placeFood__93 = function(snake__157, width__158, height__159, seed__160)
  local return__61, t_8, t_9, t_10, t_11, t_12, t_13, totalCells__162, currentSeed__163, attempt__164, y__171;
  ::continue_1::totalCells__162 = temper.int32_mul(width__158, height__159);
  currentSeed__163 = seed__160;
  attempt__164 = 0;
  while (attempt__164 < totalCells__162) do
    local result__165, px__166, py__167, candidate__168, occupied__169, fn__2769;
    result__165 = nextRandom(currentSeed__163, totalCells__162);
    t_8 = result__165.nextSeed;
    currentSeed__163 = t_8;
    px__166 = 0;
    py__167 = 0;
    if (width__158 > 0) then
      local local_14, local_15, local_16, local_18, local_19, local_20;
      local_14, local_15, local_16 = temper.pcall(function()
        t_10 = temper.int32_mod(result__165.value, width__158);
        t_11 = t_10;
      end);
      if local_14 then
      else
        t_11 = 0;
      end
      px__166 = t_11;
      local_18, local_19, local_20 = temper.pcall(function()
        t_12 = temper.int32_div(result__165.value, width__158);
        t_13 = t_12;
      end);
      if local_18 then
      else
        t_13 = 0;
      end
      py__167 = t_13;
    end
    candidate__168 = Point(px__166, py__167);
    occupied__169 = false;
    fn__2769 = function(seg__170)
      if pointEquals(seg__170, candidate__168) then
        occupied__169 = true;
      end
      return nil;
    end;
    temper.list_foreach(snake__157, fn__2769);
    if not occupied__169 then
      return__61 = FoodPlacement__33(candidate__168, currentSeed__163);
      goto break_0;
    end
    attempt__164 = temper.int32_add(attempt__164, 1);
  end
  y__171 = 0;
  while (y__171 < height__159) do
    local x__172;
    x__172 = 0;
    while (x__172 < width__158) do
      local candidate__173, free__174, fn__2768;
      candidate__173 = Point(x__172, y__171);
      free__174 = true;
      fn__2768 = function(seg__175)
        if pointEquals(seg__175, candidate__173) then
          free__174 = false;
        end
        return nil;
      end;
      temper.list_foreach(snake__157, fn__2768);
      if free__174 then
        return__61 = FoodPlacement__33(candidate__173, currentSeed__163);
        goto break_0;
      end
      x__172 = temper.int32_add(x__172, 1);
    end
    y__171 = temper.int32_add(y__171, 1);
  end
  t_9 = Point(0, 0);
  return__61 = FoodPlacement__33(t_9, currentSeed__163);
  ::break_0::return return__61;
end;
newGame = function(width__176, height__177, seed__178)
  local t_22, t_23, t_24, t_25, centerX__180, centerY__181, snake__182, foodResult__183, t_26, t_27, t_28, t_29;
  centerX__180 = 0;
  centerY__181 = 0;
  if (width__176 > 0) then
    t_22 = temper.int32_div(width__176, 2);
    t_23 = t_22;
    centerX__180 = t_23;
  end
  if (height__177 > 0) then
    t_24 = temper.int32_div(height__177, 2);
    t_25 = t_24;
    centerY__181 = t_25;
  end
  snake__182 = temper.listof(Point(centerX__180, centerY__181), Point(temper.int32_sub(centerX__180, 1), centerY__181), Point(temper.int32_sub(centerX__180, 2), centerY__181));
  foodResult__183 = placeFood__93(snake__182, width__176, height__177, seed__178);
  t_26 = Right();
  t_27 = foodResult__183.point;
  t_28 = Playing();
  t_29 = foodResult__183.seed;
  return SnakeGame(width__176, height__177, snake__182, t_26, t_27, 0, t_28, t_29);
end;
changeDirection = function(game__184, dir__185)
  local return__63, t_30, t_31, t_32, t_33, t_34, t_35, t_36;
  if isOpposite(game__184.direction, dir__185) then
    return__63 = game__184;
  else
    t_30 = game__184.width;
    t_31 = game__184.height;
    t_32 = game__184.snake;
    t_33 = game__184.food;
    t_34 = game__184.score;
    t_35 = game__184.status;
    t_36 = game__184.rngSeed;
    return__63 = SnakeGame(t_30, t_31, t_32, dir__185, t_33, t_34, t_35, t_36);
  end
  return return__63;
end;
tick = function(game__187)
  local return__64, t_37, t_38, t_39, t_40, t_41, t_42, t_43, t_44, t_45, t_46, t_47, t_48, t_49, t_50, t_51, t_52, t_53, t_54, t_55, t_56, t_57, t_58, t_59, t_60, t_61, t_62, t_63, t_64, t_65, t_66, t_67, t_68, t_69, t_70, t_71, t_72, t_73, t_74, t_75, t_76, t_77, t_78, t_79, t_80, t_81, delta__189, head__190, newHead__191, eating__192, checkLength__193, i__194, newSnakeBuilder__195, keepLength__196, i__197, newSnake__198;
  ::continue_3::
  if temper.instance_of(game__187.status, GameOver) then
    return__64 = game__187;
    goto break_2;
  end
  delta__189 = directionDelta(game__187.direction);
  head__190 = temper.listed_getor(game__187.snake, 0, Point(0, 0));
  newHead__191 = Point(temper.int32_add(head__190.x, delta__189.x), temper.int32_add(head__190.y, delta__189.y));
  if (newHead__191.x < 0) then
    t_81 = true;
  else
    if (newHead__191.x >= game__187.width) then
      t_80 = true;
    else
      if (newHead__191.y < 0) then
        t_79 = true;
      else
        t_37 = newHead__191.y;
        t_38 = game__187.height;
        t_79 = (t_37 >= t_38);
      end
      t_80 = t_79;
    end
    t_81 = t_80;
  end
  if t_81 then
    t_39 = game__187.width;
    t_40 = game__187.height;
    t_41 = game__187.snake;
    t_42 = game__187.direction;
    t_43 = game__187.food;
    t_44 = game__187.score;
    t_45 = GameOver();
    t_46 = game__187.rngSeed;
    return__64 = SnakeGame(t_39, t_40, t_41, t_42, t_43, t_44, t_45, t_46);
    goto break_2;
  end
  eating__192 = pointEquals(newHead__191, game__187.food);
  if eating__192 then
    t_47 = temper.list_length(game__187.snake);
    checkLength__193 = t_47;
  else
    t_48 = temper.list_length(game__187.snake);
    checkLength__193 = temper.int32_sub(t_48, 1);
  end
  i__194 = 0;
  while (i__194 < checkLength__193) do
    t_49 = game__187.snake;
    t_50 = Point(-1, -1);
    if pointEquals(newHead__191, temper.listed_getor(t_49, i__194, t_50)) then
      t_51 = game__187.width;
      t_52 = game__187.height;
      t_53 = game__187.snake;
      t_54 = game__187.direction;
      t_55 = game__187.food;
      t_56 = game__187.score;
      t_57 = GameOver();
      t_58 = game__187.rngSeed;
      return__64 = SnakeGame(t_51, t_52, t_53, t_54, t_55, t_56, t_57, t_58);
      goto break_2;
    end
    i__194 = temper.int32_add(i__194, 1);
  end
  newSnakeBuilder__195 = temper.listbuilder_constructor();
  temper.listbuilder_add(newSnakeBuilder__195, newHead__191);
  if eating__192 then
    t_59 = temper.list_length(game__187.snake);
    keepLength__196 = t_59;
  else
    t_60 = temper.list_length(game__187.snake);
    keepLength__196 = temper.int32_sub(t_60, 1);
  end
  i__197 = 0;
  while (i__197 < keepLength__196) do
    t_61 = game__187.snake;
    t_62 = Point(0, 0);
    temper.listbuilder_add(newSnakeBuilder__195, temper.listed_getor(t_61, i__197, t_62));
    i__197 = temper.int32_add(i__197, 1);
  end
  newSnake__198 = temper.listbuilder_tolist(newSnakeBuilder__195);
  if eating__192 then
    local newScore__199, foodResult__200;
    newScore__199 = temper.int32_add(game__187.score, 1);
    t_63 = game__187.width;
    t_64 = game__187.height;
    t_65 = game__187.rngSeed;
    foodResult__200 = placeFood__93(newSnake__198, t_63, t_64, t_65);
    t_66 = game__187.width;
    t_67 = game__187.height;
    t_68 = game__187.direction;
    t_69 = foodResult__200.point;
    t_70 = Playing();
    t_71 = foodResult__200.seed;
    return__64 = SnakeGame(t_66, t_67, newSnake__198, t_68, t_69, newScore__199, t_70, t_71);
  else
    t_72 = game__187.width;
    t_73 = game__187.height;
    t_74 = game__187.direction;
    t_75 = game__187.food;
    t_76 = game__187.score;
    t_77 = game__187.status;
    t_78 = game__187.rngSeed;
    return__64 = SnakeGame(t_72, t_73, newSnake__198, t_74, t_75, t_76, t_77, t_78);
  end
  ::break_2::return return__64;
end;
cellChar__94 = function(game__210, p__211)
  local return__66, t_82, t_83, t_84, t_85, t_86, head__213, i__214;
  ::continue_5::head__213 = temper.listed_getor(game__210.snake, 0, Point(-1, -1));
  if pointEquals(p__211, head__213) then
    return__66 = '@';
    goto break_4;
  end
  i__214 = 1;
  while true do
    t_82 = temper.list_length(game__210.snake);
    if not (i__214 < t_82) then
      break;
    end
    t_83 = game__210.snake;
    t_84 = Point(-1, -1);
    t_85 = temper.listed_getor(t_83, i__214, t_84);
    if pointEquals(p__211, t_85) then
      return__66 = 'o';
      goto break_4;
    end
    i__214 = temper.int32_add(i__214, 1);
  end
  t_86 = game__210.food;
  if pointEquals(p__211, t_86) then
    return__66 = '*';
    goto break_4;
  end
  return__66 = ' ';
  ::break_4::return return__66;
end;
render = function(game__201)
  local t_87, t_88, t_89, t_90, sb__203, x__204, y__205, x__208, statusText__209, t_91;
  sb__203 = temper.stringbuilder_constructor();
  temper.stringbuilder_append(sb__203, '\x1b[2J\x1b[H');
  temper.stringbuilder_append(sb__203, '#');
  x__204 = 0;
  while true do
    t_87 = game__201.width;
    if not (x__204 < t_87) then
      break;
    end
    temper.stringbuilder_append(sb__203, '#');
    x__204 = temper.int32_add(x__204, 1);
  end
  temper.stringbuilder_append(sb__203, '#\r\n');
  y__205 = 0;
  while true do
    local x__206;
    t_88 = game__201.height;
    if not (y__205 < t_88) then
      break;
    end
    temper.stringbuilder_append(sb__203, '#');
    x__206 = 0;
    while true do
      local p__207;
      t_89 = game__201.width;
      if not (x__206 < t_89) then
        break;
      end
      p__207 = Point(x__206, y__205);
      temper.stringbuilder_append(sb__203, cellChar__94(game__201, p__207));
      x__206 = temper.int32_add(x__206, 1);
    end
    temper.stringbuilder_append(sb__203, '#\r\n');
    y__205 = temper.int32_add(y__205, 1);
  end
  temper.stringbuilder_append(sb__203, '#');
  x__208 = 0;
  while true do
    t_90 = game__201.width;
    if not (x__208 < t_90) then
      break;
    end
    temper.stringbuilder_append(sb__203, '#');
    x__208 = temper.int32_add(x__208, 1);
  end
  temper.stringbuilder_append(sb__203, '#\r\n');
  t_91 = game__201.status;
  if temper.instance_of(t_91, Playing) then
    statusText__209 = 'Playing';
  elseif temper.instance_of(t_91, GameOver) then
    statusText__209 = 'GAME OVER';
  else
    statusText__209 = '';
  end
  temper.stringbuilder_append(sb__203, temper.concat('Score: ', temper.int32_tostring(game__201.score), '  ', statusText__209, '\r', '\n'));
  return temper.stringbuilder_tostring(sb__203);
end;
spawnPosition__95 = function(width__262, height__263, index__264, seed__265)
  local return__80, t_92, t_93, t_94, t_95, t_96, t_97, t_98, t_99, t_100, t_101, t_102, t_103, t_104, buf__267, safeW__268, safeH__269, r1__270, r2__271, x__272, y__273, r3__274, dir__275;
  ::continue_7::buf__267 = 5;
  safeW__268 = temper.int32_sub(width__262, 10);
  safeH__269 = temper.int32_sub(height__263, 10);
  if (safeW__268 < 1) then
    t_100 = true;
  else
    t_100 = (safeH__269 < 1);
  end
  if t_100 then
    t_101 = temper.int32_div(width__262, 2);
    t_102 = t_101;
    t_103 = temper.int32_div(height__263, 2);
    t_104 = t_103;
    t_92 = Point(t_102, t_104);
    t_93 = Right();
    return__80 = SpawnInfo__34(t_92, t_93);
    goto break_6;
  end
  r1__270 = nextRandom(temper.int32_add(temper.int32_add(temper.int32_mul(seed__265, 7), temper.int32_mul(index__264, 131)), 37), safeW__268);
  r2__271 = nextRandom(r1__270.nextSeed, safeH__269);
  x__272 = temper.int32_add(5, r1__270.value);
  y__273 = temper.int32_add(5, r2__271.value);
  r3__274 = nextRandom(r2__271.nextSeed, 4);
  t_94 = Right();
  dir__275 = t_94;
  if (r3__274.value == 0) then
    t_95 = Right();
    dir__275 = t_95;
  end
  if (r3__274.value == 1) then
    t_96 = Left();
    dir__275 = t_96;
  end
  if (r3__274.value == 2) then
    t_97 = Down();
    dir__275 = t_97;
  end
  if (r3__274.value == 3) then
    t_98 = Up();
    dir__275 = t_98;
  end
  t_99 = Point(x__272, y__273);
  return__80 = SpawnInfo__34(t_99, dir__275);
  ::break_6::return return__80;
end;
collectAllSegments__96 = function(snakes__276)
  local t_105, t_106, t_107, t_108, t_109, builder__278, i__279;
  builder__278 = temper.listbuilder_constructor();
  i__279 = 0;
  while true do
    local snake__280, j__281;
    t_105 = temper.list_length(snakes__276);
    if not (i__279 < t_105) then
      break;
    end
    t_106 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__280 = temper.listed_getor(snakes__276, i__279, t_106);
    j__281 = 0;
    while true do
      t_107 = temper.list_length(snake__280.segments);
      if not (j__281 < t_107) then
        break;
      end
      t_108 = snake__280.segments;
      t_109 = Point(0, 0);
      temper.listbuilder_add(builder__278, temper.listed_getor(t_108, j__281, t_109));
      j__281 = temper.int32_add(j__281, 1);
    end
    i__279 = temper.int32_add(i__279, 1);
  end
  return temper.listbuilder_tolist(builder__278);
end;
newMultiGame = function(width__241, height__242, numPlayers__243, seed__244)
  local t_110, snakeBuilder__246, currentSeed__247, i__248, t_111, allSegments__255, foodResult__256, t_112, t_113, t_114;
  snakeBuilder__246 = temper.listbuilder_constructor();
  currentSeed__247 = seed__244;
  i__248 = 0;
  while (i__248 < numPlayers__243) do
    local spawn__249, dir__250, startX__251, startY__252, delta__253, segments__254;
    spawn__249 = spawnPosition__95(width__241, height__242, i__248, currentSeed__247);
    dir__250 = spawn__249.direction;
    startX__251 = spawn__249.point.x;
    startY__252 = spawn__249.point.y;
    delta__253 = directionDelta(dir__250);
    segments__254 = temper.listof(Point(startX__251, startY__252), Point(temper.int32_sub(startX__251, delta__253.x), temper.int32_sub(startY__252, delta__253.y)), Point(temper.int32_sub(startX__251, temper.int32_mul(delta__253.x, 2)), temper.int32_sub(startY__252, temper.int32_mul(delta__253.y, 2))));
    t_110 = Alive();
    temper.listbuilder_add(snakeBuilder__246, PlayerSnake(i__248, segments__254, dir__250, 0, t_110));
    i__248 = temper.int32_add(i__248, 1);
  end
  t_111 = temper.listbuilder_tolist(snakeBuilder__246);
  allSegments__255 = collectAllSegments__96(t_111);
  foodResult__256 = placeFood__93(allSegments__255, width__241, height__242, currentSeed__247);
  t_112 = temper.listbuilder_tolist(snakeBuilder__246);
  t_113 = foodResult__256.point;
  t_114 = foodResult__256.seed;
  return MultiSnakeGame(width__241, height__242, t_112, t_113, t_114, 0);
end;
multiTick = function(game__282, directions__283)
  local t_115, t_116, t_117, t_118, t_119, t_120, t_121, t_122, t_123, t_124, t_125, t_126, t_127, t_128, t_129, t_130, t_131, t_132, t_133, t_134, t_135, t_136, t_137, t_138, t_139, t_140, t_141, t_142, t_143, t_144, t_145, t_146, t_147, t_148, t_149, t_150, t_151, t_152, t_153, t_154, t_155, t_156, t_157, t_158, t_159, t_160, t_161, t_162, t_163, t_164, t_165, newDirs__285, i__286, newHeads__289, i__290, headsList__295, dirsList__296, aliveBuilder__297, i__298, aliveList__309, eaterIndex__310, i__311, resultSnakes__313, i__314, resultSnakesList__323, t_166, newFood__324, t_167, newSeed__325, t_168, t_169, t_170;
  newDirs__285 = temper.listbuilder_constructor();
  i__286 = 0;
  while true do
    local snake__287, inputDir__288;
    t_115 = temper.list_length(game__282.snakes);
    if not (i__286 < t_115) then
      break;
    end
    t_116 = game__282.snakes;
    t_117 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__287 = temper.listed_getor(t_116, i__286, t_117);
    t_118 = snake__287.direction;
    inputDir__288 = temper.listed_getor(directions__283, i__286, t_118);
    if isOpposite(snake__287.direction, inputDir__288) then
      temper.listbuilder_add(newDirs__285, snake__287.direction);
    else
      temper.listbuilder_add(newDirs__285, inputDir__288);
    end
    i__286 = temper.int32_add(i__286, 1);
  end
  newHeads__289 = temper.listbuilder_constructor();
  i__290 = 0;
  while true do
    local snake__291;
    t_119 = temper.list_length(game__282.snakes);
    if not (i__290 < t_119) then
      break;
    end
    t_120 = game__282.snakes;
    t_121 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__291 = temper.listed_getor(t_120, i__290, t_121);
    if temper.instance_of(snake__291.status, Alive) then
      local dir__292, delta__293, head__294;
      t_122 = temper.listbuilder_tolist(newDirs__285);
      t_123 = Right();
      dir__292 = temper.listed_getor(t_122, i__290, t_123);
      delta__293 = directionDelta(dir__292);
      head__294 = temper.listed_getor(snake__291.segments, 0, Point(0, 0));
      temper.listbuilder_add(newHeads__289, Point(temper.int32_add(head__294.x, delta__293.x), temper.int32_add(head__294.y, delta__293.y)));
    else
      temper.listbuilder_add(newHeads__289, Point(-1, -1));
    end
    i__290 = temper.int32_add(i__290, 1);
  end
  headsList__295 = temper.listbuilder_tolist(newHeads__289);
  dirsList__296 = temper.listbuilder_tolist(newDirs__285);
  aliveBuilder__297 = temper.listbuilder_constructor();
  i__298 = 0;
  while true do
    local snake__299;
    t_124 = temper.list_length(game__282.snakes);
    if not (i__298 < t_124) then
      break;
    end
    t_125 = game__282.snakes;
    t_126 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__299 = temper.listed_getor(t_125, i__298, t_126);
    if not temper.instance_of(snake__299.status, Alive) then
      temper.listbuilder_add(aliveBuilder__297, false);
    else
      local nh__300, dead__301;
      t_127 = Point(-1, -1);
      nh__300 = temper.listed_getor(headsList__295, i__298, t_127);
      dead__301 = false;
      if (nh__300.x < 0) then
        t_163 = true;
      else
        if (nh__300.x >= game__282.width) then
          t_162 = true;
        else
          if (nh__300.y < 0) then
            t_161 = true;
          else
            t_128 = nh__300.y;
            t_129 = game__282.height;
            t_161 = (t_128 >= t_129);
          end
          t_162 = t_161;
        end
        t_163 = t_162;
      end
      if t_163 then
        dead__301 = true;
      end
      if not dead__301 then
        local s__302;
        s__302 = 0;
        while true do
          t_130 = temper.list_length(snake__299.segments);
          if not (s__302 < temper.int32_sub(t_130, 1)) then
            break;
          end
          t_131 = snake__299.segments;
          t_132 = Point(-2, -2);
          if pointEquals(nh__300, temper.listed_getor(t_131, s__302, t_132)) then
            dead__301 = true;
          end
          s__302 = temper.int32_add(s__302, 1);
        end
      end
      if not dead__301 then
        local j__303;
        j__303 = 0;
        while true do
          t_133 = temper.list_length(game__282.snakes);
          if not (j__303 < t_133) then
            break;
          end
          if (j__303 ~= i__298) then
            local other__304;
            t_134 = game__282.snakes;
            t_135 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
            other__304 = temper.listed_getor(t_134, j__303, t_135);
            if temper.instance_of(other__304.status, Alive) then
              local s__305;
              s__305 = 0;
              while true do
                t_136 = temper.list_length(other__304.segments);
                if not (s__305 < temper.int32_sub(t_136, 1)) then
                  break;
                end
                t_137 = other__304.segments;
                t_138 = Point(-2, -2);
                if pointEquals(nh__300, temper.listed_getor(t_137, s__305, t_138)) then
                  dead__301 = true;
                end
                s__305 = temper.int32_add(s__305, 1);
              end
            end
          end
          j__303 = temper.int32_add(j__303, 1);
        end
      end
      if not dead__301 then
        local j__306;
        j__306 = 0;
        while true do
          t_139 = temper.list_length(game__282.snakes);
          if not (j__306 < t_139) then
            break;
          end
          if (j__306 ~= i__298) then
            local otherSnake__307;
            t_140 = game__282.snakes;
            t_141 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
            otherSnake__307 = temper.listed_getor(t_140, j__306, t_141);
            if temper.instance_of(otherSnake__307.status, Alive) then
              local otherHead__308;
              t_142 = Point(-3, -3);
              otherHead__308 = temper.listed_getor(headsList__295, j__306, t_142);
              if pointEquals(nh__300, otherHead__308) then
                dead__301 = true;
              end
            end
          end
          j__306 = temper.int32_add(j__306, 1);
        end
      end
      temper.listbuilder_add(aliveBuilder__297, not dead__301);
    end
    i__298 = temper.int32_add(i__298, 1);
  end
  aliveList__309 = temper.listbuilder_tolist(aliveBuilder__297);
  eaterIndex__310 = -1;
  i__311 = 0;
  while true do
    t_143 = temper.list_length(game__282.snakes);
    if not (i__311 < t_143) then
      break;
    end
    if temper.listed_getor(aliveList__309, i__311, false) then
      local nh__312;
      t_144 = Point(-1, -1);
      nh__312 = temper.listed_getor(headsList__295, i__311, t_144);
      if pointEquals(nh__312, game__282.food) then
        eaterIndex__310 = i__311;
      end
    end
    i__311 = temper.int32_add(i__311, 1);
  end
  resultSnakes__313 = temper.listbuilder_constructor();
  i__314 = 0;
  while true do
    local snake__315;
    t_145 = temper.list_length(game__282.snakes);
    if not (i__314 < t_145) then
      break;
    end
    t_146 = game__282.snakes;
    t_147 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__315 = temper.listed_getor(t_146, i__314, t_147);
    if not temper.instance_of(snake__315.status, Alive) then
      temper.listbuilder_add(resultSnakes__313, snake__315);
    elseif not temper.listed_getor(aliveList__309, i__314, false) then
      temper.listbuilder_add(resultSnakes__313, PlayerSnake(snake__315.id, snake__315.segments, snake__315.direction, snake__315.score, Dead()));
    else
      local nh__316, dir__317, isEating__318, keepLen__319, newSegs__320, s__321, newScore__322;
      t_148 = Point(0, 0);
      nh__316 = temper.listed_getor(headsList__295, i__314, t_148);
      t_149 = snake__315.direction;
      dir__317 = temper.listed_getor(dirsList__296, i__314, t_149);
      isEating__318 = (i__314 == eaterIndex__310);
      if isEating__318 then
        t_150 = temper.list_length(snake__315.segments);
        t_164 = t_150;
      else
        t_151 = temper.list_length(snake__315.segments);
        t_164 = temper.int32_sub(t_151, 1);
      end
      keepLen__319 = t_164;
      newSegs__320 = temper.listbuilder_constructor();
      temper.listbuilder_add(newSegs__320, nh__316);
      s__321 = 0;
      while (s__321 < keepLen__319) do
        t_152 = snake__315.segments;
        t_153 = Point(0, 0);
        temper.listbuilder_add(newSegs__320, temper.listed_getor(t_152, s__321, t_153));
        s__321 = temper.int32_add(s__321, 1);
      end
      if isEating__318 then
        t_154 = snake__315.score;
        t_165 = temper.int32_add(t_154, 1);
      else
        t_155 = snake__315.score;
        t_165 = t_155;
      end
      newScore__322 = t_165;
      temper.listbuilder_add(resultSnakes__313, PlayerSnake(snake__315.id, temper.listbuilder_tolist(newSegs__320), dir__317, newScore__322, Alive()));
    end
    i__314 = temper.int32_add(i__314, 1);
  end
  resultSnakesList__323 = temper.listbuilder_tolist(resultSnakes__313);
  t_166 = game__282.food;
  newFood__324 = t_166;
  t_167 = game__282.rngSeed;
  newSeed__325 = t_167;
  if (eaterIndex__310 >= 0) then
    local allSegs__326, foodResult__327;
    allSegs__326 = collectAllSegments__96(resultSnakesList__323);
    t_156 = game__282.width;
    t_157 = game__282.height;
    t_158 = game__282.rngSeed;
    foodResult__327 = placeFood__93(allSegs__326, t_156, t_157, t_158);
    t_159 = foodResult__327.point;
    newFood__324 = t_159;
    t_160 = foodResult__327.seed;
    newSeed__325 = t_160;
  end
  t_168 = game__282.width;
  t_169 = game__282.height;
  t_170 = game__282.tickCount;
  return MultiSnakeGame(t_168, t_169, resultSnakesList__323, newFood__324, newSeed__325, temper.int32_add(t_170, 1));
end;
changePlayerDirection = function(game__328, playerId__329, dir__330)
  local t_171, t_172, t_173, t_174, t_175, t_176, t_177, t_178, t_179, t_180, newSnakes__332, i__333;
  newSnakes__332 = temper.listbuilder_constructor();
  i__333 = 0;
  while true do
    local snake__334;
    t_171 = temper.list_length(game__328.snakes);
    if not (i__333 < t_171) then
      break;
    end
    t_172 = game__328.snakes;
    t_173 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__334 = temper.listed_getor(t_172, i__333, t_173);
    if (snake__334.id == playerId__329) then
      if temper.instance_of(snake__334.status, Alive) then
        t_174 = snake__334.direction;
        t_179 = not isOpposite(t_174, dir__330);
      else
        t_179 = false;
      end
      t_180 = t_179;
    else
      t_180 = false;
    end
    if t_180 then
      t_175 = snake__334.id;
      t_176 = snake__334.segments;
      t_177 = snake__334.score;
      t_178 = snake__334.status;
      temper.listbuilder_add(newSnakes__332, PlayerSnake(t_175, t_176, dir__330, t_177, t_178));
    else
      temper.listbuilder_add(newSnakes__332, snake__334);
    end
    i__333 = temper.int32_add(i__333, 1);
  end
  return MultiSnakeGame(game__328.width, game__328.height, temper.listbuilder_tolist(newSnakes__332), game__328.food, game__328.rngSeed, game__328.tickCount);
end;
isMultiGameOver = function(game__335)
  local return__84, t_181, t_182, t_183, aliveCount__337, i__338;
  aliveCount__337 = 0;
  i__338 = 0;
  while true do
    local snake__339;
    t_181 = temper.list_length(game__335.snakes);
    if not (i__338 < t_181) then
      break;
    end
    t_182 = game__335.snakes;
    t_183 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__339 = temper.listed_getor(t_182, i__338, t_183);
    if temper.instance_of(snake__339.status, Alive) then
      aliveCount__337 = temper.int32_add(aliveCount__337, 1);
    end
    i__338 = temper.int32_add(i__338, 1);
  end
  if (temper.list_length(game__335.snakes) == 0) then
    return__84 = false;
  elseif (temper.list_length(game__335.snakes) == 1) then
    return__84 = (aliveCount__337 == 0);
  else
    return__84 = (aliveCount__337 <= 1);
  end
  return return__84;
end;
addPlayer = function(game__340, seed__341)
  local t_184, t_185, t_186, newId__343, spawn__344, dir__345, delta__346, startX__347, startY__348, segments__349, newSnake__350, builder__351, i__352, t_187, allSegs__353, t_188, t_189, foodResult__354;
  newId__343 = temper.list_length(game__340.snakes);
  spawn__344 = spawnPosition__95(game__340.width, game__340.height, newId__343, seed__341);
  dir__345 = spawn__344.direction;
  delta__346 = directionDelta(dir__345);
  startX__347 = spawn__344.point.x;
  startY__348 = spawn__344.point.y;
  segments__349 = temper.listof(Point(startX__347, startY__348), Point(temper.int32_sub(startX__347, delta__346.x), temper.int32_sub(startY__348, delta__346.y)), Point(temper.int32_sub(startX__347, temper.int32_mul(delta__346.x, 2)), temper.int32_sub(startY__348, temper.int32_mul(delta__346.y, 2))));
  newSnake__350 = PlayerSnake(newId__343, segments__349, dir__345, 0, Alive());
  builder__351 = temper.listbuilder_constructor();
  i__352 = 0;
  while true do
    t_184 = temper.list_length(game__340.snakes);
    if not (i__352 < t_184) then
      break;
    end
    t_185 = game__340.snakes;
    t_186 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    temper.listbuilder_add(builder__351, temper.listed_getor(t_185, i__352, t_186));
    i__352 = temper.int32_add(i__352, 1);
  end
  temper.listbuilder_add(builder__351, newSnake__350);
  t_187 = temper.listbuilder_tolist(builder__351);
  allSegs__353 = collectAllSegments__96(t_187);
  t_188 = game__340.width;
  t_189 = game__340.height;
  foodResult__354 = placeFood__93(allSegs__353, t_188, t_189, seed__341);
  return MultiSnakeGame(game__340.width, game__340.height, temper.listbuilder_tolist(builder__351), foodResult__354.point, foodResult__354.seed, game__340.tickCount);
end;
removePlayer = function(game__355, playerId__356)
  local t_190, t_191, t_192, builder__358, i__359;
  builder__358 = temper.listbuilder_constructor();
  i__359 = 0;
  while true do
    local snake__360;
    t_190 = temper.list_length(game__355.snakes);
    if not (i__359 < t_190) then
      break;
    end
    t_191 = game__355.snakes;
    t_192 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__360 = temper.listed_getor(t_191, i__359, t_192);
    if (snake__360.id ~= playerId__356) then
      temper.listbuilder_add(builder__358, snake__360);
    end
    i__359 = temper.int32_add(i__359, 1);
  end
  return MultiSnakeGame(game__355.width, game__355.height, temper.listbuilder_tolist(builder__358), game__355.food, game__355.rngSeed, game__355.tickCount);
end;
playerHeadChar = function(id__373)
  local return__88;
  if (id__373 == 0) then
    return__88 = '@';
  elseif (id__373 == 1) then
    return__88 = '#';
  elseif (id__373 == 2) then
    return__88 = '$';
  elseif (id__373 == 3) then
    return__88 = '%';
  else
    return__88 = '&';
  end
  return return__88;
end;
playerBodyChar = function(id__375)
  local return__89;
  if (id__375 == 0) then
    return__89 = 'o';
  elseif (id__375 == 1) then
    return__89 = '+';
  elseif (id__375 == 2) then
    return__89 = '~';
  elseif (id__375 == 3) then
    return__89 = '=';
  else
    return__89 = '.';
  end
  return return__89;
end;
multiCellChar__97 = function(game__377, p__378)
  local return__90, t_193, t_194, t_195, t_196, t_197, t_198, t_199, t_200, t_201, t_202, t_203, t_204, t_205, i__380, i__383;
  ::continue_9::i__380 = 0;
  while true do
    local snake__381;
    t_193 = temper.list_length(game__377.snakes);
    if not (i__380 < t_193) then
      break;
    end
    t_194 = game__377.snakes;
    t_195 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__381 = temper.listed_getor(t_194, i__380, t_195);
    if (temper.list_length(snake__381.segments) > 0) then
      local head__382;
      head__382 = temper.listed_getor(snake__381.segments, 0, Point(-1, -1));
      if pointEquals(p__378, head__382) then
        t_196 = snake__381.id;
        return__90 = playerHeadChar(t_196);
        goto break_8;
      end
    end
    i__380 = temper.int32_add(i__380, 1);
  end
  i__383 = 0;
  while true do
    local snake__384, j__385;
    t_197 = temper.list_length(game__377.snakes);
    if not (i__383 < t_197) then
      break;
    end
    t_198 = game__377.snakes;
    t_199 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__384 = temper.listed_getor(t_198, i__383, t_199);
    j__385 = 1;
    while true do
      t_200 = temper.list_length(snake__384.segments);
      if not (j__385 < t_200) then
        break;
      end
      t_201 = snake__384.segments;
      t_202 = Point(-1, -1);
      t_203 = temper.listed_getor(t_201, j__385, t_202);
      if pointEquals(p__378, t_203) then
        t_204 = snake__384.id;
        return__90 = playerBodyChar(t_204);
        goto break_8;
      end
      j__385 = temper.int32_add(j__385, 1);
    end
    i__383 = temper.int32_add(i__383, 1);
  end
  t_205 = game__377.food;
  if pointEquals(p__378, t_205) then
    return__90 = '*';
    goto break_8;
  end
  return__90 = ' ';
  ::break_8::return return__90;
end;
multiRender = function(game__361)
  local t_206, t_207, t_208, t_209, t_210, t_211, t_212, t_213, t_214, sb__363, x__364, y__365, x__368, i__369;
  sb__363 = temper.stringbuilder_constructor();
  temper.stringbuilder_append(sb__363, '\x1b[2J\x1b[H');
  temper.stringbuilder_append(sb__363, '#');
  x__364 = 0;
  while true do
    t_206 = game__361.width;
    if not (x__364 < t_206) then
      break;
    end
    temper.stringbuilder_append(sb__363, '#');
    x__364 = temper.int32_add(x__364, 1);
  end
  temper.stringbuilder_append(sb__363, '#\r\n');
  y__365 = 0;
  while true do
    local x__366;
    t_207 = game__361.height;
    if not (y__365 < t_207) then
      break;
    end
    temper.stringbuilder_append(sb__363, '#');
    x__366 = 0;
    while true do
      local p__367;
      t_208 = game__361.width;
      if not (x__366 < t_208) then
        break;
      end
      p__367 = Point(x__366, y__365);
      temper.stringbuilder_append(sb__363, multiCellChar__97(game__361, p__367));
      x__366 = temper.int32_add(x__366, 1);
    end
    temper.stringbuilder_append(sb__363, '#\r\n');
    y__365 = temper.int32_add(y__365, 1);
  end
  temper.stringbuilder_append(sb__363, '#');
  x__368 = 0;
  while true do
    t_209 = game__361.width;
    if not (x__368 < t_209) then
      break;
    end
    temper.stringbuilder_append(sb__363, '#');
    x__368 = temper.int32_add(x__368, 1);
  end
  temper.stringbuilder_append(sb__363, '#\r\n');
  i__369 = 0;
  while true do
    local snake__370, statusText__371, symbol__372;
    t_210 = temper.list_length(game__361.snakes);
    if not (i__369 < t_210) then
      break;
    end
    t_211 = game__361.snakes;
    t_212 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
    snake__370 = temper.listed_getor(t_211, i__369, t_212);
    t_213 = snake__370.status;
    if temper.instance_of(t_213, Alive) then
      t_214 = 'Playing';
    elseif temper.instance_of(t_213, Dead) then
      t_214 = 'DEAD';
    else
      t_214 = '';
    end
    statusText__371 = t_214;
    symbol__372 = playerHeadChar(snake__370.id);
    temper.stringbuilder_append(sb__363, temper.concat('P', temper.int32_tostring(snake__370.id), ' ', symbol__372, ': ', temper.int32_tostring(snake__370.score), '  ', statusText__371, '\r', '\n'));
    i__369 = temper.int32_add(i__369, 1);
  end
  return temper.stringbuilder_tostring(sb__363);
end;
directionToString = function(dir__386)
  local return__91;
  if temper.instance_of(dir__386, Up) then
    return__91 = 'up';
  elseif temper.instance_of(dir__386, Down) then
    return__91 = 'down';
  elseif temper.instance_of(dir__386, Left) then
    return__91 = 'left';
  elseif temper.instance_of(dir__386, Right) then
    return__91 = 'right';
  else
    return__91 = 'right';
  end
  return return__91;
end;
stringToDirection = function(s__388)
  local return__92;
  ::continue_11::
  if temper.str_eq(s__388, 'up') then
    return__92 = Up();
    goto break_10;
  end
  if temper.str_eq(s__388, 'down') then
    return__92 = Down();
    goto break_10;
  end
  if temper.str_eq(s__388, 'left') then
    return__92 = Left();
    goto break_10;
  end
  if temper.str_eq(s__388, 'right') then
    return__92 = Right();
    goto break_10;
  end
  return__92 = temper.null;
  ::break_10::return return__92;
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
