import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenglide/services/shared_preferences/userdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

dailyCheckin()async{
  var ins = await SharedPreferences.getInstance();
  int? coins =  ins.getInt("coins");
  await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
    "coins": coins!+100
  });
  await updateCoinsLocally(coins+100);
  return "";
}

updateCoins(val)async{
  var ins = await SharedPreferences.getInstance();
  int? coins =  ins.getInt("coins");
  await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
    "coins": coins!+val
  });
  await updateCoinsLocally(coins+val);
  return "";
}