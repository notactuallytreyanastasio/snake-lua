local temper = require('temper-core');
local pointEquals, isOpposite, directionDelta, nextRandom, newGame, changeDirection, tick, newMultiGame, multiTick, multiRender, changePlayerDirection, isMultiGameOver, addPlayer, removePlayer, directionToString, stringToDirection, Point, Playing, Right, Down, Up, Left, GameOver, SnakeGame, PlayerSnake, Dead, Alive, local_93, local_94, exports;
pointEquals = temper.import('snake', 'pointEquals');
isOpposite = temper.import('snake', 'isOpposite');
directionDelta = temper.import('snake', 'directionDelta');
nextRandom = temper.import('snake', 'nextRandom');
newGame = temper.import('snake', 'newGame');
changeDirection = temper.import('snake', 'changeDirection');
tick = temper.import('snake', 'tick');
newMultiGame = temper.import('snake', 'newMultiGame');
multiTick = temper.import('snake', 'multiTick');
multiRender = temper.import('snake', 'multiRender');
changePlayerDirection = temper.import('snake', 'changePlayerDirection');
isMultiGameOver = temper.import('snake', 'isMultiGameOver');
addPlayer = temper.import('snake', 'addPlayer');
removePlayer = temper.import('snake', 'removePlayer');
directionToString = temper.import('snake', 'directionToString');
stringToDirection = temper.import('snake', 'stringToDirection');
Point = temper.import('snake', 'Point');
Playing = temper.import('snake', 'Playing');
Right = temper.import('snake', 'Right');
Down = temper.import('snake', 'Down');
Up = temper.import('snake', 'Up');
Left = temper.import('snake', 'Left');
GameOver = temper.import('snake', 'GameOver');
SnakeGame = temper.import('snake', 'SnakeGame');
PlayerSnake = temper.import('snake', 'PlayerSnake');
Dead = temper.import('snake', 'Dead');
Alive = temper.import('snake', 'Alive');
local_93 = (unpack or table.unpack);
local_94 = require('luaunit');
local_94.FAILURE_PREFIX = temper.test_failure_prefix;
Test_ = {};
Test_.test_initialStateHasSnakeNearCenter__170 = function()
  temper.test('initial state has snake near center', function(test_0)
    local game__65, head__66, t_1, fn__1562, t_2, fn__1561, t_3, fn__1560;
    game__65 = newGame(10, 10, 42);
    head__66 = temper.listed_getor(game__65.snake, 0, Point(-1, -1));
    t_1 = (head__66.x == 5);
    fn__1562 = function()
      return temper.concat('head x should be 5, got ', temper.int32_tostring(head__66.x));
    end;
    temper.test_assert(test_0, t_1, fn__1562);
    t_2 = (head__66.y == 5);
    fn__1561 = function()
      return temper.concat('head y should be 5, got ', temper.int32_tostring(head__66.y));
    end;
    temper.test_assert(test_0, t_2, fn__1561);
    t_3 = (temper.list_length(game__65.snake) == 3);
    fn__1560 = function()
      return 'snake should start with 3 segments';
    end;
    temper.test_assert(test_0, t_3, fn__1560);
    return nil;
  end);
end;
Test_.test_initialStatusIsPlaying__171 = function()
  temper.test('initial status is Playing', function(test_4)
    local game__68, t_5, fn__1550;
    game__68 = newGame(10, 10, 42);
    t_5 = temper.instance_of(game__68.status, Playing);
    fn__1550 = function()
      return 'initial status should be Playing';
    end;
    temper.test_assert(test_4, t_5, fn__1550);
    return nil;
  end);
end;
Test_.test_initialDirectionIsRight__172 = function()
  temper.test('initial direction is Right', function(test_6)
    local game__70, t_7, fn__1544;
    game__70 = newGame(10, 10, 42);
    t_7 = temper.instance_of(game__70.direction, Right);
    fn__1544 = function()
      return 'initial direction should be Right';
    end;
    temper.test_assert(test_6, t_7, fn__1544);
    return nil;
  end);
