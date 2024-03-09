import 'dart:math';

import 'package:flame/components.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/components/obstacle.dart';
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
    ObstacleType randomType = typeenums[gameRef.ind%(typeenums.length)];
    typeOfObs = randomType;
    gameRef.ind++;
    print("lol ${gameRef.ind}");
    addAll([Obstacle(obstaclePosition: randomEnumValue, type: randomType)]);
  }

  @override
  void update(double dt) async {
    if (gameRef.isHit) {
      gameRef.player.prevVehicle = gameRef.player.currentVehicle;
      gameRef.player.currentVehicle = typeOfObs;
      gameRef.player.prevG = gameRef.player.currentG;
      gameRef.player.currentG = groups[typeOfObs]!;

      gameRef.obsGroup.typeOfObs = typeOfObs;
      removeFromParent();
      gameRef.isHit = false;
      // TODO: some sort of mismatch is here
      print("current vehicle ${gameRef.player.currentVehicle}");
    }
    position.x -= obstacleSpeeds[gameRef.player.currentVehicle]! * dt / 3;
    super.update(dt);
  }
}
