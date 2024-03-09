import 'package:cloud_firestore/cloud_firestore.dart';

addUser(data)async{

  var usernamesIns = await FirebaseFirestore.instance.collection("usernames").doc("usernames").get();
  var usernames = usernamesIns.data()!["usernames"];
  usernames.add(data["username"]);
  await FirebaseFirestore.instance.collection("usernames").doc("usernames").update({"usernames": usernames});
  await FirebaseFirestore.instance.collection("users").doc(data["uid"]).set(data);
  
  // await FirebaseFirestore.instance.collection("usernames").doc("usernames").update(data)
  return data;
}