end;
Test_.test_initialScoreIs0__173 = function()
  temper.test('initial score is 0', function(test_8)
    local game__72, t_9, fn__1538;
    game__72 = newGame(10, 10, 42);
    t_9 = (game__72.score == 0);
    fn__1538 = function()
      return 'initial score should be 0';
    end;
    temper.test_assert(test_8, t_9, fn__1538);
    return nil;
  end);
end;
Test_.test_snakeMovesRight__174 = function()
  temper.test('snake moves right', function(test_10)
    local game__74, moved__75, head__76, t_11, fn__1524, t_12, fn__1523;
    game__74 = newGame(10, 10, 42);
    moved__75 = tick(game__74);
    head__76 = temper.listed_getor(moved__75.snake, 0, Point(-1, -1));
    t_11 = (head__76.x == 6);
    fn__1524 = function()
      return temper.concat('head should move right to x=6, got ', temper.int32_tostring(head__76.x));
    end;
    temper.test_assert(test_10, t_11, fn__1524);
    t_12 = (head__76.y == 5);
    fn__1523 = function()
      return temper.concat('head y should stay 5, got ', temper.int32_tostring(head__76.y));
    end;
    temper.test_assert(test_10, t_12, fn__1523);
    return nil;
  end);
end;
Test_.test_snakeMovesDown__175 = function()
  temper.test('snake moves down', function(test_13)
    local game__78, moved__79, head__80, t_14, fn__1504, t_15, fn__1503;
    game__78 = changeDirection(newGame(10, 10, 42), Down());
    moved__79 = tick(game__78);
    head__80 = temper.listed_getor(moved__79.snake, 0, Point(-1, -1));
    t_14 = (head__80.x == 5);
    fn__1504 = function()
      return temper.concat('head x should stay 5, got ', temper.int32_tostring(head__80.x));
    end;
    temper.test_assert(test_13, t_14, fn__1504);
    t_15 = (head__80.y == 6);
    fn__1503 = function()
      return temper.concat('head should move down to y=6, got ', temper.int32_tostring(head__80.y));
    end;
    temper.test_assert(test_13, t_15, fn__1503);
    return nil;
  end);
end;
Test_.test_snakeMovesUp__176 = function()
  temper.test('snake moves up', function(test_16)
    local game__82, moved__83, head__84, t_17, fn__1488;
    game__82 = changeDirection(newGame(10, 10, 42), Up());
    moved__83 = tick(game__82);
    head__84 = temper.listed_getor(moved__83.snake, 0, Point(-1, -1));
    t_17 = (head__84.y == 4);
    fn__1488 = function()
      return temper.concat('head should move up to y=4, got ', temper.int32_tostring(head__84.y));
    end;
    temper.test_assert(test_16, t_17, fn__1488);
    return nil;
  end);
end;
Test_.test_oppositeDirectionIsRejected__177 = function()
  temper.test('opposite direction is rejected', function(test_18)
    local game__86, changed__87, t_19, fn__1479;
    game__86 = newGame(10, 10, 42);
    changed__87 = changeDirection(game__86, Left());
    t_19 = temper.instance_of(changed__87.direction, Right);
    fn__1479 = function()
      return 'should still be Right after trying Left';
    end;
    temper.test_assert(test_18, t_19, fn__1479);
    return nil;
  end);
end;
Test_.test_nonOppositeDirectionIsAccepted__178 = function()
  temper.test('non-opposite direction is accepted', function(test_20)
    local game__89, changed__90, t_21, fn__1472;
    game__89 = newGame(10, 10, 42);
    changed__90 = changeDirection(game__89, Up());
    t_21 = temper.instance_of(changed__90.direction, Up);
    fn__1472 = function()
      return 'should change to Up';
    end;
    temper.test_assert(test_20, t_21, fn__1472);
    return nil;
  end);
end;
Test_.test_wallCollisionCausesGameOver__179 = function()
  temper.test('wall collision causes game over', function(test_22)
    local t_23, t_24, game__92, i__93, t_25, fn__1465;
    t_24 = newGame(10, 10, 42);
    game__92 = t_24;
    i__93 = 0;
    while (i__93 < 10) do
      t_23 = tick(game__92);
      game__92 = t_23;
      i__93 = temper.int32_add(i__93, 1);
    end
    t_25 = temper.instance_of(game__92.status, GameOver);
    fn__1465 = function()
      return 'should be GameOver after hitting wall';
    end;
    temper.test_assert(test_22, t_25, fn__1465);
    return nil;
  end);
