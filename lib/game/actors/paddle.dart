import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/services.dart';

class Paddle extends BodyComponent with KeyboardHandler {
  Paddle({required this.size, Vector2? position})
      : super(
          bodyDef: BodyDef(
            type: BodyType.kinematic,
            position: position,
            allowSleep: false,
          ),
          fixtureDefs: [
            FixtureDef(
              // The effective width of the rectangular portion is given by (size.x - size.y)
              // where size.y is (2 * radius) of the end circles.
              PolygonShape()..setAsBoxXY((size.x - size.y) * 0.5, size.y * 0.5),
              restitution: 1,
              friction: 0.25,
            ),
            FixtureDef(
              CircleShape()
                ..radius = size.y * 0.5
                ..position.setValues(-size.x * 0.5 + size.y * 0.5, 0),
              restitution: 1,
              friction: 0.25,
            ),
            FixtureDef(
              CircleShape()
                ..radius = size.y * 0.5
                ..position.setValues(size.x * 0.5 - size.y * 0.5, 0),
              restitution: 1,
              friction: 0.25,
            ),
          ],
        );

  final Vector2 size;

  double _hAxis = 0;
  final double _maxSpeed = 20;

  bool get _isAtLimits =>
      (position.x < size.x * 0.75 && _hAxis < 0) ||
      (position.x > game.camera.viewport.virtualSize.x - size.x * 0.75 &&
          _hAxis > 0);

  @override
  void update(double dt) {
    body.linearVelocity.setValues(_isAtLimits ? 0.0 : _hAxis * _maxSpeed, 0);
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    _hAxis = 0;

    if (keysPressed.contains(LogicalKeyboardKey.keyA)) {
      _hAxis -= 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.keyD)) {
      _hAxis += 1;
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
