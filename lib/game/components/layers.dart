
import 'package:flame/parallax.dart';
import 'package:greenglide/game/obstacle_type.dart';


Map<ObstacleType, List<ParallaxImageData>> layers = {
  ObstacleType.car: [
      ParallaxImageData('scenery/sky.png'),
      ParallaxImageData('scenery/road2.png'),
      ParallaxImageData('scenery/road.png'),
      ParallaxImageData("scenery/lamps.png"),
      ParallaxImageData("scenery/skyline.png"),
      ParallaxImageData("scenery/clouds.png"),
    ],
    ObstacleType.bike: [
      ParallaxImageData('scenery/sky.png'),
      ParallaxImageData('scenery/road2.png'),
      ParallaxImageData('scenery/road.png'),
      ParallaxImageData("scenery/lamps.png"),
      ParallaxImageData("scenery/skyline.png"),
      ParallaxImageData("scenery/clouds.png"),
    ],
    ObstacleType.taxi: [
      ParallaxImageData('scenery/sky.png'),
      ParallaxImageData('scenery/road2.png'),
      ParallaxImageData('scenery/road.png'),
      ParallaxImageData("scenery/lamps.png"),
      ParallaxImageData("scenery/skyline.png"),
      ParallaxImageData("scenery/clouds.png"),
    ],
    ObstacleType.walking: [
      ParallaxImageData('scenery/sky2.png'),
      ParallaxImageData('scenery/pavement.png'),
      ParallaxImageData("scenery/skyline.png"),
      ParallaxImageData("scenery/clouds.png"),
      ParallaxImageData("scenery/forest.png"),
      ParallaxImageData("scenery/trees.png"),
      ParallaxImageData('scenery/grass.png'),
      ParallaxImageData("scenery/stones.png"),
    ],
    ObstacleType.bicycle: [
      ParallaxImageData('scenery/sky2.png'),
      ParallaxImageData('scenery/pavement.png'),
      ParallaxImageData("scenery/skyline.png"),
      ParallaxImageData("scenery/clouds.png"),
      ParallaxImageData("scenery/forest.png"),
      ParallaxImageData("scenery/trees.png"),
      ParallaxImageData('scenery/grass.png'),
      ParallaxImageData("scenery/stones.png"),
    ],
    ObstacleType.skateboard: [
      ParallaxImageData('scenery/sky2.png'),
      ParallaxImageData('scenery/pavement.png'),
      ParallaxImageData("scenery/skyline.png"),
      ParallaxImageData("scenery/clouds.png"),
      ParallaxImageData("scenery/forest.png"),
      ParallaxImageData("scenery/trees.png"),
      ParallaxImageData('scenery/grass.png'),
      ParallaxImageData("scenery/stones.png"),
    ],

     ObstacleType.metro: [
      ParallaxImageData('scenery/sky.png'),
      ParallaxImageData("scenery/clouds.png"),
      ParallaxImageData("scenery/bridge.png"),
      ParallaxImageData("scenery/caution.png"),
      ParallaxImageData("scenery/trainlamps.png"),
      ParallaxImageData("scenery/track.png")
    ],
     ObstacleType.train: [
      ParallaxImageData('scenery/sky.png'),
      ParallaxImageData("scenery/clouds.png"),
      ParallaxImageData("scenery/bridge.png"),
      ParallaxImageData("scenery/caution.png"),
      ParallaxImageData("scenery/trainlamps.png"),
      ParallaxImageData("scenery/track.png")
    ],
     ObstacleType.airplane: [
      ParallaxImageData('scenery/sky.png'),
      ParallaxImageData('scenery/plane1.png'),
      ParallaxImageData('scenery/plane2.png'),
      ParallaxImageData('scenery/plane3.png'),
      
      ]

}; 

