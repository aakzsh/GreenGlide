import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/obstacle_position.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/game/runner.dart';

class Obstacle extends SpriteComponent
    with HasGameRef<GreenGlideGame>, CollisionCallbacks {
  Obstacle({required this.obstaclePosition, required this.type});

  final ObstaclePosition obstaclePosition;
  final ObstacleType type;

  @override
  Future<void> onLoad() async {
    final obstacle = await Flame.images.load(coinAssets[type]!);
    size = Vector2(50, 50);

    switch (obstaclePosition) {
      case ObstaclePosition.middle:
        position.y = gameRef.size.y / 1.5;
        sprite = Sprite(obstacle);
        break;
      case ObstaclePosition.up:
        position.y = gameRef.size.y / 1.5 - 100;
        sprite = Sprite(obstacle);
    }
    add(CircleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    List<ObstacleType> typeenums = ObstacleType.values;

    // print(gameRef.player.currentVehicle);
    if (gameRef.sound) {
      FlameAudio.play("hit.wav");
    }
    gameRef.player.updatePoints();
    // obstacleSpeeds[gameRef.player.currentVehicle]! / 10;
    int index = gameRef.ind % (typeenums.length) - 1;
    if (index == -1) {
      index = typeenums.length - 1;
    }
    await gameRef.ground.loadLayers(typeenums[index]);
    // print("chemck ${typeenums[index]}");
    gameRef.isHit = true;
    gameRef.player.points +=
        vehicleScores[gameRef.player.currentVehicle]!.toInt();
    // if (gameRef.player.currentVehicle != ObstacleType.metro &&
    //     gameRef.player.currentVehicle != ObstacleType.train) {
    //   gameRef.player.size = Vector2(80, 150);
    // } else {
    //   // gameRef.player.size = Vector2(120, 100);
    // }
    gameRef.player.current = playerMovements[typeenums[index]]!;

    // position.x -= obstacleSpeeds[gameRef.player.currentVehicle]! * dt / 3;
    super.onCollisionStart(intersectionPoints, other);
  }
}
