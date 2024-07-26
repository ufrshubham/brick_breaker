import 'dart:async';

import 'package:brick_breaker/game/actors/ball.dart';
import 'package:brick_breaker/game/actors/brick_zone.dart';
import 'package:brick_breaker/game/actors/paddle.dart';
import 'package:brick_breaker/game/actors/walls.dart';
import 'package:brick_breaker/game/game.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class BrickBreakerWorld extends Forge2DWorld
    with HasGameReference<BrickBreakerGame> {
  BrickBreakerWorld() : super(gravity: Vector2.zero());

  @override
  Future<void> onLoad() async {
    await add(
      Walls(
        game.camera.viewport.virtualSize,
        5 * BrickBreakerGame.lengthFactor,
      ),
    );

    await add(
      Ball(
        radius: 4 * BrickBreakerGame.lengthFactor,
        position: game.camera.viewport.virtualSize * 0.5,
      ),
    );

    await add(
      Paddle(
        size: Vector2(30, 6)..scale(BrickBreakerGame.lengthFactor),
        position: Vector2(
          0.5 * game.camera.viewport.virtualSize.x,
          0.9 * game.camera.viewport.virtualSize.y,
        ),
      ),
    );

    await add(
      BrickZone(
        size: Vector2(
          game.camera.viewport.virtualSize.x * 0.8,
          game.camera.viewport.virtualSize.y * 0.35,
        ),
        position: Vector2(
          game.camera.viewport.virtualSize.x * 0.1,
          game.camera.viewport.virtualSize.y * 0.1,
        ),
        numBricksX: 6,
        numBricksY: 9,
        spacingX: 5 * BrickBreakerGame.lengthFactor,
        spacingY: 5 * BrickBreakerGame.lengthFactor,
      ),
    );
  }
}
