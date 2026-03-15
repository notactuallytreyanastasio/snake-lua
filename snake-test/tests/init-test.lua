local temper = require('temper-core');
local pointEquals, isOpposite, directionDelta, nextRandom, newGame, changeDirection, tick, Point, Playing, Right, Down, Up, Left, GameOver, SnakeGame, local_55, local_56, exports;
pointEquals = temper.import('snake', 'pointEquals');
isOpposite = temper.import('snake', 'isOpposite');
directionDelta = temper.import('snake', 'directionDelta');
nextRandom = temper.import('snake', 'nextRandom');
newGame = temper.import('snake', 'newGame');
changeDirection = temper.import('snake', 'changeDirection');
tick = temper.import('snake', 'tick');
Point = temper.import('snake', 'Point');
Playing = temper.import('snake', 'Playing');
Right = temper.import('snake', 'Right');
Down = temper.import('snake', 'Down');
Up = temper.import('snake', 'Up');
Left = temper.import('snake', 'Left');
GameOver = temper.import('snake', 'GameOver');
SnakeGame = temper.import('snake', 'SnakeGame');
local_55 = (unpack or table.unpack);
local_56 = require('luaunit');
local_56.FAILURE_PREFIX = temper.test_failure_prefix;
Test_ = {};
Test_.test_initialStateHasSnakeNearCenter__86 = function()
  temper.test('initial state has snake near center', function(test_0)
    local game__38, head__39, t_1, fn__759, t_2, fn__758, t_3, fn__757;
    game__38 = newGame(10, 10, 42);
    head__39 = temper.listed_getor(game__38.snake, 0, Point(-1, -1));
    t_1 = (head__39.x == 5);
    fn__759 = function()
      return temper.concat('head x should be 5, got ', temper.int32_tostring(head__39.x));
    end;
    temper.test_assert(test_0, t_1, fn__759);
    t_2 = (head__39.y == 5);
    fn__758 = function()
      return temper.concat('head y should be 5, got ', temper.int32_tostring(head__39.y));
    end;
    temper.test_assert(test_0, t_2, fn__758);
    t_3 = (temper.list_length(game__38.snake) == 3);
    fn__757 = function()
      return 'snake should start with 3 segments';
    end;
    temper.test_assert(test_0, t_3, fn__757);
    return nil;
  end);
end;
Test_.test_initialStatusIsPlaying__87 = function()
  temper.test('initial status is Playing', function(test_4)
    local game__41, t_5, fn__747;
    game__41 = newGame(10, 10, 42);
    t_5 = temper.instance_of(game__41.status, Playing);
    fn__747 = function()
      return 'initial status should be Playing';
    end;
    temper.test_assert(test_4, t_5, fn__747);
    return nil;
  end);
end;
Test_.test_initialDirectionIsRight__88 = function()
  temper.test('initial direction is Right', function(test_6)
    local game__43, t_7, fn__741;
    game__43 = newGame(10, 10, 42);
    t_7 = temper.instance_of(game__43.direction, Right);
    fn__741 = function()
      return 'initial direction should be Right';
    end;
    temper.test_assert(test_6, t_7, fn__741);
    return nil;
  end);
end;
Test_.test_initialScoreIs0__89 = function()
  temper.test('initial score is 0', function(test_8)
    local game__45, t_9, fn__735;
    game__45 = newGame(10, 10, 42);
    t_9 = (game__45.score == 0);
    fn__735 = function()
      return 'initial score should be 0';
    end;
    temper.test_assert(test_8, t_9, fn__735);
    return nil;
  end);
end;
Test_.test_snakeMovesRight__90 = function()
  temper.test('snake moves right', function(test_10)
    local game__47, moved__48, head__49, t_11, fn__721, t_12, fn__720;
    game__47 = newGame(10, 10, 42);
    moved__48 = tick(game__47);
    head__49 = temper.listed_getor(moved__48.snake, 0, Point(-1, -1));
    t_11 = (head__49.x == 6);
    fn__721 = function()
      return temper.concat('head should move right to x=6, got ', temper.int32_tostring(head__49.x));
    end;
    temper.test_assert(test_10, t_11, fn__721);
    t_12 = (head__49.y == 5);
    fn__720 = function()
      return temper.concat('head y should stay 5, got ', temper.int32_tostring(head__49.y));
    end;
    temper.test_assert(test_10, t_12, fn__720);
    return nil;
  end);
