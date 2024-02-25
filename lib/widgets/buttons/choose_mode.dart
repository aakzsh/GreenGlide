import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/utils/animations/page_transition.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';
import 'package:shimmer/shimmer.dart';

class ChooseModeButton extends StatefulWidget {
  const ChooseModeButton({super.key, required this.wid, required this.title});
  final Widget wid;
  final String title;
  @override
  State<ChooseModeButton> createState() => _ChooseModeButtonState();
}

class _ChooseModeButtonState extends State<ChooseModeButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(CustomPageRoute(widget.wid));
            },
            child: Stack(
              children: [
                Container(
                    height: 35,
                    width: 280,
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child:  Center(
                        child: LuckiestGuyText(
                            text: widget.title, fontSize: 15.0))),
                Shimmer.fromColors(
                    baseColor: Colors.white10,
                    highlightColor: AppColors.golden,
                    child: Container(
                      height: 35,
                      width: 280,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                    ))
              ],
            )));
  }
}
