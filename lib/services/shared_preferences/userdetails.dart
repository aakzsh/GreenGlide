import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

setuserStatsLocally(data)async{
  var ins = await SharedPreferences.getInstance();
  await ins.setBool("premium", data["premium"]);
  await ins.setString("outfits", utf8.decode(data["outfits"]));
  await ins.setString("uid", data["uid"]);
  await ins.setString("username", data["username"]);
  await ins.setInt("coins", data["coins"]);
  await ins.setBool("sound", true);
}

getUsernameLocally()async{
  var ins = await SharedPreferences.getInstance();
  var data =  ins.getString("username",);
  return data;
}

updateCoinsLocally(coins) async{
   var ins = await SharedPreferences.getInstance();
   await ins.setInt("coins", coins);
}

updateUsernameLocally(username)async{
  var ins = await SharedPreferences.getInstance();
  await ins.setString("username",username);
}
