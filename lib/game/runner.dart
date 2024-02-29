
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:greenglide/game/components/background.dart';
import 'package:greenglide/game/components/ground.dart';
import 'package:greenglide/game/components/obstacle_group.dart';
import 'package:greenglide/game/configuration.dart';
import "components/player.dart";
import '../widgets/text/luckiest_guy_textstyle.dart';

class GreenGlideGame extends FlameGame with TapDetector, HasCollisionDetection{
  GreenGlideGame(
  );
  late Player player;
  int time = 100;
  late TextComponent score;
  late TextComponent progress;
  late TextComponent remainingTime;
  bool isHit = false;
  Timer interval = Timer(Config.obstacleInterval, repeat: true);
   Timer remainingT = Timer(1, repeat: true);

  @override
  Future<void> onLoad() async{
    addAll([
      Background(),
      Ground(),
      player = Player(),
      ObstacleGroup(),
      score = buildScore(),
      progress = buildProgress(),
      remainingTime = buildRemainingTime()
    ]);

    interval.onTick = () => add(ObstacleGroup());
    // remainingT.onTick = () => updateTime();
  }

  // void updateTime(){
  //   time--;
  // }
  TextComponent buildScore(){
    return TextComponent(
      text: "POINTS: 0",
      position: Vector2(size.x/2, size.y/2*0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(style: luckiestGuyTextStyle(30.0))
    );
  }

    TextComponent buildRemainingTime(){
    return TextComponent(
      text: "$time\nTIME REMAINING",
      position: Vector2(0.02*size.x, size.y/2*0.2),
      anchor: Anchor.centerLeft,
      textRenderer: TextPaint(style: luckiestGuyTextStyle(20.0))
    );
  }

    TextComponent buildProgress(){
    return TextComponent(
      text: "34%",
      position: Vector2(0.98*size.x , size.y/2*0.2),
      anchor: Anchor.centerRight,
      textRenderer: TextPaint(style:  luckiestGuyTextStyle(20.0))
    );
  }

  
  @override
  void onTap(){
    super.onTap();
    player.jump();
  }

  @override
  void update (double dt){
    super.update(dt);
    interval.update(dt);
    score.text = "Score: ${player.points}";
    remainingTime.text = "$time\nTIME REMAINING";
    
  }
}