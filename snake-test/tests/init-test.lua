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
Test_.test_initialStateHasSnakeNearCenter__168 = function()
  temper.test('initial state has snake near center', function(test_0)
    local game__65, head__66, t_1, fn__1560, t_2, fn__1559, t_3, fn__1558;
    game__65 = newGame(10, 10, 42);
    head__66 = temper.listed_getor(game__65.snake, 0, Point(-1, -1));
    t_1 = (head__66.x == 5);
    fn__1560 = function()
      return temper.concat('head x should be 5, got ', temper.int32_tostring(head__66.x));
    end;
    temper.test_assert(test_0, t_1, fn__1560);
    t_2 = (head__66.y == 5);
    fn__1559 = function()
      return temper.concat('head y should be 5, got ', temper.int32_tostring(head__66.y));
    end;
    temper.test_assert(test_0, t_2, fn__1559);
    t_3 = (temper.list_length(game__65.snake) == 3);
    fn__1558 = function()
      return 'snake should start with 3 segments';
    end;
    temper.test_assert(test_0, t_3, fn__1558);
    return nil;
  end);
end;
Test_.test_initialStatusIsPlaying__169 = function()
  temper.test('initial status is Playing', function(test_4)
    local game__68, t_5, fn__1548;
    game__68 = newGame(10, 10, 42);
    t_5 = temper.instance_of(game__68.status, Playing);
    fn__1548 = function()
      return 'initial status should be Playing';
    end;
    temper.test_assert(test_4, t_5, fn__1548);
    return nil;
  end);
end;
Test_.test_initialDirectionIsRight__170 = function()
  temper.test('initial direction is Right', function(test_6)
    local game__70, t_7, fn__1542;
    game__70 = newGame(10, 10, 42);
    t_7 = temper.instance_of(game__70.direction, Right);
    fn__1542 = function()
      return 'initial direction should be Right';
    end;
    temper.test_assert(test_6, t_7, fn__1542);
    return nil;
  end);
end;
Test_.test_initialScoreIs0__171 = function()
  temper.test('initial score is 0', function(test_8)
    local game__72, t_9, fn__1536;
    game__72 = newGame(10, 10, 42);
    t_9 = (game__72.score == 0);
    fn__1536 = function()
      return 'initial score should be 0';
    end;
    temper.test_assert(test_8, t_9, fn__1536);
    return nil;
  end);
end;
Test_.test_snakeMovesRight__172 = function()
  temper.test('snake moves right', function(test_10)
    local game__74, moved__75, head__76, t_11, fn__1522, t_12, fn__1521;
    game__74 = newGame(10, 10, 42);
    moved__75 = tick(game__74);
    head__76 = temper.listed_getor(moved__75.snake, 0, Point(-1, -1));
    t_11 = (head__76.x == 6);
    fn__1522 = function()
      return temper.concat('head should move right to x=6, got ', temper.int32_tostring(head__76.x));
    end;
    temper.test_assert(test_10, t_11, fn__1522);
    t_12 = (head__76.y == 5);
    fn__1521 = function()
      return temper.concat('head y should stay 5, got ', temper.int32_tostring(head__76.y));
    end;
    temper.test_assert(test_10, t_12, fn__1521);
    return nil;
  end);
end;
Test_.test_snakeMovesDown__173 = function()
  temper.test('snake moves down', function(test_13)
    local game__78, moved__79, head__80, t_14, fn__1502, t_15, fn__1501;
    game__78 = changeDirection(newGame(10, 10, 42), Down());
    moved__79 = tick(game__78);
    head__80 = temper.listed_getor(moved__79.snake, 0, Point(-1, -1));
    t_14 = (head__80.x == 5);
    fn__1502 = function()
      return temper.concat('head x should stay 5, got ', temper.int32_tostring(head__80.x));
    end;
    temper.test_assert(test_13, t_14, fn__1502);
    t_15 = (head__80.y == 6);
    fn__1501 = function()
      return temper.concat('head should move down to y=6, got ', temper.int32_tostring(head__80.y));
    end;
    temper.test_assert(test_13, t_15, fn__1501);
    return nil;
  end);
end;
Test_.test_snakeMovesUp__174 = function()
  temper.test('snake moves up', function(test_16)
    local game__82, moved__83, head__84, t_17, fn__1486;
    game__82 = changeDirection(newGame(10, 10, 42), Up());
    moved__83 = tick(game__82);
    head__84 = temper.listed_getor(moved__83.snake, 0, Point(-1, -1));
    t_17 = (head__84.y == 4);
    fn__1486 = function()
      return temper.concat('head should move up to y=4, got ', temper.int32_tostring(head__84.y));
    end;
    temper.test_assert(test_16, t_17, fn__1486);
    return nil;
  end);
