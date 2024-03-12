import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

getCardsFromFirebase() async {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  var res = await FirebaseFirestore.instance
      .collection("users")
      .doc(uid)
      .get();
  print("hehe");
  print(res.data());
  return res.data()!["cards"];
}
