import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:greenglide/services/shared_preferences/userdetails.dart';

addToLeaderboard(score)async{
  var data = await FirebaseFirestore.instance.collection("scores").doc("topscores").get();
  var list = data.data()!["leaderboard"];
  var username = await getUsernameLocally();
  list.add({"score": score, "username": username});
  // list.sort((a,b) => int.parse(a["score"])>int.parse(b["score"]));
  if(list.length>10){
    list = list.sublist(0, 10);
  }
  await FirebaseFirestore.instance.collection("scores").doc("topscores").update({"leaderboard": list});
}