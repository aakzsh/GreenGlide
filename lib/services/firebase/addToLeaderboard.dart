import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenglide/services/shared_preferences/userdetails.dart';

addToLeaderboard(score)async{
  var data = await FirebaseFirestore.instance.collection("scores").doc("topscores").get();
  var list = data.data()!["leaderboard"];
  var username = await getUsernameLocally();
  list.add({"score": score, "username": username});
  // list.sort((a,b) => int.parse(a["score"])>int.parse(b["score"]));

  list = convertList(list);
    List<Map<String, dynamic>> l = list;
    l.sort((a, b) => b["score"].compareTo(a["score"]));

  if(l.length>10){
    l = l.sublist(0, 10);
  }
  await FirebaseFirestore.instance.collection("scores").doc("topscores").update({"leaderboard": l});
}


 List<Map<String, dynamic>> convertList(List<dynamic> originalList) {
  List<Map<String, dynamic>> newList = [];
  for (var map in originalList) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = value;
    });
    newList.add(newMap);
  }
  return newList;
}