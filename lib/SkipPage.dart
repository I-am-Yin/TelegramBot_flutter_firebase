import 'package:flutter/material.dart';
import 'package:wireless/ContectPage/group.dart';

class SkipPage extends StatefulWidget {
  const SkipPage({Key? key}) : super(key: key);

  @override
  _SkipPageState createState() => _SkipPageState();
}


class _SkipPageState extends State<SkipPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: 80,
        height: 50,
        child: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            foregroundColor: Colors.white,
            focusColor: Colors.red,
            backgroundColor: Colors.white70.withOpacity(0.2),
            child: Icon(Icons.fingerprint, color: Colors.pinkAccent,),
            onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => groupChat()),);}),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.black,

      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15, 150, 120, 0.0),
                child: Text('Telegram', style: TextStyle(fontSize: 35, color: Colors.white),),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15, 200, 120, 0.0),
                child: Text('a cross-platform messaging service ', style: TextStyle(fontSize: 13, color: Colors.grey[400]),),
              ),
            ],
          ),
          Container(
            width: 500,
            height: 500,
            padding: EdgeInsets.only(top: 400),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://i.pinimg.com/originals/e5/6c/66/e56c66eba1bfa52934b9a709e7088d73.gif')
                )
            ),
          )
        ],
      ),
    );
  }
}