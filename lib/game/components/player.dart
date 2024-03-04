import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/configuration.dart';
import 'package:greenglide/game/player_movements.dart';
import 'package:greenglide/game/runner.dart';

class Player extends SpriteGroupComponent<PlayerMovements>
    with HasGameRef<GreenGlideGame>, CollisionCallbacks {
  Player();
int points = 0;
  void jump() {
    add(MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(duration: 0.2, curve: Curves.decelerate),
      onComplete: () => current = PlayerMovements.down,
    ));
    current = PlayerMovements.run;
    // fall();
//       Timer interval = Timer(0.2);
//  interval.onTick = () => fall();

  }

  void fall() {
    add(MoveByEffect(
      Vector2(0, -Config.gravity),
      EffectController(duration: 0.2, curve: Curves.decelerate),
      onComplete: () => current = PlayerMovements.down,
    ));
    current = PlayerMovements.run;
  }

  @override
  Future<void> onLoad() async {
    final playerdown = await gameRef.loadSprite(Assets.player);
    final playerjump = await gameRef.loadSprite(Assets.player);
    final playerrun = await gameRef.loadSprite(Assets.player);

    size = Vector2(120, 100);
    position = Vector2(50, gameRef.size.y / 1.5);
    current = PlayerMovements.run;
    sprites = {
      PlayerMovements.run: playerrun,
      PlayerMovements.jump: playerjump,
      PlayerMovements.down: playerdown
    };

    add(CircleHitbox());
  }

  void updatePoints(){
    gameRef.player.points ++;
  }
  @override
  void update(double dt){
    super.update(dt);
    if(position.y < gameRef.size.y / 1.5) {
      position.y += Config.fallVelocity*dt;
    }
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other){
    super.onCollisionStart(intersectionPoints, other);
    updatePoints();
    gameRef.isHit = true;
    // gameRef.isHit = true;
    debugPrint("collison");
  }
}
