local temper = require('temper-core');
local Direction, Up, Down, Left, Right, Point, GameStatus, Playing, GameOver, RandomResult, SnakeGame, FoodPlacement__9, move, pointEquals, isOpposite, directionDelta, nextRandom, placeFood__42, newGame, changeDirection, tick, cellChar__43, render, exports;
Direction = temper.type('Direction');
Up = temper.type('Up', Direction);
Up.constructor = function(this__11)
  return nil;
end;
Down = temper.type('Down', Direction);
Down.constructor = function(this__13)
  return nil;
end;
Left = temper.type('Left', Direction);
Left.constructor = function(this__15)
  return nil;
end;
Right = temper.type('Right', Direction);
Right.constructor = function(this__17)
  return nil;
end;
Point = temper.type('Point');
Point.constructor = function(this__19, x__57, y__58)
  this__19.x__54 = x__57;
  this__19.y__55 = y__58;
  return nil;
end;
Point.get.x = function(this__176)
  return this__176.x__54;
end;
Point.get.y = function(this__179)
  return this__179.y__55;
end;
GameStatus = temper.type('GameStatus');
Playing = temper.type('Playing', GameStatus);
Playing.constructor = function(this__21)
  return nil;
end;
GameOver = temper.type('GameOver', GameStatus);
GameOver.constructor = function(this__23)
  return nil;
end;
RandomResult = temper.type('RandomResult');
RandomResult.constructor = function(this__28, value__72, nextSeed__73)
  this__28.value__69 = value__72;
  this__28.nextSeed__70 = nextSeed__73;
  return nil;
end;
RandomResult.get.value = function(this__190)
  return this__190.value__69;
end;
RandomResult.get.nextSeed = function(this__193)
  return this__193.nextSeed__70;
end;
SnakeGame = temper.type('SnakeGame');
SnakeGame.constructor = function(this__31, width__90, height__91, snake__92, direction__93, food__94, score__95, status__96, rngSeed__97)
  this__31.width__81 = width__90;
  this__31.height__82 = height__91;
  this__31.snake__83 = snake__92;
  this__31.direction__84 = direction__93;
  this__31.food__85 = food__94;
  this__31.score__86 = score__95;
  this__31.status__87 = status__96;
  this__31.rngSeed__88 = rngSeed__97;
  return nil;
end;
SnakeGame.get.width = function(this__196)
  return this__196.width__81;
end;
SnakeGame.get.height = function(this__199)
  return this__199.height__82;
end;
SnakeGame.get.snake = function(this__202)
  return this__202.snake__83;
end;
SnakeGame.get.direction = function(this__205)
  return this__205.direction__84;
end;
SnakeGame.get.food = function(this__208)
  return this__208.food__85;
end;
SnakeGame.get.score = function(this__211)
  return this__211.score__86;
end;
SnakeGame.get.status = function(this__214)
  return this__214.status__87;
end;
SnakeGame.get.rngSeed = function(this__217)
  return this__217.rngSeed__88;
end;
FoodPlacement__9 = temper.type('FoodPlacement__9');
FoodPlacement__9.constructor = function(this__34, point__101, seed__102)
  this__34.point__98 = point__101;
  this__34.seed__99 = seed__102;
  return nil;
end;
FoodPlacement__9.get.point = function(this__220)
  return this__220.point__98;
end;
FoodPlacement__9.get.seed = function(this__223)
  return this__223.seed__99;
end;
move = function(head__44, body__45, food__46, width__47, height__48)
  return Right();
end;
pointEquals = function(a__61, b__62)
  local return__25, t_0, t_1;
  if (a__61.x == b__62.x) then
    t_0 = a__61.y;
    t_1 = b__62.y;
    return__25 = (t_0 == t_1);
  else
    return__25 = false;
  end
  return return__25;
end;
isOpposite = function(a__64, b__65)
  local return__26;
  if temper.instance_of(a__64, Up) then
    return__26 = temper.instance_of(b__65, Down);
  elseif temper.instance_of(a__64, Down) then
    return__26 = temper.instance_of(b__65, Up);
  elseif temper.instance_of(a__64, Left) then
    return__26 = temper.instance_of(b__65, Right);
  elseif temper.instance_of(a__64, Right) then
    return__26 = temper.instance_of(b__65, Left);
  else
    return__26 = false;
  end
  return return__26;
