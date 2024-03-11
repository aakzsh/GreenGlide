import 'dart:math';

import 'package:flame/components.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/collectible_position.dart';
import 'package:greenglide/game/collectible_type.dart';
import 'package:greenglide/game/components/collectible.dart';
import 'package:greenglide/game/components/obstacle.dart';
import 'package:greenglide/game/obstacle_position.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/game/runner.dart';

class CollectibleGroup extends PositionComponent with HasGameRef<GreenGlideGame> {
  CollectibleGroup();
  // final _random = Random();
  late CollectibleType typeOfObs;
  
  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    //TODO: add the code here for setting random height of coin
    List<CollectiblePosition> enumValues = CollectiblePosition.values;
    // Generate a random index
    int randomIndex = Random().nextInt(enumValues.length);
    // Access the enum value at the random index
    CollectiblePosition randomEnumValue = enumValues[randomIndex];

    List<CollectibleType> typeenums = CollectibleType.values;
    // Generate a random index
    // int randomIn = Random().nextInt(typeenums.length);
    // Access the enum value at the random index
    CollectibleType randomType = typeenums[gameRef.ind%(typeenums.length)];
    typeOfObs = randomType;
    gameRef.ind++;
    // print("lol ${gameRef.ind}");
    addAll([Collectible(obstaclePosition: randomEnumValue, type: randomType)]);
  }

  @override
  void update(double dt) async {
    if (gameRef.collisHit) {
      // gameRef.obsGroup.typeOfObs = typeOfObs;
      removeFromParent();
      gameRef.collisHit = false;
      // TODO: some sort of mismatch is here
      print("current vehicle ${gameRef.player.currentVehicle}");
    }
    position.x -= obstacleSpeeds[gameRef.player.currentVehicle]! * dt / 3;
    super.update(dt);
  }
}