end;
Test_.test_snakeMovesDown__91 = function()
  temper.test('snake moves down', function(test_13)
    local game__51, moved__52, head__53, t_14, fn__701, t_15, fn__700;
    game__51 = changeDirection(newGame(10, 10, 42), Down());
    moved__52 = tick(game__51);
    head__53 = temper.listed_getor(moved__52.snake, 0, Point(-1, -1));
    t_14 = (head__53.x == 5);
    fn__701 = function()
      return temper.concat('head x should stay 5, got ', temper.int32_tostring(head__53.x));
    end;
    temper.test_assert(test_13, t_14, fn__701);
    t_15 = (head__53.y == 6);
    fn__700 = function()
      return temper.concat('head should move down to y=6, got ', temper.int32_tostring(head__53.y));
    end;
    temper.test_assert(test_13, t_15, fn__700);
    return nil;
  end);
end;
Test_.test_snakeMovesUp__92 = function()
  temper.test('snake moves up', function(test_16)
    local game__55, moved__56, head__57, t_17, fn__685;
    game__55 = changeDirection(newGame(10, 10, 42), Up());
    moved__56 = tick(game__55);
    head__57 = temper.listed_getor(moved__56.snake, 0, Point(-1, -1));
    t_17 = (head__57.y == 4);
    fn__685 = function()
      return temper.concat('head should move up to y=4, got ', temper.int32_tostring(head__57.y));
    end;
    temper.test_assert(test_16, t_17, fn__685);
    return nil;
  end);
end;
Test_.test_oppositeDirectionIsRejected__93 = function()
  temper.test('opposite direction is rejected', function(test_18)
    local game__59, changed__60, t_19, fn__676;
    game__59 = newGame(10, 10, 42);
    changed__60 = changeDirection(game__59, Left());
    t_19 = temper.instance_of(changed__60.direction, Right);
    fn__676 = function()
      return 'should still be Right after trying Left';
    end;
    temper.test_assert(test_18, t_19, fn__676);
    return nil;
  end);
end;
Test_.test_nonOppositeDirectionIsAccepted__94 = function()
  temper.test('non-opposite direction is accepted', function(test_20)
    local game__62, changed__63, t_21, fn__669;
    game__62 = newGame(10, 10, 42);
    changed__63 = changeDirection(game__62, Up());
    t_21 = temper.instance_of(changed__63.direction, Up);
    fn__669 = function()
      return 'should change to Up';
    end;
    temper.test_assert(test_20, t_21, fn__669);
    return nil;
  end);
end;
Test_.test_wallCollisionCausesGameOver__95 = function()
  temper.test('wall collision causes game over', function(test_22)
    local t_23, t_24, game__65, i__66, t_25, fn__662;
    t_24 = newGame(10, 10, 42);
    game__65 = t_24;
    i__66 = 0;
    while (i__66 < 10) do
      t_23 = tick(game__65);
      game__65 = t_23;
      i__66 = temper.int32_add(i__66, 1);
    end
    t_25 = temper.instance_of(game__65.status, GameOver);
    fn__662 = function()
      return 'should be GameOver after hitting wall';
    end;
    temper.test_assert(test_22, t_25, fn__662);
    return nil;
  end);
end;
Test_.test_selfCollisionCausesGameOver__96 = function()
  temper.test('self collision causes game over', function(test_26)
    local snake__68, t_27, game__69, t_28, t_29, fn__645;
    snake__68 = temper.listof(Point(5, 5), Point(6, 5), Point(6, 4), Point(5, 4), Point(4, 4), Point(4, 5), Point(4, 6));
    t_27 = SnakeGame(10, 10, snake__68, Left(), Point(0, 0), 0, Playing(), 42);
    game__69 = t_27;
    t_28 = tick(game__69);
    game__69 = t_28;
    t_29 = temper.instance_of(game__69.status, GameOver);
    fn__645 = function()
      return 'should be GameOver after self collision';
    end;
    temper.test_assert(test_26, t_29, fn__645);
    return nil;
  end);
end;
Test_.test_pointEqualsWorksForSamePoints__97 = function()
  temper.test('pointEquals works for same points', function(test_30)
    local t_31, fn__639;
    t_31 = pointEquals(Point(3, 4), Point(3, 4));
    fn__639 = function()
      return 'same points should be equal';
    end;
    temper.test_assert(test_30, t_31, fn__639);
    return nil;
  end);
end;
Test_.test_pointEqualsWorksForDifferentPoints__98 = function()
  temper.test('pointEquals works for different points', function(test_32)
    local t_33, fn__633;
    t_33 = not pointEquals(Point(3, 4), Point(5, 6));
    fn__633 = function()
      return 'different points should not be equal';
    end;
    temper.test_assert(test_32, t_33, fn__633);
    return nil;
  end);
