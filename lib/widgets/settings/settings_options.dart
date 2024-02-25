import 'package:flutter/material.dart';
import 'package:greenglide/constants/colors.dart';
import 'package:greenglide/widgets/text/luckiest_guy.dart';

class SettingsOption extends StatefulWidget {
  const SettingsOption({super.key, required this.title});
  final String title;

  @override
  State<SettingsOption> createState() => _SettingsOptionState();
}

class _SettingsOptionState extends State<SettingsOption> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LuckiestGuyText(text: widget.title, fontSize: 25.0),
          !selected
              ? GestureDetector(
                onTap: ()=>setState(() {
                  selected = !selected;
                }),
                child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.toggleredline,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.toggleredbutton,
                              borderRadius: BorderRadius.circular(40)),
                          width: 40,
                          height: 40,
                        ),
                      const  SizedBox(width: 5,),
                      const  LuckiestGuyText(text: "OFF", fontSize: 20.0)
                      ],
                    ),
                  ),
              )
              : GestureDetector(
                onTap: ()=>setState(() {
                  selected = !selected;
                }),
                child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: AppColors.togglegreenline,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                      const  LuckiestGuyText(text: "ON", fontSize: 20.0),

                      const  SizedBox(width: 5,),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.togglegreenbutton,
                              borderRadius: BorderRadius.circular(40)),
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
              )
        ],
      ),
    );
  }
}
