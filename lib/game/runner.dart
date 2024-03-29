import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:greenglide/game/components/collectible_group.dart';
import 'package:greenglide/game/components/ground.dart';
import 'package:greenglide/game/components/obstacle_group.dart';
import 'package:greenglide/game/configuration.dart';
import 'package:greenglide/game/obstacle_type.dart';
import 'package:greenglide/models/global_key.dart';
import 'package:greenglide/screens/gameplay/singleplayer/score.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:greenglide/utils/helper/helper.dart';
import "components/player.dart";
import '../widgets/text/luckiest_guy_textstyle.dart';

class GreenGlideGame extends FlameGame with TapDetector, HasCollisionDetection {
  GreenGlideGame({required this.sound, required this.lang});
  final String lang;
  final bool sound;
  late Player player;
  late Ground ground;
  late ObstacleGroup obsGroup;
  late CollectibleGroup collGroup;
  int time = 100;
  late TextComponent score;
  late TextComponent progress;
  late TextComponent remainingTime;
  double totalDist = 20000.0;
  double coveredDist = 0.0;
  int completed = 0;
  int progressVal = 0;
  double speed = 100.0;
  int ind = 0;
  int collInd = 0;
  bool isHit = false;

  bool collisHit = false;
  Timer interval = Timer(Config.obstacleInterval, repeat: true);
  Timer collectibleinterval = Timer(Config.collectibleInterval, repeat: true);

  
  Timer remainingT = Timer(1.0, repeat: true);
  Timer gameStart = Timer(2, repeat: false);
  @override
  Future<void> onLoad() async {
    addAll([
      ground = Ground(),
      obsGroup = ObstacleGroup(),
      collGroup = CollectibleGroup(),
      player = Player(),
      score = buildScore(),
      progress = buildProgress(),
      remainingTime = buildRemainingTime(),
      
    ]);

    interval.onTick = () =>
      add(ObstacleGroup());
    
    collectibleinterval.onTick = () => add(CollectibleGroup());
    remainingT.onTick = () => {updateTime(), updateCoveredDist()};
  }

  void updateTime() {
    if (time < 1) {
      pauseEngine();
      Navigator.pushAndRemoveUntil(
          NavigationService.navigatorKey.currentContext!,
          CustomPageRoute(SinglePlayerScore(score: player.points, coins: player.coins, sound: sound, lang: lang)),
          (route) => false);
    }
    time--;
  }
  bool bonus = true;
  void updateCoveredDist() {
    coveredDist += obstacleSpeeds[player.currentVehicle]! / 10;
    if(coveredDist - totalDist < 1000 && bonus){
      player.points += (100-time)*100;
      bonus = false;
    }
    if (coveredDist >= totalDist) {
      pauseEngine();
      Navigator.pushAndRemoveUntil(
          NavigationService.navigatorKey.currentContext!,
          CustomPageRoute(SinglePlayerScore(score: player.points, coins: player.coins, sound: sound, lang: lang)),
          (route) => false);
    }
  }

  TextComponent buildScore() {
    return TextComponent(
        text: "${Helper.score[lang]}: 0",
        position: Vector2(size.x / 2, size.y / 2 * 0.2),
        anchor: Anchor.center,
        textRenderer: TextPaint(style: luckiestGuyTextStyle(30.0)));
  }

  TextComponent buildRemainingTime() {
    return TextComponent(
        text: "$time\n${Helper.timeRemaining[lang]}",
        position: Vector2(0.02 * size.x, size.y / 2 * 0.2),
        anchor: Anchor.centerLeft,
        textRenderer: TextPaint(style: luckiestGuyTextStyle(16.0)));
  }

  TextComponent buildProgress() {
    return TextComponent(
        text:
            "$progressVal% ${Helper.completed[lang]}\n${Helper.speed[lang]}: ${obstacleSpeeds[player.currentVehicle]! / 10}",
        position: Vector2(0.98 * size.x, size.y / 2 * 0.2),
        anchor: Anchor.centerRight,
        textRenderer: TextPaint(style: luckiestGuyTextStyle(16.0)));
  }

  @override
  void onTap() {
    super.onTap();
    player.jump();
    FlameAudio.play("jump.wav");
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    remainingT.update(dt);
    collectibleinterval.update(dt);
    score.text = "${Helper.score[lang]}: ${player.points}";
    progressVal = ((coveredDist / totalDist) * 100).toInt();
    progress.text =
        "$progressVal% ${Helper.completed[lang]}\n${Helper.speed[lang]}: ${obstacleSpeeds[player.currentVehicle]! / 10}";
    remainingTime.text = "$time\n${Helper.timeRemaining[lang]}";
  }
}
