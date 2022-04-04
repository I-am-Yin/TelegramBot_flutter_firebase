import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';


class groupChat extends StatefulWidget {
  groupChat({Key? key}) : super(key: key);

  @override
  _groupChatState createState() => _groupChatState();
}

class _groupChatState extends State<groupChat> {
  String _displayText = 'Results go here';
  final _database = FirebaseDatabase.instance.reference();
  final databaseRef = FirebaseDatabase.instance.reference().child('chat_record');

  var messageController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    const DESCRIPATION_PATH = 'chat_record';
    _database.child(DESCRIPATION_PATH).onValue.listen((event) {
      setState(() {
        _displayText= 'Today\'s spesial: %test';
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background_image.jpeg'),
                fit: BoxFit.fill,
                opacity: 0.2

            ),
          ),
          child: FirebaseAnimatedList(query: databaseRef ,itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
              child: ListTile(
                  tileColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(20.0),
                  )),
                  title: Text(snapshot.value['title'], style: TextStyle(fontSize: 17, color: Colors.lightGreen)),
                  subtitle: Text(snapshot.value['from'] + ' : '+ snapshot.value['text'], style: TextStyle(fontSize: 15, color: Colors.white70),),
                  trailing: Text(snapshot.value['date'], style: TextStyle(fontSize: 8, color: Colors.pinkAccent))
              ),
            );
          },),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onButtonPressed(),
        child: Icon(Icons.create),
      ),
    );
  }

  void _onButtonPressed(){
    showModalBottomSheet(context: context, builder: (context){
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          margin: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background_image.jpeg'),
                fit: BoxFit.fill,
                opacity: 0.2,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.colorBurn)
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
          ),
          height: 380,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: TextFormField(
                  autofocus: true,
                  controller: messageController,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    icon: Icon(Icons.key, color: Colors.grey,),
                    hintText: 'Message',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send,color: Colors.pinkAccent,),
                      onPressed: (){
                        if(messageController.text.isNotEmpty){
                          insertData(messageController.text);
                        } else{
                          print('error');
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
  void insertData(String message){
    _database.child('data_need_to_send').set({
      'message' : message
    });
    messageController.clear();
  }
}