end;
directionDelta = function(dir__67)
  local return__27;
  if temper.instance_of(dir__67, Up) then
    return__27 = Point(0, -1);
  elseif temper.instance_of(dir__67, Down) then
    return__27 = Point(0, 1);
  elseif temper.instance_of(dir__67, Left) then
    return__27 = Point(-1, 0);
  elseif temper.instance_of(dir__67, Right) then
    return__27 = Point(1, 0);
  else
    return__27 = Point(0, 0);
  end
  return return__27;
end;
nextRandom = function(seed__74, max__75)
  local t_2, t_3, raw__77, masked__78, posVal__79, value__80;
  raw__77 = temper.int32_add(temper.int32_mul(seed__74, 1664525), 1013904223);
  masked__78 = temper.band(raw__77, 2147483647);
  if (masked__78 < 0) then
    posVal__79 = temper.int32_unm(masked__78);
  else
    posVal__79 = masked__78;
  end
  value__80 = 0;
  if (max__75 > 0) then
    local local_4, local_5, local_6;
    local_4, local_5, local_6 = temper.pcall(function()
      t_2 = temper.int32_mod(posVal__79, max__75);
      t_3 = t_2;
    end);
    if local_4 then
    else
      t_3 = 0;
    end
    value__80 = t_3;
  end
  return RandomResult(value__80, masked__78);
end;
placeFood__42 = function(snake__103, width__104, height__105, seed__106)
  local return__36, t_8, t_9, t_10, t_11, t_12, t_13, totalCells__108, currentSeed__109, attempt__110, y__117;
  ::continue_1::totalCells__108 = temper.int32_mul(width__104, height__105);
  currentSeed__109 = seed__106;
  attempt__110 = 0;
  while (attempt__110 < totalCells__108) do
    local result__111, px__112, py__113, candidate__114, occupied__115, fn__910;
    result__111 = nextRandom(currentSeed__109, totalCells__108);
    t_8 = result__111.nextSeed;
    currentSeed__109 = t_8;
    px__112 = 0;
    py__113 = 0;
    if (width__104 > 0) then
      local local_14, local_15, local_16, local_18, local_19, local_20;
      local_14, local_15, local_16 = temper.pcall(function()
        t_10 = temper.int32_mod(result__111.value, width__104);
        t_11 = t_10;
      end);
      if local_14 then
      else
        t_11 = 0;
      end
      px__112 = t_11;
      local_18, local_19, local_20 = temper.pcall(function()
        t_12 = temper.int32_div(result__111.value, width__104);
        t_13 = t_12;
      end);
      if local_18 then
      else
        t_13 = 0;
      end
      py__113 = t_13;
    end
    candidate__114 = Point(px__112, py__113);
    occupied__115 = false;
    fn__910 = function(seg__116)
      if pointEquals(seg__116, candidate__114) then
        occupied__115 = true;
      end
      return nil;
    end;
    temper.list_foreach(snake__103, fn__910);
    if not occupied__115 then
      return__36 = FoodPlacement__9(candidate__114, currentSeed__109);
      goto break_0;
    end
    attempt__110 = temper.int32_add(attempt__110, 1);
  end
  y__117 = 0;
  while (y__117 < height__105) do
    local x__118;
    x__118 = 0;
    while (x__118 < width__104) do
      local candidate__119, free__120, fn__909;
      candidate__119 = Point(x__118, y__117);
      free__120 = true;
      fn__909 = function(seg__121)
        if pointEquals(seg__121, candidate__119) then
          free__120 = false;
        end
        return nil;
      end;
      temper.list_foreach(snake__103, fn__909);
      if free__120 then
        return__36 = FoodPlacement__9(candidate__119, currentSeed__109);
        goto break_0;
      end
      x__118 = temper.int32_add(x__118, 1);
    end
    y__117 = temper.int32_add(y__117, 1);
  end
  t_9 = Point(0, 0);
  return__36 = FoodPlacement__9(t_9, currentSeed__109);
  ::break_0::return return__36;
end;
newGame = function(width__122, height__123, seed__124)
  local t_22, t_23, t_24, t_25, centerX__126, centerY__127, snake__128, foodResult__129, t_26, t_27, t_28, t_29;
  centerX__126 = 0;
  centerY__127 = 0;
  if (width__122 > 0) then
    t_22 = temper.int32_div(width__122, 2);
    t_23 = t_22;
    centerX__126 = t_23;
  end
  if (height__123 > 0) then
    t_24 = temper.int32_div(height__123, 2);
    t_25 = t_24;
    centerY__127 = t_25;
  end
  snake__128 = temper.listof(Point(centerX__126, centerY__127), Point(temper.int32_sub(centerX__126, 1), centerY__127), Point(temper.int32_sub(centerX__126, 2), centerY__127));
  foodResult__129 = placeFood__42(snake__128, width__122, height__123, seed__124);
  t_26 = Right();
  t_27 = foodResult__129.point;
  t_28 = Playing();
  t_29 = foodResult__129.seed;
  return SnakeGame(width__122, height__123, snake__128, t_26, t_27, 0, t_28, t_29);
