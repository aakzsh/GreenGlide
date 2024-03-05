import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/game/runner.dart';

class Ground extends ParallaxComponent<GreenGlideGame> with HasGameRef<GreenGlideGame>{
  Ground();

  @override
  Future<void> onLoad () async{
    final ground = await Flame.images.load(Assets.ground);
     final ground2 = await Flame.images.load(Assets.ground2);
    parallax = Parallax([
      ParallaxLayer(ParallaxImage(ground)),
      ParallaxLayer(ParallaxImage(ground2))
    ], baseVelocity: Vector2(100, 0));
  }

  @override
  void update(double dt){
        parallax?.baseVelocity.x = obstacleSpeeds[gameRef.player.currentVehicle]!/3;

    super.update(dt);
    // parallax?.baseVelocity.x = Config.gamespeed;
  }
 }