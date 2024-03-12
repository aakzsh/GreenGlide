import 'package:shared_preferences/shared_preferences.dart';

toggleJapaneseLocally()async{
  var ins = await SharedPreferences.getInstance();
  bool data = await getJapaneseLocally();
  if(data!=false){
    await ins.setBool("japanese", false); 
  }
  else{
    await ins.setBool("japanese", true); 
  }
  
  // print("sound is now not $data");
}

getJapaneseLocally()async{
  var ins = await SharedPreferences.getInstance();
  var sound = ins.getBool("japanese"); 
  return sound;
}