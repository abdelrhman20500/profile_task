import 'package:flutter/material.dart';
class BuildRow extends StatelessWidget {
  BuildRow({super.key,required this.icon, required this.text,required this.iconData, this.onTap});

  IconData icon;
  String text;
  IconData iconData;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon,size: 40,color: Colors.black,),
          SizedBox(width: MediaQuery.of(context).size.width*0.08,),
          Text(text, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),),
          const Spacer(),
          Icon(iconData,color: Colors.black,)
        ],
      ),
    );
  }
}