end;
Test_.test_selfCollisionCausesGameOver__180 = function()
  temper.test('self collision causes game over', function(test_26)
    local snake__95, t_27, game__96, t_28, t_29, fn__1448;
    snake__95 = temper.listof(Point(5, 5), Point(6, 5), Point(6, 4), Point(5, 4), Point(4, 4), Point(4, 5), Point(4, 6));
    t_27 = SnakeGame(10, 10, snake__95, Left(), Point(0, 0), 0, Playing(), 42);
    game__96 = t_27;
    t_28 = tick(game__96);
    game__96 = t_28;
    t_29 = temper.instance_of(game__96.status, GameOver);
    fn__1448 = function()
      return 'should be GameOver after self collision';
    end;
    temper.test_assert(test_26, t_29, fn__1448);
    return nil;
  end);
end;
Test_.test_pointEqualsWorksForSamePoints__181 = function()
  temper.test('pointEquals works for same points', function(test_30)
    local t_31, fn__1442;
    t_31 = pointEquals(Point(3, 4), Point(3, 4));
    fn__1442 = function()
      return 'same points should be equal';
    end;
    temper.test_assert(test_30, t_31, fn__1442);
    return nil;
  end);
end;
Test_.test_pointEqualsWorksForDifferentPoints__182 = function()
  temper.test('pointEquals works for different points', function(test_32)
    local t_33, fn__1436;
    t_33 = not pointEquals(Point(3, 4), Point(5, 6));
    fn__1436 = function()
      return 'different points should not be equal';
    end;
    temper.test_assert(test_32, t_33, fn__1436);
    return nil;
  end);
end;
Test_.test_isOppositeDetectsOppositeDirections__183 = function()
  temper.test('isOpposite detects opposite directions', function(test_34)
    local t_35, fn__1420, t_36, fn__1419, t_37, fn__1418;
    t_35 = isOpposite(Up(), Down());
    fn__1420 = function()
      return 'Up/Down are opposite';
    end;
    temper.test_assert(test_34, t_35, fn__1420);
    t_36 = isOpposite(Left(), Right());
    fn__1419 = function()
      return 'Left/Right are opposite';
    end;
    temper.test_assert(test_34, t_36, fn__1419);
    t_37 = not isOpposite(Up(), Left());
    fn__1418 = function()
      return 'Up/Left are not opposite';
    end;
    temper.test_assert(test_34, t_37, fn__1418);
    return nil;
  end);
end;
Test_.test_directionDeltaReturnsCorrectDeltas__184 = function()
  temper.test('directionDelta returns correct deltas', function(test_38)
    local t_39, t_40, t_41, t_42, up__101, fn__1407, right__102, fn__1406;
    up__101 = directionDelta(Up());
    if (up__101.x == 0) then
      t_39 = up__101.y;
      t_41 = (t_39 == -1);
    else
      t_41 = false;
    end
    fn__1407 = function()
      return 'Up should be (0, -1)';
    end;
    temper.test_assert(test_38, t_41, fn__1407);
    right__102 = directionDelta(Right());
    if (right__102.x == 1) then
      t_40 = right__102.y;
      t_42 = (t_40 == 0);
    else
      t_42 = false;
    end
    fn__1406 = function()
      return 'Right should be (1, 0)';
    end;
    temper.test_assert(test_38, t_42, fn__1406);
    return nil;
  end);
end;
Test_.test_prngIsDeterministic__185 = function()
  temper.test('PRNG is deterministic', function(test_43)
    local r1__104, r2__105, t_44, fn__1395, t_45, fn__1394;
    r1__104 = nextRandom(42, 100);
    r2__105 = nextRandom(42, 100);
    t_44 = (r1__104.value == r2__105.value);
    fn__1395 = function()
      return 'same seed should produce same value';
    end;
    temper.test_assert(test_43, t_44, fn__1395);
    t_45 = (r1__104.nextSeed == r2__105.nextSeed);
    fn__1394 = function()
      return 'same seed should produce same next seed';
    end;
    temper.test_assert(test_43, t_45, fn__1394);
    return nil;
  end);
