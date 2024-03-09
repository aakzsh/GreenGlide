import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/widgets.dart';
import 'package:greenglide/game/components/layers.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/game/runner.dart';

class Ground extends ParallaxComponent<GreenGlideGame>
    with HasGameRef<GreenGlideGame> {
  Ground();
  Timer sceneinterval = Timer(5.0, repeat: true, autoStart: true);
  Future<void> loadLayers(obs) async {
    final baseVelocity = Vector2(
        500.0 / pow(2, layers[gameRef.player.currentVehicle]!.length), 0);
    final velocityMultiplierDelta = Vector2(1.1, 0.0);
    parallax = await game.loadParallax(
      layers[obs]!,
      baseVelocity: baseVelocity,
      velocityMultiplierDelta: velocityMultiplierDelta,
      filterQuality: FilterQuality.none,
    );
  }

  @override
  Future<void> onLoad() async {
   await loadLayers(ObstacleType.bike);
    // sceneinterval.onTick = ()=>{
    //      loadLayers()
    // };
  }

  @override
  void update(double dt) async {
    parallax?.baseVelocity.x =
        obstacleSpeeds[gameRef.player.currentVehicle]! / 10;
    // await loadLayers();
    // if (gameRef.player.currentG != gameRef.player.prevG) {
    //   await loadLayers();
    // }
    sceneinterval.update(dt);
    super.update(dt);
  }
}
