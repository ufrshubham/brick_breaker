import 'package:flame_forge2d/flame_forge2d.dart';

class Ball extends BodyComponent {
  Ball({
    double radius = 0,
    Vector2? position,
  }) : super(
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
            ),
          ],
        );

  final _targetSpeed = 20.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    body.applyLinearImpulse(Vector2.random());
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
}
