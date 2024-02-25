import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: AppColors.blue,
        child: SizedBox(
          width: 400,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const LuckiestGuyText(text: "WALLET", fontSize: 25.0),
              const LuckiestGuyText(text: "BALANCE: 23 CASH", fontSize: 30.0),
              MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black, width: 2)),
                  color: AppColors.golden,
                  minWidth: 220,
                  height: 50,
                  child: const LuckiestGuyText(
                      text: "WITHDRAW ALL", fontSize: 18.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 80,
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10)
                        ),
                    child: const TextField(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      border: Border.all(color: Colors.black, width: 2),
                         borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Center(
                        child:
                            LuckiestGuyText(text: "ADD MONEY", fontSize: 20.0)),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