end;
changeDirection = function(game__130, dir__131)
  local return__38, t_30, t_31, t_32, t_33, t_34, t_35, t_36;
  if isOpposite(game__130.direction, dir__131) then
    return__38 = game__130;
  else
    t_30 = game__130.width;
    t_31 = game__130.height;
    t_32 = game__130.snake;
    t_33 = game__130.food;
    t_34 = game__130.score;
    t_35 = game__130.status;
    t_36 = game__130.rngSeed;
    return__38 = SnakeGame(t_30, t_31, t_32, dir__131, t_33, t_34, t_35, t_36);
  end
  return return__38;
end;
tick = function(game__133)
  local return__39, t_37, t_38, t_39, t_40, t_41, t_42, t_43, t_44, t_45, t_46, t_47, t_48, t_49, t_50, t_51, t_52, t_53, t_54, t_55, t_56, t_57, t_58, t_59, t_60, t_61, t_62, t_63, t_64, t_65, t_66, t_67, t_68, t_69, t_70, t_71, t_72, t_73, t_74, t_75, t_76, t_77, t_78, t_79, t_80, t_81, delta__135, head__136, newHead__137, eating__138, checkLength__139, i__140, newSnakeBuilder__141, keepLength__142, i__143, newSnake__144;
  ::continue_3::
  if temper.instance_of(game__133.status, GameOver) then
    return__39 = game__133;
    goto break_2;
  end
  delta__135 = directionDelta(game__133.direction);
  head__136 = temper.listed_getor(game__133.snake, 0, Point(0, 0));
  newHead__137 = Point(temper.int32_add(head__136.x, delta__135.x), temper.int32_add(head__136.y, delta__135.y));
  if (newHead__137.x < 0) then
    t_81 = true;
  else
    if (newHead__137.x >= game__133.width) then
      t_80 = true;
    else
      if (newHead__137.y < 0) then
        t_79 = true;
      else
        t_37 = newHead__137.y;
        t_38 = game__133.height;
        t_79 = (t_37 >= t_38);
      end
      t_80 = t_79;
    end
    t_81 = t_80;
  end
  if t_81 then
    t_39 = game__133.width;
    t_40 = game__133.height;
    t_41 = game__133.snake;
    t_42 = game__133.direction;
    t_43 = game__133.food;
    t_44 = game__133.score;
    t_45 = GameOver();
    t_46 = game__133.rngSeed;
    return__39 = SnakeGame(t_39, t_40, t_41, t_42, t_43, t_44, t_45, t_46);
    goto break_2;
  end
  eating__138 = pointEquals(newHead__137, game__133.food);
  if eating__138 then
    t_47 = temper.list_length(game__133.snake);
    checkLength__139 = t_47;
  else
    t_48 = temper.list_length(game__133.snake);
    checkLength__139 = temper.int32_sub(t_48, 1);
  end
  i__140 = 0;
  while (i__140 < checkLength__139) do
    t_49 = game__133.snake;
    t_50 = Point(-1, -1);
    if pointEquals(newHead__137, temper.listed_getor(t_49, i__140, t_50)) then
      t_51 = game__133.width;
      t_52 = game__133.height;
      t_53 = game__133.snake;
      t_54 = game__133.direction;
      t_55 = game__133.food;
      t_56 = game__133.score;
      t_57 = GameOver();
      t_58 = game__133.rngSeed;
      return__39 = SnakeGame(t_51, t_52, t_53, t_54, t_55, t_56, t_57, t_58);
      goto break_2;
    end
    i__140 = temper.int32_add(i__140, 1);
  end
  newSnakeBuilder__141 = temper.listbuilder_constructor();
  temper.listbuilder_add(newSnakeBuilder__141, newHead__137);
  if eating__138 then
    t_59 = temper.list_length(game__133.snake);
    keepLength__142 = t_59;
  else
    t_60 = temper.list_length(game__133.snake);
    keepLength__142 = temper.int32_sub(t_60, 1);
  end
  i__143 = 0;
  while (i__143 < keepLength__142) do
    t_61 = game__133.snake;
    t_62 = Point(0, 0);
    temper.listbuilder_add(newSnakeBuilder__141, temper.listed_getor(t_61, i__143, t_62));
    i__143 = temper.int32_add(i__143, 1);
  end
  newSnake__144 = temper.listbuilder_tolist(newSnakeBuilder__141);
  if eating__138 then
    local newScore__145, foodResult__146;
    newScore__145 = temper.int32_add(game__133.score, 1);
    t_63 = game__133.width;
    t_64 = game__133.height;
    t_65 = game__133.rngSeed;
    foodResult__146 = placeFood__42(newSnake__144, t_63, t_64, t_65);
    t_66 = game__133.width;
    t_67 = game__133.height;
    t_68 = game__133.direction;
    t_69 = foodResult__146.point;
    t_70 = Playing();
    t_71 = foodResult__146.seed;
    return__39 = SnakeGame(t_66, t_67, newSnake__144, t_68, t_69, newScore__145, t_70, t_71);
  else
    t_72 = game__133.width;
    t_73 = game__133.height;
    t_74 = game__133.direction;
    t_75 = game__133.food;
    t_76 = game__133.score;
    t_77 = game__133.status;
    t_78 = game__133.rngSeed;
    return__39 = SnakeGame(t_72, t_73, newSnake__144, t_74, t_75, t_76, t_77, t_78);
  end
  ::break_2::return return__39;
