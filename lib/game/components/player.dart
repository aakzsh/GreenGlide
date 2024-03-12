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
    final playerplane =  await gameRef.loadSprite("characterplanee.png");
    final playercar =  await gameRef.loadSprite("charactercar.png");
    final playerbike =  await gameRef.loadSprite("characterbike.png");
    final playercycle =  await gameRef.loadSprite("charactercycle.png");
    final playermetro =  await gameRef.loadSprite("charactermetro.png");
    final playertrain =  await gameRef.loadSprite("charactertrain.png");
    final playerskateboard =  await gameRef.loadSprite("characterskateboard.png");
    final playertaxi =  await gameRef.loadSprite("charactertaxi.png");

    size = Vector2(120, 100);
    position = Vector2(50, gameRef.size.y / 1.5);
    current = PlayerMovements.walking;
    sprites = {
      PlayerMovements.walking: playerrun,
      PlayerMovements.car: playercar,
      PlayerMovements.bike: playerbike,
      PlayerMovements.bicycle: playercycle,
      PlayerMovements.metro: playermetro,
      PlayerMovements.train: playertrain,
      PlayerMovements.airplane: playerplane,
      PlayerMovements.skateboard: playerskateboard,
      PlayerMovements.taxi: playertaxi,
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