end;
Test_.test_isOppositeDetectsOppositeDirections__99 = function()
  temper.test('isOpposite detects opposite directions', function(test_34)
    local t_35, fn__617, t_36, fn__616, t_37, fn__615;
    t_35 = isOpposite(Up(), Down());
    fn__617 = function()
      return 'Up/Down are opposite';
    end;
    temper.test_assert(test_34, t_35, fn__617);
    t_36 = isOpposite(Left(), Right());
    fn__616 = function()
      return 'Left/Right are opposite';
    end;
    temper.test_assert(test_34, t_36, fn__616);
    t_37 = not isOpposite(Up(), Left());
    fn__615 = function()
      return 'Up/Left are not opposite';
    end;
    temper.test_assert(test_34, t_37, fn__615);
    return nil;
  end);
end;
Test_.test_directionDeltaReturnsCorrectDeltas__100 = function()
  temper.test('directionDelta returns correct deltas', function(test_38)
    local t_39, t_40, t_41, t_42, up__74, fn__604, right__75, fn__603;
    up__74 = directionDelta(Up());
    if (up__74.x == 0) then
      t_39 = up__74.y;
      t_41 = (t_39 == -1);
    else
      t_41 = false;
    end
    fn__604 = function()
      return 'Up should be (0, -1)';
    end;
    temper.test_assert(test_38, t_41, fn__604);
    right__75 = directionDelta(Right());
    if (right__75.x == 1) then
      t_40 = right__75.y;
      t_42 = (t_40 == 0);
    else
      t_42 = false;
    end
    fn__603 = function()
      return 'Right should be (1, 0)';
    end;
    temper.test_assert(test_38, t_42, fn__603);
    return nil;
  end);
end;
Test_.test_prngIsDeterministic__101 = function()
  temper.test('PRNG is deterministic', function(test_43)
    local r1__77, r2__78, t_44, fn__592, t_45, fn__591;
    r1__77 = nextRandom(42, 100);
    r2__78 = nextRandom(42, 100);
    t_44 = (r1__77.value == r2__78.value);
    fn__592 = function()
      return 'same seed should produce same value';
    end;
    temper.test_assert(test_43, t_44, fn__592);
    t_45 = (r1__77.nextSeed == r2__78.nextSeed);
    fn__591 = function()
      return 'same seed should produce same next seed';
    end;
    temper.test_assert(test_43, t_45, fn__591);
    return nil;
  end);
end;
Test_.test_prngProducesValuesInRange__102 = function()
  temper.test('PRNG produces values in range', function(test_46)
    local t_47, t_48, r__80, fn__586;
    r__80 = nextRandom(42, 10);
    if (r__80.value >= 0) then
      t_47 = r__80.value;
      t_48 = (t_47 < 10);
    else
      t_48 = false;
    end
    fn__586 = function()
      return temper.concat('value should be in [0, 10), got ', temper.int32_tostring(r__80.value));
    end;
    temper.test_assert(test_46, t_48, fn__586);
    return nil;
  end);
end;
Test_.test_tickDoesNothingWhenGameIsOver__103 = function()
  temper.test('tick does nothing when game is over', function(test_49)
    local t_50, t_51, game__82, i__83, t_52, fn__567, head1__84, t_53, head2__85, t_54, fn__566;
    t_51 = newGame(10, 10, 42);
    game__82 = t_51;
    i__83 = 0;
    while (i__83 < 10) do
      t_50 = tick(game__82);
      game__82 = t_50;
      i__83 = temper.int32_add(i__83, 1);
    end
    t_52 = temper.instance_of(game__82.status, GameOver);
    fn__567 = function()
      return 'should be GameOver';
    end;
    temper.test_assert(test_49, t_52, fn__567);
    head1__84 = temper.listed_getor(game__82.snake, 0, Point(-1, -1));
    t_53 = tick(game__82);
    game__82 = t_53;
    head2__85 = temper.listed_getor(game__82.snake, 0, Point(-1, -1));
    t_54 = pointEquals(head1__84, head2__85);
    fn__566 = function()
      return 'snake should not move after game over';
    end;
    temper.test_assert(test_49, t_54, fn__566);
    return nil;
  end);
end;
exports = {};
local_56.LuaUnit.run(local_55({'--pattern', '^Test_%.', local_55(arg)}));
return exports;
