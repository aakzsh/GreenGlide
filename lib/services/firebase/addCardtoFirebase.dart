import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

addCardtoFirebase(data)async{
  var uid = FirebaseAuth.instance.currentUser!.uid;
  var res =  await FirebaseFirestore.instance.collection("users").doc(uid).get();
  var cards = res.data()!["cards"];
  cards.add(data);
  await FirebaseFirestore.instance.collection("users").doc(uid).update({
    "cards": cards,
  });

}