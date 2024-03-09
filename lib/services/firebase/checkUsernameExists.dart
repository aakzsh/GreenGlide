import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenglide/services/shared_preferences/userdetails.dart';

checkUsernameExists(newUsername)async{
    var usernamesIns = await FirebaseFirestore.instance.collection("usernames").doc("usernames").get();
    var usernames = usernamesIns.data()!["usernames"];
    return usernames.contains(newUsername);
}


editUsername(newUsername, oldUsername)async{
    var usernamesIns = await FirebaseFirestore.instance.collection("usernames").doc("usernames").get();
    var usernames = usernamesIns.data()!["usernames"];
    usernames.add(newUsername);
    usernames.remove(oldUsername);
    await FirebaseFirestore.instance.collection("usernames").doc("usernames").update({"usernames": usernames});
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({"username": newUsername});

    await updateUsernameLocally(newUsername);
}