import 'package:brick_breaker/game/actors/brick.dart';
import 'package:flame/components.dart';

class BrickZone extends PositionComponent {
  BrickZone({
    required super.position,
    required super.size,
    required this.numBricksX,
    required this.numBricksY,
    required this.spacingX,
    required this.spacingY,
  }) {
    brickSize = Vector2(
      (size.x - (numBricksX - 1) * spacingX) / numBricksX,
      (size.y - (numBricksY - 1) * spacingY) / numBricksY,
    );
  }

  final int numBricksX;
  final int numBricksY;
  final double spacingX;
  final double spacingY;
  late final Vector2 brickSize;

  @override
  void onMount() {
    super.onMount();

    for (var row = 0; row < numBricksY; row++) {
      for (var col = 0; col < numBricksX; col++) {
        final brickPosition =
            position +
            Vector2(
              brickSize.x * 0.5 + col * (brickSize.x + spacingX),
              brickSize.y * 0.5 + row * (brickSize.y + spacingY),
            );
        final brick = Brick(position: brickPosition, size: brickSize);
        parent?.add(brick);
      }
    }
  }
}