end;
Test_.test_oppositeDirectionIsRejected__175 = function()
  temper.test('opposite direction is rejected', function(test_18)
    local game__86, changed__87, t_19, fn__1477;
    game__86 = newGame(10, 10, 42);
    changed__87 = changeDirection(game__86, Left());
    t_19 = temper.instance_of(changed__87.direction, Right);
    fn__1477 = function()
      return 'should still be Right after trying Left';
    end;
    temper.test_assert(test_18, t_19, fn__1477);
    return nil;
  end);
end;
Test_.test_nonOppositeDirectionIsAccepted__176 = function()
  temper.test('non-opposite direction is accepted', function(test_20)
    local game__89, changed__90, t_21, fn__1470;
    game__89 = newGame(10, 10, 42);
    changed__90 = changeDirection(game__89, Up());
    t_21 = temper.instance_of(changed__90.direction, Up);
    fn__1470 = function()
      return 'should change to Up';
    end;
    temper.test_assert(test_20, t_21, fn__1470);
    return nil;
  end);
end;
Test_.test_wallCollisionCausesGameOver__177 = function()
  temper.test('wall collision causes game over', function(test_22)
    local t_23, t_24, game__92, i__93, t_25, fn__1463;
    t_24 = newGame(10, 10, 42);
    game__92 = t_24;
    i__93 = 0;
    while (i__93 < 10) do
      t_23 = tick(game__92);
      game__92 = t_23;
      i__93 = temper.int32_add(i__93, 1);
    end
    t_25 = temper.instance_of(game__92.status, GameOver);
    fn__1463 = function()
      return 'should be GameOver after hitting wall';
    end;
    temper.test_assert(test_22, t_25, fn__1463);
    return nil;
  end);
end;
Test_.test_selfCollisionCausesGameOver__178 = function()
  temper.test('self collision causes game over', function(test_26)
    local snake__95, t_27, game__96, t_28, t_29, fn__1446;
    snake__95 = temper.listof(Point(5, 5), Point(6, 5), Point(6, 4), Point(5, 4), Point(4, 4), Point(4, 5), Point(4, 6));
    t_27 = SnakeGame(10, 10, snake__95, Left(), Point(0, 0), 0, Playing(), 42);
    game__96 = t_27;
    t_28 = tick(game__96);
    game__96 = t_28;
    t_29 = temper.instance_of(game__96.status, GameOver);
    fn__1446 = function()
      return 'should be GameOver after self collision';
    end;
    temper.test_assert(test_26, t_29, fn__1446);
    return nil;
  end);
end;
Test_.test_pointEqualsWorksForSamePoints__179 = function()
  temper.test('pointEquals works for same points', function(test_30)
    local t_31, fn__1440;
    t_31 = pointEquals(Point(3, 4), Point(3, 4));
    fn__1440 = function()
      return 'same points should be equal';
    end;
    temper.test_assert(test_30, t_31, fn__1440);
    return nil;
  end);
end;
Test_.test_pointEqualsWorksForDifferentPoints__180 = function()
  temper.test('pointEquals works for different points', function(test_32)
    local t_33, fn__1434;
    t_33 = not pointEquals(Point(3, 4), Point(5, 6));
    fn__1434 = function()
      return 'different points should not be equal';
    end;
    temper.test_assert(test_32, t_33, fn__1434);
    return nil;
  end);
end;
Test_.test_isOppositeDetectsOppositeDirections__181 = function()
  temper.test('isOpposite detects opposite directions', function(test_34)
    local t_35, fn__1418, t_36, fn__1417, t_37, fn__1416;
    t_35 = isOpposite(Up(), Down());
    fn__1418 = function()
      return 'Up/Down are opposite';
    end;
    temper.test_assert(test_34, t_35, fn__1418);
    t_36 = isOpposite(Left(), Right());
    fn__1417 = function()
      return 'Left/Right are opposite';
    end;
    temper.test_assert(test_34, t_36, fn__1417);
    t_37 = not isOpposite(Up(), Left());
    fn__1416 = function()
      return 'Up/Left are not opposite';
    end;
    temper.test_assert(test_34, t_37, fn__1416);
    return nil;
  end);
