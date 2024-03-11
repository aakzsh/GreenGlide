import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenglide/services/firebase/adduserdetails.dart';
import 'package:greenglide/services/shared_preferences/userdetails.dart';

checkLoggedIn() async{
  if(FirebaseAuth.instance.currentUser==null){
    
    Random random = Random();
    int randomNumber = random.nextInt(1000) + 1;
    var username = "Glider#$randomNumber";
    
    // login anonymously and save user details
    await FirebaseAuth.instance.signInAnonymously();
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var data = {
      "username": username,
      "coins": 500,
      "premium": false,
      "uid": uid,
      "outfits": [0]
    };
    var res = await addUser(data);
    setuserStatsLocally(res);
  }
  // else{
  //   // do nothing
  // }
}