end;
Test_.test_prngProducesValuesInRange__186 = function()
  temper.test('PRNG produces values in range', function(test_46)
    local t_47, t_48, r__107, fn__1389;
    r__107 = nextRandom(42, 10);
    if (r__107.value >= 0) then
      t_47 = r__107.value;
      t_48 = (t_47 < 10);
    else
      t_48 = false;
    end
    fn__1389 = function()
      return temper.concat('value should be in [0, 10), got ', temper.int32_tostring(r__107.value));
    end;
    temper.test_assert(test_46, t_48, fn__1389);
    return nil;
  end);
end;
Test_.test_tickDoesNothingWhenGameIsOver__187 = function()
  temper.test('tick does nothing when game is over', function(test_49)
    local t_50, t_51, game__109, i__110, t_52, fn__1370, head1__111, t_53, head2__112, t_54, fn__1369;
    t_51 = newGame(10, 10, 42);
    game__109 = t_51;
    i__110 = 0;
    while (i__110 < 10) do
      t_50 = tick(game__109);
      game__109 = t_50;
      i__110 = temper.int32_add(i__110, 1);
    end
    t_52 = temper.instance_of(game__109.status, GameOver);
    fn__1370 = function()
      return 'should be GameOver';
    end;
    temper.test_assert(test_49, t_52, fn__1370);
    head1__111 = temper.listed_getor(game__109.snake, 0, Point(-1, -1));
    t_53 = tick(game__109);
    game__109 = t_53;
    head2__112 = temper.listed_getor(game__109.snake, 0, Point(-1, -1));
    t_54 = pointEquals(head1__111, head2__112);
    fn__1369 = function()
      return 'snake should not move after game over';
    end;
    temper.test_assert(test_49, t_54, fn__1369);
    return nil;
  end);
end;
Test_.test_multiGameCreatesCorrectNumberOfSnakes__188 = function()
  temper.test('multi game creates correct number of snakes', function(test_55)
    local game__114, t_56, fn__1362;
    game__114 = newMultiGame(20, 10, 2, 42);
    t_56 = (temper.list_length(game__114.snakes) == 2);
    fn__1362 = function()
      return 'should have 2 snakes';
    end;
    temper.test_assert(test_55, t_56, fn__1362);
    return nil;
  end);
