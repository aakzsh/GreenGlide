import 'dart:developer';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/collectible_position.dart';
import 'package:greenglide/game/collectible_type.dart';
import 'package:greenglide/game/obstacle_position.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/game/runner.dart';

class Collectible extends SpriteComponent
    with HasGameRef<GreenGlideGame>, CollisionCallbacks {
  Collectible({required this.obstaclePosition, required this.type});

  final CollectiblePosition obstaclePosition;
  final CollectibleType type;

  @override
  Future<void> onLoad() async {
    print("loaded");
    final obstacle = await Flame.images.load(collectiblesAssets[type]!);
    size = Vector2(30, 30);
    switch (obstaclePosition) {
      case CollectiblePosition.middle:
        position.y = gameRef.size.y / 1.5;
        sprite = Sprite(obstacle);
        break;
      case CollectiblePosition.up:
        position.y = gameRef.size.y / 1.5 - 100;
        sprite = Sprite(obstacle);
        break;
      case CollectiblePosition.veryup:
        position.y = gameRef.size.y / 1.5 - 200;
        sprite = Sprite(obstacle);
    }
    add(CircleHitbox());
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    log(type.toString());
    switch (type) {
      case CollectibleType.addscore:
          gameRef.player.points += 50;
        break;
      case CollectibleType.addtime:
          gameRef.time += 5;
          break;
      case CollectibleType.coins:
          gameRef.player.coins ++;
          break;
      case CollectibleType.reducescore:
          gameRef.player.points -= 50;
          break;
      case CollectibleType.reducetime:
          gameRef.time -= 5;
    }
    gameRef.collisHit = true;

    super.onCollisionStart(intersectionPoints, other);
  }
}
