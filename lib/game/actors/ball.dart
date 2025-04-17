import 'package:brick_breaker/game/actors/brick.dart';
import 'package:brick_breaker/game/actors/walls.dart';
import 'package:brick_breaker/game/world.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Ball extends BodyComponent
    with ContactCallbacks, ParentIsA<BrickBreakerWorld> {
  Ball({double radius = 0, Vector2? position})
    : super(
        bodyDef: BodyDef(
          type: BodyType.dynamic,
          position: position,
          fixedRotation: true,
          bullet: true,
        ),
        fixtureDefs: [
          FixtureDef(
            CircleShape()..radius = radius,
            restitution: 1,
            friction: 0.25,
          ),
        ],
      ) {
    bodyDef?.userData = this;
  }

  final _targetSpeed = 20.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    body.applyLinearImpulse(Vector2(0, 1));
  }

  @override
  void update(double dt) {
    final deltaSpeed = _targetSpeed - body.linearVelocity.length;
    if (deltaSpeed != 0) {
      final direction = body.linearVelocity.normalized();
      // Impulse = change in momentum and momentum is mass * velocity.
      body.applyLinearImpulse(direction * deltaSpeed * body.mass);
    }
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Brick) {
      other.removeFromParent();
    } else if (other is Walls &&
        (contact.fixtureA.isSensor || contact.fixtureB.isSensor)) {
      parent.reset();
    }
  }
}
