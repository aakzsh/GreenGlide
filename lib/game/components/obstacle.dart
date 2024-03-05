import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/obstacle_position.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/game/runner.dart';

class Obstacle extends SpriteComponent with HasGameRef<GreenGlideGame>{
  Obstacle({required this.obstaclePosition, required this.type});

  final ObstaclePosition obstaclePosition;
  final ObstacleType type;

  @override
  Future<void> onLoad() async{

    final obstacle = await Flame.images.load(coinAssets[type]!);
    size = Vector2(50, 50);

    switch(obstaclePosition){
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
 }