end;
Test_.test_directionDeltaReturnsCorrectDeltas__182 = function()
  temper.test('directionDelta returns correct deltas', function(test_38)
    local t_39, t_40, t_41, t_42, up__101, fn__1405, right__102, fn__1404;
    up__101 = directionDelta(Up());
    if (up__101.x == 0) then
      t_39 = up__101.y;
      t_41 = (t_39 == -1);
    else
      t_41 = false;
    end
    fn__1405 = function()
      return 'Up should be (0, -1)';
    end;
    temper.test_assert(test_38, t_41, fn__1405);
    right__102 = directionDelta(Right());
    if (right__102.x == 1) then
      t_40 = right__102.y;
      t_42 = (t_40 == 0);
    else
      t_42 = false;
    end
    fn__1404 = function()
      return 'Right should be (1, 0)';
    end;
    temper.test_assert(test_38, t_42, fn__1404);
    return nil;
  end);
end;
Test_.test_prngIsDeterministic__183 = function()
  temper.test('PRNG is deterministic', function(test_43)
    local r1__104, r2__105, t_44, fn__1393, t_45, fn__1392;
    r1__104 = nextRandom(42, 100);
    r2__105 = nextRandom(42, 100);
    t_44 = (r1__104.value == r2__105.value);
    fn__1393 = function()
      return 'same seed should produce same value';
    end;
    temper.test_assert(test_43, t_44, fn__1393);
    t_45 = (r1__104.nextSeed == r2__105.nextSeed);
    fn__1392 = function()
      return 'same seed should produce same next seed';
    end;
    temper.test_assert(test_43, t_45, fn__1392);
    return nil;
  end);
end;
Test_.test_prngProducesValuesInRange__184 = function()
  temper.test('PRNG produces values in range', function(test_46)
    local t_47, t_48, r__107, fn__1387;
    r__107 = nextRandom(42, 10);
    if (r__107.value >= 0) then
      t_47 = r__107.value;
      t_48 = (t_47 < 10);
    else
      t_48 = false;
    end
    fn__1387 = function()
      return temper.concat('value should be in [0, 10), got ', temper.int32_tostring(r__107.value));
    end;
    temper.test_assert(test_46, t_48, fn__1387);
    return nil;
  end);
end;
Test_.test_tickDoesNothingWhenGameIsOver__185 = function()
  temper.test('tick does nothing when game is over', function(test_49)
    local t_50, t_51, game__109, i__110, t_52, fn__1368, head1__111, t_53, head2__112, t_54, fn__1367;
    t_51 = newGame(10, 10, 42);
    game__109 = t_51;
    i__110 = 0;
    while (i__110 < 10) do
      t_50 = tick(game__109);
      game__109 = t_50;
      i__110 = temper.int32_add(i__110, 1);
    end
    t_52 = temper.instance_of(game__109.status, GameOver);
    fn__1368 = function()
      return 'should be GameOver';
    end;
    temper.test_assert(test_49, t_52, fn__1368);
    head1__111 = temper.listed_getor(game__109.snake, 0, Point(-1, -1));
    t_53 = tick(game__109);
    game__109 = t_53;
    head2__112 = temper.listed_getor(game__109.snake, 0, Point(-1, -1));
    t_54 = pointEquals(head1__111, head2__112);
    fn__1367 = function()
      return 'snake should not move after game over';
    end;
    temper.test_assert(test_49, t_54, fn__1367);
    return nil;
  end);
end;
Test_.test_multiGameCreatesCorrectNumberOfSnakes__186 = function()
  temper.test('multi game creates correct number of snakes', function(test_55)
    local game__114, t_56, fn__1360;
    game__114 = newMultiGame(20, 10, 2, 42);
    t_56 = (temper.list_length(game__114.snakes) == 2);
    fn__1360 = function()
      return 'should have 2 snakes';
    end;
    temper.test_assert(test_55, t_56, fn__1360);
    return nil;
  end);