end;
cellChar__43 = function(game__156, p__157)
  local return__41, t_82, t_83, t_84, t_85, t_86, head__159, i__160;
  ::continue_5::head__159 = temper.listed_getor(game__156.snake, 0, Point(-1, -1));
  if pointEquals(p__157, head__159) then
    return__41 = '@';
    goto break_4;
  end
  i__160 = 1;
  while true do
    t_82 = temper.list_length(game__156.snake);
    if not (i__160 < t_82) then
      break;
    end
    t_83 = game__156.snake;
    t_84 = Point(-1, -1);
    t_85 = temper.listed_getor(t_83, i__160, t_84);
    if pointEquals(p__157, t_85) then
      return__41 = 'o';
      goto break_4;
    end
    i__160 = temper.int32_add(i__160, 1);
  end
  t_86 = game__156.food;
  if pointEquals(p__157, t_86) then
    return__41 = '*';
    goto break_4;
  end
  return__41 = ' ';
  ::break_4::return return__41;
end;
render = function(game__147)
  local t_87, t_88, t_89, t_90, sb__149, x__150, y__151, x__154, statusText__155, t_91;
  sb__149 = temper.stringbuilder_constructor();
  temper.stringbuilder_append(sb__149, '\x1b[2J\x1b[H');
  temper.stringbuilder_append(sb__149, '#');
  x__150 = 0;
  while true do
    t_87 = game__147.width;
    if not (x__150 < t_87) then
      break;
    end
    temper.stringbuilder_append(sb__149, '#');
    x__150 = temper.int32_add(x__150, 1);
  end
  temper.stringbuilder_append(sb__149, '#\n');
  y__151 = 0;
  while true do
    local x__152;
    t_88 = game__147.height;
    if not (y__151 < t_88) then
      break;
    end
    temper.stringbuilder_append(sb__149, '#');
    x__152 = 0;
    while true do
      local p__153;
      t_89 = game__147.width;
      if not (x__152 < t_89) then
        break;
      end
      p__153 = Point(x__152, y__151);
      temper.stringbuilder_append(sb__149, cellChar__43(game__147, p__153));
      x__152 = temper.int32_add(x__152, 1);
    end
    temper.stringbuilder_append(sb__149, '#\n');
    y__151 = temper.int32_add(y__151, 1);
  end
  temper.stringbuilder_append(sb__149, '#');
  x__154 = 0;
  while true do
    t_90 = game__147.width;
    if not (x__154 < t_90) then
      break;
    end
    temper.stringbuilder_append(sb__149, '#');
    x__154 = temper.int32_add(x__154, 1);
  end
  temper.stringbuilder_append(sb__149, '#\n');
  t_91 = game__147.status;
  if temper.instance_of(t_91, Playing) then
    statusText__155 = 'Playing';
  elseif temper.instance_of(t_91, GameOver) then
    statusText__155 = 'GAME OVER';
  else
    statusText__155 = '';
  end
  temper.stringbuilder_append(sb__149, temper.concat('Score: ', temper.int32_tostring(game__147.score), '  ', statusText__155, '\n'));
  return temper.stringbuilder_tostring(sb__149);
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
exports.move = move;
exports.pointEquals = pointEquals;
exports.isOpposite = isOpposite;
exports.directionDelta = directionDelta;
exports.nextRandom = nextRandom;
exports.newGame = newGame;
exports.changeDirection = changeDirection;
exports.tick = tick;
exports.render = render;
return exports;
