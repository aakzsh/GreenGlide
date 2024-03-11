

import 'package:greenglide/game/collectible_type.dart';
import 'package:greenglide/game/obstacle_type.dart';

class Assets{
  static const background = "scenery/sky.png";
  static const ground = "scenery/road.png";
  static const player = "dashatar.png";
  static const obstacle = "coin.png";
  static const ground2 = "scenery/road2.png"
;}

class CoinAssets{
  static const coin = "coin.png";
  static const car = "icons/carcoin.png";
  static const bike = "icons/bikecoin.png";
  static const bicycle = "icons/cyclecoin.png";
  static const metro = "icons/metrocoin.png";
  static const train = "icons/traincoin.png";
  static const airplane = "icons/planecoin.png";
  static const skateboard = "icons/skatecoin.png";
  static const walking = "icons/walkcoin.png";
  static const taxi = "icons/taxicoin.png";
}

Map<ObstacleType, String> coinAssets = {
    // ObstacleType. coin :"coin.png",
  ObstacleType. car :"icons/carcoin.png",
  ObstacleType. bike :"icons/bikecoin.png",
  ObstacleType. bicycle :"icons/cyclecoin.png",
  ObstacleType. metro :"icons/metrocoin.png",
  ObstacleType. train :"icons/traincoin.png",
  ObstacleType. airplane :"icons/planecoin.png",
  ObstacleType. skateboard :"icons/skatecoin.png",
  ObstacleType. walking :"icons/walkcoin.png",
  ObstacleType. taxi :"icons/taxicoin.png",
};

Map<ObstacleType, int> groups = {
  ObstacleType.car: 1,
  ObstacleType.bicycle: 0,
  ObstacleType.bike: 1,
  ObstacleType.metro: 2,
  ObstacleType.train: 2,
  ObstacleType.airplane: 3,
  ObstacleType.skateboard: 0,
  ObstacleType.walking: 0,
  ObstacleType.taxi: 1
};

Map<CollectibleType, String> collectiblesAssets= {
    // ObstacleType. coin :"coin.png",
  CollectibleType.addscore :"coin.png",
  CollectibleType.addtime :"skyline.png",
  CollectibleType.coins :"dashatar.png",
  CollectibleType.reducescore :"flutter.png",
  CollectibleType.reducetime :"logo.png",
};