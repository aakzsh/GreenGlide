import 'dart:math';

import 'package:flame/components.dart';
import 'package:greenglide/game/components/obstacle.dart';
import 'package:greenglide/game/configuration.dart';
import 'package:greenglide/game/obstacle_position.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/game/runner.dart';

class ObstacleGroup extends PositionComponent with HasGameRef<GreenGlideGame> {
  ObstacleGroup();
  // final _random = Random();
  late ObstacleType typeOfObs;

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    //TODO: add the code here for setting random height of coin
    List<ObstaclePosition> enumValues = ObstaclePosition.values;
    // Generate a random index
    int randomIndex = Random().nextInt(enumValues.length);
    // Access the enum value at the random index
    ObstaclePosition randomEnumValue = enumValues[randomIndex];

     List<ObstacleType> typeenums = ObstacleType.values;
    // Generate a random index
    int randomIn = Random().nextInt(typeenums.length);
    // Access the enum value at the random index
    ObstacleType randomType = typeenums[randomIn];
    typeOfObs = randomType;


    addAll(
        [Obstacle(obstaclePosition: randomEnumValue, type: randomType)]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
      // ObstacleType
      gameRef.player.currentVehicle = typeOfObs;
      // gameRef.player. 
    }
    position.x -= obstacleSpeeds[gameRef.player.currentVehicle]! * dt/3;
  }
}
