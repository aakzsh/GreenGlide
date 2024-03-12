import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/services/firebase/getCardsFromFirebase.dart';
import 'package:greenglide/utils/helper/helper.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:url_launcher/url_launcher.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key, required this.lang});
  final String lang;

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  var cards = [];
  getCards()async{
    var l = await getCardsFromFirebase();
    setState(() {
      cards = l;
    });
  }
  @override
  void initState(){
    getCards();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      // body: Text("ehhe"),
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          LuckiestGuyText(text: Helper.walletcards[widget.lang]!, fontSize: 25.0),
       

        Expanded(child:  GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 5, // number of items in each row
    mainAxisSpacing: 8.0, // spacing between rows
    crossAxisSpacing: 8.0, // spacing between columns
  ),
  padding: const EdgeInsets.all(8.0), // padding around the grid
  itemCount: cards.length, // total number of items
  itemBuilder: (context, index) {
    return InkWell(
      onTap: ()async{
       await launchUrl(Uri.parse(cards[index]));
      },
      child: Container(
        
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        color: Colors.amber, 
        ),
        child:  Center(
          child: LuckiestGuyText(text: Helper.offercard[widget.lang]!, fontSize: 18.0)
        ),
      ),
    );
  },
))
        ],
        
      )
    );
  }
}
