import 'package:shared_preferences/shared_preferences.dart';

toggleSoundLocally()async{
  var ins = await SharedPreferences.getInstance();
  bool data = await getSoundLocally();
  if(data==false){
    await ins.setBool("sound", true); 
  }
  else{
    await ins.setBool("sound", false); 
  }
  
  // print("sound is now not $data");
}

getSoundLocally()async{
  var ins = await SharedPreferences.getInstance();
  var sound = ins.getBool("sound"); 
  return sound;
}