import 'package:brick_breaker/game/world.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class BrickBreakerGame extends Forge2DGame<BrickBreakerWorld> {
  BrickBreakerGame()
      : super(
          world: BrickBreakerWorld(),
          gravity: Vector2.zero(),
          cameraComponent: CameraComponent.withFixedResolution(
            width: 180 * lengthFactor,
            height: 320 * lengthFactor,
          ),
        );

  /// The ratio of forge2d units to virtual resolution units.
  static const lengthFactor = 0.1;

  @override
  void onLoad() {
    camera.viewfinder.zoom = 1.0;
  }
}
