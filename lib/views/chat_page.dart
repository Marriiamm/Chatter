import 'dart:developer';

import 'package:chatter/models/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../consts.dart';
import '../widgets/msg_bubble.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
   ChatPage({super.key, required this.email});

  CollectionReference messages = FirebaseFirestore.instance.collection(kCollectionMsgs);
  TextEditingController msgcontroller =TextEditingController();
  final _controller = ScrollController();
  final String email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kcreatTimeMsg,descending: true).snapshots(), 
      builder: (context ,snapshot){
        if(snapshot.hasData){
          List<Message> messagesList =[];
          for(int i =0; i< snapshot.data!.docs.length;i++){
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/chatbar.png",width: 70,height: 70,),
            Text("Chatter",style: TextStyle(color: klightclr,fontFamily: "Exo2"),),
            
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        constraints: const BoxConstraints.expand(),
            decoration:  BoxDecoration(
              image: DecorationImage(
                filterQuality: FilterQuality.high,
              image: AssetImage("assets/images/testchat.png"), 
              fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context,index){
                    return messagesList[index].id == email? 
                    msgBuble(message: messagesList[index],)
                    : MsgBubleFriend(message: messagesList[index],);
                          }),
              ),
              Container(
                color: kPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: msgcontroller,
                    onSubmitted: (data){
                      messages.add({
                        kMessage :data,
                        kcreatTimeMsg :DateTime.now(),
                        'id' : email
                      }).then((DocumentReference doc) =>
                         log('DocumentSnapshot added with ID: ${doc.id}'));
                        ;
                        msgcontroller.clear();
                        _controller.animateTo(
                          0, 
                          duration: Duration(seconds: 1), 
                          curve: Curves.fastOutSlowIn
                        );
                    },
                    decoration:InputDecoration(
                      hintText: "Send message",
                      hintStyle: TextStyle(color: Colors.white38,fontFamily: 'Exo2'),
                      suffixIcon: Icon(Icons.send_rounded,color: klightclr,),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color:klightclr,
                          width: 3, )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: klightclr,
                          width: 3,
                        )
                      )
                    ),
                  ),
                ),
              ),
            ],
          )
      ),
    );
        }else{
          return Container(child: Text(" not here"),);
        }
      }
      );
      
  }
}

