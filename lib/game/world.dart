import 'dart:async';

import 'package:brick_breaker/game/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class BrickBreakerWorld extends Forge2DWorld {
  BrickBreakerWorld() : super(gravity: Vector2.zero());

  @override
  Future<void> onLoad() async {
    await add(
      BodyComponent(
        bodyDef: BodyDef(type: BodyType.dynamic),
        fixtureDefs: [
          FixtureDef(
            CircleShape()..radius = 20 * BrickBreakerGame.lengthFactor,
            restitution: 1,
          )
        ],
      ),
    );
  }
}
