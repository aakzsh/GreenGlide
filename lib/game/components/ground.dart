import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/configuration.dart';
import 'package:greenglide/game/runner.dart';

class Ground extends ParallaxComponent<GreenGlideGame>{
  Ground();

  @override
  Future<void> onLoad () async{
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([
      ParallaxLayer(ParallaxImage(ground))
    ]);
  }

  @override
  void update(double dt){
    super.update(dt);
    parallax?.baseVelocity.x = Config.gamespeed;
  }
 }