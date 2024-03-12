import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/game/assets.dart';
import 'package:greenglide/game/configuration.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/game/player_movements.dart';
import 'package:greenglide/game/runner.dart';

class Player extends SpriteGroupComponent<PlayerMovements>
    with HasGameRef<GreenGlideGame>, CollisionCallbacks {
  Player();
  int points = 0;
  ObstacleType currentVehicle = ObstacleType.walking;
  ObstacleType prevVehicle = ObstacleType.walking;
  int prevG = 0;
  int currentG = 0;
  int coins = 0;
  void jump() {
    add(MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(duration: 0.2, curve: Curves.decelerate),
      // onComplete: () => current = PlayerMovements.down,
    ));
    // current = PlayerMovements.run;
  }

  void fall() {
    add(MoveByEffect(
      Vector2(0, -Config.gravity),
      EffectController(duration: 0.2, curve: Curves.decelerate),
      // onComplete: () => current = PlayerMovements.down,
    ));
    // current = PlayerMovements.run;
  }
  bool switcher = false;
  @override
  Future<void> onLoad() async {
    final playerrun = await gameRef.loadSprite(Assets.playerrun);
    final playerplane =  await gameRef.loadSprite("characterplane.png");

    size = Vector2(120, 100);
    position = Vector2(50, gameRef.size.y / 1.5);
    current = PlayerMovements.walking;
    sprites = {
      PlayerMovements.walking: playerrun,
      PlayerMovements.car: playerrun,
      PlayerMovements.bike: playerplane,
      PlayerMovements.bicycle: playerrun,
      PlayerMovements.metro: playerplane,
      PlayerMovements.train: playerrun,
      PlayerMovements.airplane: playerplane,
      PlayerMovements.skateboard: playerrun,
      PlayerMovements.taxi: playerrun,
    };

    add(CircleHitbox());
  }

  void updatePoints() {
    gameRef.player.points++;
  }

  @override
  void update(double dt)async {
    if (position.y < gameRef.size.y / 1.5) {
      position.y += Config.fallVelocity * dt;
    }
    super.update(dt);
  }

}