end;
Test_.test_multiGameSnakesStartAlive__189 = function()
  temper.test('multi game snakes start alive', function(test_57)
    local game__116, s0__117, s1__118, t_58, fn__1340, t_59, fn__1339;
    game__116 = newMultiGame(20, 10, 2, 42);
    s0__117 = temper.listed_getor(game__116.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    s1__118 = temper.listed_getor(game__116.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    t_58 = temper.instance_of(s0__117.status, Alive);
    fn__1340 = function()
      return 'player 0 should be alive';
    end;
    temper.test_assert(test_57, t_58, fn__1340);
    t_59 = temper.instance_of(s1__118.status, Alive);
    fn__1339 = function()
      return 'player 1 should be alive';
    end;
    temper.test_assert(test_57, t_59, fn__1339);
    return nil;
  end);
end;
Test_.test_multiGameSnakesStartAtDifferentPositions__190 = function()
  temper.test('multi game snakes start at different positions', function(test_60)
    local game__120, s0__121, s1__122, h0__123, h1__124, t_61, fn__1316;
    game__120 = newMultiGame(60, 30, 2, 42);
    s0__121 = temper.listed_getor(game__120.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    s1__122 = temper.listed_getor(game__120.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    h0__123 = temper.listed_getor(s0__121.segments, 0, Point(-1, -1));
    h1__124 = temper.listed_getor(s1__122.segments, 0, Point(-1, -1));
    t_61 = not pointEquals(h0__123, h1__124);
    fn__1316 = function()
      return 'snakes should start at different positions';
    end;
    temper.test_assert(test_60, t_61, fn__1316);
    return nil;
  end);
end;
Test_.test_multiGameSnakesHave3_segmentsEach__191 = function()
  temper.test('multi game snakes have 3 segments each', function(test_62)
    local game__126, s0__127, s1__128, t_63, fn__1292, t_64, fn__1291;
    game__126 = newMultiGame(20, 10, 2, 42);
    s0__127 = temper.listed_getor(game__126.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    s1__128 = temper.listed_getor(game__126.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    t_63 = (temper.list_length(s0__127.segments) == 3);
    fn__1292 = function()
      return 'player 0 should have 3 segments';
    end;
    temper.test_assert(test_62, t_63, fn__1292);
    t_64 = (temper.list_length(s1__128.segments) == 3);
    fn__1291 = function()
      return 'player 1 should have 3 segments';
    end;
    temper.test_assert(test_62, t_64, fn__1291);
    return nil;
  end);
end;
Test_.test_multiTickMovesBothSnakes__192 = function()
  temper.test('multi tick moves both snakes', function(test_65)
    local game__130, s0__131, s1__132, h0Before__133, h1Before__134, dirs__135, after__136, h0After__137, h1After__138, t_66, fn__1244, t_67, fn__1243;
    game__130 = newMultiGame(60, 30, 2, 42);
    s0__131 = temper.listed_getor(game__130.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    s1__132 = temper.listed_getor(game__130.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    h0Before__133 = temper.listed_getor(s0__131.segments, 0, Point(0, 0));
    h1Before__134 = temper.listed_getor(s1__132.segments, 0, Point(0, 0));
    dirs__135 = temper.listof(s0__131.direction, s1__132.direction);
    after__136 = multiTick(game__130, dirs__135);
    h0After__137 = temper.listed_getor((temper.listed_getor(after__136.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()))).segments, 0, Point(0, 0));
    h1After__138 = temper.listed_getor((temper.listed_getor(after__136.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()))).segments, 0, Point(0, 0));
    t_66 = not pointEquals(h0Before__133, h0After__137);
    fn__1244 = function()
      return 'snake 0 should have moved';
    end;
    temper.test_assert(test_65, t_66, fn__1244);
    t_67 = not pointEquals(h1Before__134, h1After__138);
    fn__1243 = function()
      return 'snake 1 should have moved';
    end;
    temper.test_assert(test_65, t_67, fn__1243);
    return nil;
  end);
end;
Test_.test_multiWallCollisionKillsOneSnake__193 = function()
  temper.test('multi wall collision kills one snake', function(test_68)
    local t_69, t_70, t_71, t_72, t_73, game__140, dirs__141, i__142, deadCount__143, i__144, t_74, fn__1225;
    t_73 = newMultiGame(20, 10, 2, 42);
    game__140 = t_73;
    dirs__141 = temper.listof(Right(), Left());
    i__142 = 0;
    while (i__142 < 20) do
      t_69 = multiTick(game__140, dirs__141);
      game__140 = t_69;
      i__142 = temper.int32_add(i__142, 1);
    end
    deadCount__143 = 0;
    i__144 = 0;
    while true do
      local snake__145;
      t_70 = temper.list_length(game__140.snakes);
      if not (i__144 < t_70) then
        break;
      end
      t_71 = game__140.snakes;
      t_72 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
      snake__145 = temper.listed_getor(t_71, i__144, t_72);
      if temper.instance_of(snake__145.status, Dead) then
        deadCount__143 = temper.int32_add(deadCount__143, 1);
      end
      i__144 = temper.int32_add(i__144, 1);
    end
    t_74 = (deadCount__143 > 0);
    fn__1225 = function()
      return 'at least one snake should be dead after 20 ticks toward walls';
    end;
    temper.test_assert(test_68, t_74, fn__1225);
    return nil;
  end);
end;
Test_.test_multiGameOverWhenOnePlayerLeft__194 = function()
  temper.test('multi game over when one player left', function(test_75)
    local t_76, t_77, game__147, dirs__148, i__149, t_78, fn__1217;
    t_77 = newMultiGame(20, 10, 2, 42);
    game__147 = t_77;
    dirs__148 = temper.listof(Right(), Left());
    i__149 = 0;
    while (i__149 < 30) do
      t_76 = multiTick(game__147, dirs__148);
      game__147 = t_76;
      i__149 = temper.int32_add(i__149, 1);
    end
    t_78 = isMultiGameOver(game__147);
    fn__1217 = function()
      return 'game should be over after enough ticks';
    end;
    temper.test_assert(test_75, t_78, fn__1217);
    return nil;
  end);
end;
Test_.test_changePlayerDirectionWorks__195 = function()
  temper.test('changePlayerDirection works', function(test_79)
    local game__151, t_80, changed__152, s0__153, t_81, fn__1203;
    game__151 = newMultiGame(20, 10, 2, 42);
    t_80 = Up();
    changed__152 = changePlayerDirection(game__151, 0, t_80);
    s0__153 = temper.listed_getor(changed__152.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    t_81 = temper.instance_of(s0__153.direction, Up);
    fn__1203 = function()
      return 'player 0 direction should be Up';
    end;
    temper.test_assert(test_79, t_81, fn__1203);
    return nil;
  end);
end;
Test_.test_changePlayerDirectionRejectsOpposite__196 = function()
  temper.test('changePlayerDirection rejects opposite', function(test_82)
    local game__155, t_83, changed__156, s0__157, t_84, fn__1189;
    game__155 = newMultiGame(20, 10, 2, 42);
    t_83 = Left();
    changed__156 = changePlayerDirection(game__155, 0, t_83);
    s0__157 = temper.listed_getor(changed__156.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    t_84 = temper.instance_of(s0__157.direction, Right);
    fn__1189 = function()
      return 'should reject opposite direction';
    end;
    temper.test_assert(test_82, t_84, fn__1189);
    return nil;
  end);
end;
Test_.test_addPlayerAddsANewSnake__197 = function()
  temper.test('addPlayer adds a new snake', function(test_85)
    local game__159, bigger__160, t_86, fn__1181;
    game__159 = newMultiGame(20, 10, 2, 42);
    bigger__160 = addPlayer(game__159, 99);
    t_86 = (temper.list_length(bigger__160.snakes) == 3);
    fn__1181 = function()
      return 'should have 3 snakes after adding';
    end;
    temper.test_assert(test_85, t_86, fn__1181);
    return nil;
  end);
end;
Test_.test_removePlayerRemovesASnake__198 = function()
  temper.test('removePlayer removes a snake', function(test_87)
    local game__162, smaller__163, t_88, fn__1173;
    game__162 = newMultiGame(20, 10, 3, 42);
    smaller__163 = removePlayer(game__162, 1);
    t_88 = (temper.list_length(smaller__163.snakes) == 2);
    fn__1173 = function()
      return 'should have 2 snakes after removing';
    end;
    temper.test_assert(test_87, t_88, fn__1173);
    return nil;
  end);
end;
Test_.test_multiRenderProducesOutput__199 = function()
  temper.test('multiRender produces output', function(test_89)
    local game__165, rendered__166, t_90, fn__1167;
    game__165 = newMultiGame(20, 10, 2, 42);
    rendered__166 = multiRender(game__165);
    t_90 = temper.str_ne(rendered__166, '');
    fn__1167 = function()
      return 'render should produce output';
    end;
    temper.test_assert(test_89, t_90, fn__1167);
    return nil;
  end);
end;
Test_.test_directionToStringAndStringToDirectionRoundTrip__200 = function()
  temper.test('directionToString and stringToDirection round-trip', function(test_91)
    local d__168, t_92, fn__1160, parsed__169, fn__1159;
    d__168 = directionToString(Up());
    t_92 = temper.str_eq(d__168, 'up');
    fn__1160 = function()
      return "Up should serialize to 'up'";
    end;
    temper.test_assert(test_91, t_92, fn__1160);
    parsed__169 = stringToDirection('down');
    fn__1159 = function()
      return "'down' should parse to Down";
    end;
    temper.test_assert(test_91, true, fn__1159);
    return nil;
  end);
end;
temper.run_scheduler();
exports = {};
local_94.LuaUnit.run(local_93({'--pattern', '^Test_%.', local_93(arg)}));
return exports;
