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
  Future<void> loadLayers() async {
    final baseVelocity = Vector2(
        500.0 / pow(2, layers[gameRef.player.currentVehicle]!.length), 0);
    final velocityMultiplierDelta = Vector2(1.1, 0.0);
    parallax = await game.loadParallax(
      layers[gameRef.player.currentVehicle]!,
      baseVelocity: baseVelocity,
      velocityMultiplierDelta: velocityMultiplierDelta,
      filterQuality: FilterQuality.none,
    );
  }

  @override
  Future<void> onLoad() async {
     sceneinterval.start();
   await loadLayers();
    sceneinterval.onTick = ()=>debugPrint("hehe");
  }

  @override
  void update(double dt) async {
    parallax?.baseVelocity.x =
        obstacleSpeeds[gameRef.player.currentVehicle]! / 10;
    // await loadLayers();
    // if (gameRef.player.currentG != gameRef.player.prevG) {
    //   await loadLayers();
    // }
    super.update(dt);
  }
}
