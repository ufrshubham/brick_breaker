import 'dart:async';

import 'package:brick_breaker/game/actors/ball.dart';
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
  }
}
