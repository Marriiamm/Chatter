import 'package:chatter/models/message.dart';
import 'package:flutter/material.dart';
import '../consts.dart';

class msgBuble extends StatelessWidget {
  const msgBuble({
    required this.message,
    super.key,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(top: 20,bottom: 20,left: 15,right: 10),
              decoration: BoxDecoration(
                color: klightclr,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                  )
              ),
              child: Text(message.text,style: TextStyle(fontFamily: "Exo2"),)),
          ),
        ),
      ],
    );
  }
}



class MsgBubleFriend extends StatelessWidget {
  const MsgBubleFriend({
    required this.message,
    super.key,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(top: 20,bottom: 20,left: 15,right: 10),
              decoration: BoxDecoration(
                color: kSecondryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
                  )
              ),
              child: Text(message.text,style: TextStyle(fontFamily: "Exo2"),)),
          ),
        ),
      ],
    );
  }
}