import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/runner.dart';

class Background extends SpriteComponent with HasGameRef<GreenGlideGame>{
  Background();

  @override
  Future<void> onLoad() async{
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}