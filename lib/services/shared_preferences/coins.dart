import 'package:shared_preferences/shared_preferences.dart';

setDailyCheckinLocally(value)async{
  var ins = await SharedPreferences.getInstance();
  await ins.setString("dailycheckin", value);
}

getDailyCheckinLocally()async{
  var ins = await SharedPreferences.getInstance();
  if(ins.getString("dailycheckin")==null){
    await setDailyCheckinLocally(DateTime.now().toString());
  }
  return ins.getString("dailycheckin");
}