

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
getLeaderboard() async{
   await Firebase.initializeApp();
final FirebaseFirestore firestore = FirebaseFirestore.instance;
final res = await firestore.collection("scores").doc("topscores").get();
print(res.data());
return res.data()!["leaderboard"];
}