import 'package:brick_breaker/game/world.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class BrickBreakerGame extends Forge2DGame<BrickBreakerWorld>
    with HasKeyboardHandlerComponents {
  BrickBreakerGame()
    : super(
        world: BrickBreakerWorld(),
        camera: CameraComponent.withFixedResolution(
          width: 180 * lengthFactor,
          height: 320 * lengthFactor,
        ),
      );

  /// The ratio of forge2d units to virtual resolution units.
  static const lengthFactor = 0.1;

  @override
  void onLoad() {
    camera.viewfinder.zoom = 1.0;
    camera.moveTo(camera.viewport.virtualSize * 0.5);
  }
}
