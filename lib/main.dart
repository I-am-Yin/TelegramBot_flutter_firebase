import 'package:flutter/material.dart';
import 'package:wireless/404%20Page.dart';
import 'package:wireless/HomePage.dart';
import 'package:wireless/SkipPage.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(backgroundColor:Colors.transparent),
          backgroundColor: Colors.black,
          primaryColor: Colors.white,
          accentColor: Colors.white
      ),
        debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _fbApp,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print('You have an error! ${snapshot.error.toString()}');
            return Text('Somthing went wrong!');
          } else if (snapshot.hasData){
            return HomePage();
          } else{
            return ErrorPage();
          }
        },
      )
    );
  }
}