end;
Test_.test_multiGameSnakesStartAlive__187 = function()
  temper.test('multi game snakes start alive', function(test_57)
    local game__116, s0__117, s1__118, t_58, fn__1338, t_59, fn__1337;
    game__116 = newMultiGame(20, 10, 2, 42);
    s0__117 = temper.listed_getor(game__116.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    s1__118 = temper.listed_getor(game__116.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    t_58 = temper.instance_of(s0__117.status, Alive);
    fn__1338 = function()
      return 'player 0 should be alive';
    end;
    temper.test_assert(test_57, t_58, fn__1338);
    t_59 = temper.instance_of(s1__118.status, Alive);
    fn__1337 = function()
      return 'player 1 should be alive';
    end;
    temper.test_assert(test_57, t_59, fn__1337);
    return nil;
  end);
end;
Test_.test_multiGameSnakesStartAtDifferentPositions__188 = function()
  temper.test('multi game snakes start at different positions', function(test_60)
    local game__120, s0__121, s1__122, h0__123, h1__124, t_61, fn__1314;
    game__120 = newMultiGame(20, 10, 2, 42);
    s0__121 = temper.listed_getor(game__120.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    s1__122 = temper.listed_getor(game__120.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    h0__123 = temper.listed_getor(s0__121.segments, 0, Point(-1, -1));
    h1__124 = temper.listed_getor(s1__122.segments, 0, Point(-1, -1));
    t_61 = not pointEquals(h0__123, h1__124);
    fn__1314 = function()
      return 'snakes should start at different positions';
    end;
    temper.test_assert(test_60, t_61, fn__1314);
    return nil;
  end);
end;
Test_.test_multiGameSnakesHave3_segmentsEach__189 = function()
  temper.test('multi game snakes have 3 segments each', function(test_62)
    local game__126, s0__127, s1__128, t_63, fn__1290, t_64, fn__1289;
    game__126 = newMultiGame(20, 10, 2, 42);
    s0__127 = temper.listed_getor(game__126.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    s1__128 = temper.listed_getor(game__126.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    t_63 = (temper.list_length(s0__127.segments) == 3);
    fn__1290 = function()
      return 'player 0 should have 3 segments';
    end;
    temper.test_assert(test_62, t_63, fn__1290);
    t_64 = (temper.list_length(s1__128.segments) == 3);
    fn__1289 = function()
      return 'player 1 should have 3 segments';
    end;
    temper.test_assert(test_62, t_64, fn__1289);
    return nil;
  end);
end;
Test_.test_multiTickMovesBothSnakes__190 = function()
  temper.test('multi tick moves both snakes', function(test_65)
    local game__130, h0Before__131, h1Before__132, dirs__133, after__134, h0After__135, h1After__136, t_66, fn__1242, t_67, fn__1241;
    game__130 = newMultiGame(20, 10, 2, 42);
    h0Before__131 = temper.listed_getor((temper.listed_getor(game__130.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()))).segments, 0, Point(0, 0));
    h1Before__132 = temper.listed_getor((temper.listed_getor(game__130.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()))).segments, 0, Point(0, 0));
    dirs__133 = temper.listof(Right(), Left());
    after__134 = multiTick(game__130, dirs__133);
    h0After__135 = temper.listed_getor((temper.listed_getor(after__134.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()))).segments, 0, Point(0, 0));
    h1After__136 = temper.listed_getor((temper.listed_getor(after__134.snakes, 1, PlayerSnake(0, temper.listof(), Right(), 0, Dead()))).segments, 0, Point(0, 0));
    t_66 = not pointEquals(h0Before__131, h0After__135);
    fn__1242 = function()
      return 'snake 0 should have moved';
    end;
    temper.test_assert(test_65, t_66, fn__1242);
    t_67 = not pointEquals(h1Before__132, h1After__136);
    fn__1241 = function()
      return 'snake 1 should have moved';
    end;
    temper.test_assert(test_65, t_67, fn__1241);
    return nil;
  end);
end;
Test_.test_multiWallCollisionKillsOneSnake__191 = function()
  temper.test('multi wall collision kills one snake', function(test_68)
    local t_69, t_70, t_71, t_72, t_73, game__138, dirs__139, i__140, deadCount__141, i__142, t_74, fn__1223;
    t_73 = newMultiGame(20, 10, 2, 42);
    game__138 = t_73;
    dirs__139 = temper.listof(Right(), Left());
    i__140 = 0;
    while (i__140 < 20) do
      t_69 = multiTick(game__138, dirs__139);
      game__138 = t_69;
      i__140 = temper.int32_add(i__140, 1);
    end
    deadCount__141 = 0;
    i__142 = 0;
    while true do
      local snake__143;
      t_70 = temper.list_length(game__138.snakes);
      if not (i__142 < t_70) then
        break;
      end
      t_71 = game__138.snakes;
      t_72 = PlayerSnake(0, temper.listof(), Right(), 0, Dead());
      snake__143 = temper.listed_getor(t_71, i__142, t_72);
      if temper.instance_of(snake__143.status, Dead) then
        deadCount__141 = temper.int32_add(deadCount__141, 1);
      end
      i__142 = temper.int32_add(i__142, 1);
    end
    t_74 = (deadCount__141 > 0);
    fn__1223 = function()
      return 'at least one snake should be dead after 20 ticks toward walls';
    end;
    temper.test_assert(test_68, t_74, fn__1223);
    return nil;
  end);
end;
Test_.test_multiGameOverWhenOnePlayerLeft__192 = function()
  temper.test('multi game over when one player left', function(test_75)
    local t_76, t_77, game__145, dirs__146, i__147, t_78, fn__1215;
    t_77 = newMultiGame(20, 10, 2, 42);
    game__145 = t_77;
    dirs__146 = temper.listof(Right(), Left());
    i__147 = 0;
    while (i__147 < 30) do
      t_76 = multiTick(game__145, dirs__146);
      game__145 = t_76;
      i__147 = temper.int32_add(i__147, 1);
    end
    t_78 = isMultiGameOver(game__145);
    fn__1215 = function()
      return 'game should be over after enough ticks';
    end;
    temper.test_assert(test_75, t_78, fn__1215);
    return nil;
  end);
end;
Test_.test_changePlayerDirectionWorks__193 = function()
  temper.test('changePlayerDirection works', function(test_79)
    local game__149, t_80, changed__150, s0__151, t_81, fn__1201;
    game__149 = newMultiGame(20, 10, 2, 42);
    t_80 = Up();
    changed__150 = changePlayerDirection(game__149, 0, t_80);
    s0__151 = temper.listed_getor(changed__150.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    t_81 = temper.instance_of(s0__151.direction, Up);
    fn__1201 = function()
      return 'player 0 direction should be Up';
    end;
    temper.test_assert(test_79, t_81, fn__1201);
    return nil;
  end);
end;
Test_.test_changePlayerDirectionRejectsOpposite__194 = function()
  temper.test('changePlayerDirection rejects opposite', function(test_82)
    local game__153, t_83, changed__154, s0__155, t_84, fn__1187;
    game__153 = newMultiGame(20, 10, 2, 42);
    t_83 = Left();
    changed__154 = changePlayerDirection(game__153, 0, t_83);
    s0__155 = temper.listed_getor(changed__154.snakes, 0, PlayerSnake(0, temper.listof(), Right(), 0, Dead()));
    t_84 = temper.instance_of(s0__155.direction, Right);
    fn__1187 = function()
      return 'should reject opposite direction';
    end;
    temper.test_assert(test_82, t_84, fn__1187);
    return nil;
  end);
end;
Test_.test_addPlayerAddsANewSnake__195 = function()
  temper.test('addPlayer adds a new snake', function(test_85)
    local game__157, bigger__158, t_86, fn__1179;
    game__157 = newMultiGame(20, 10, 2, 42);
    bigger__158 = addPlayer(game__157, 99);
    t_86 = (temper.list_length(bigger__158.snakes) == 3);
    fn__1179 = function()
      return 'should have 3 snakes after adding';
    end;
    temper.test_assert(test_85, t_86, fn__1179);
    return nil;
  end);
end;
Test_.test_removePlayerRemovesASnake__196 = function()
  temper.test('removePlayer removes a snake', function(test_87)
    local game__160, smaller__161, t_88, fn__1171;
    game__160 = newMultiGame(20, 10, 3, 42);
    smaller__161 = removePlayer(game__160, 1);
    t_88 = (temper.list_length(smaller__161.snakes) == 2);
    fn__1171 = function()
      return 'should have 2 snakes after removing';
    end;
    temper.test_assert(test_87, t_88, fn__1171);
    return nil;
  end);
end;
Test_.test_multiRenderProducesOutput__197 = function()
  temper.test('multiRender produces output', function(test_89)
    local game__163, rendered__164, t_90, fn__1165;
    game__163 = newMultiGame(20, 10, 2, 42);
    rendered__164 = multiRender(game__163);
    t_90 = temper.str_ne(rendered__164, '');
    fn__1165 = function()
      return 'render should produce output';
    end;
    temper.test_assert(test_89, t_90, fn__1165);
    return nil;
  end);
end;
Test_.test_directionToStringAndStringToDirectionRoundTrip__198 = function()
  temper.test('directionToString and stringToDirection round-trip', function(test_91)
    local d__166, t_92, fn__1158, parsed__167, fn__1157;
    d__166 = directionToString(Up());
    t_92 = temper.str_eq(d__166, 'up');
    fn__1158 = function()
      return "Up should serialize to 'up'";
    end;
    temper.test_assert(test_91, t_92, fn__1158);
    parsed__167 = stringToDirection('down');
    fn__1157 = function()
      return "'down' should parse to Down";
    end;
    temper.test_assert(test_91, true, fn__1157);
    return nil;
  end);
end;
temper.run_scheduler();
exports = {};
local_94.LuaUnit.run(local_93({'--pattern', '^Test_%.', local_93(arg)}));
return exports;
