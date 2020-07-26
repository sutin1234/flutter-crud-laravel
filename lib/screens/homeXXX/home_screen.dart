import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.purple,
          // backgroundColor: Color.fromARGB(0xff, 230, 300, 390),
          // backgroundColor: Color.fromRGBO(230, 230, 290, 0.5),
          // backgroundColor: Color(0xffb74093),
          // backgroundColor: Color(0xffE60FAD),
          leading: Icon(Icons.home),
          title: Text('Home Flutter'),
          actions: <Widget>[
            IconButton(icon: Icon(
              Icons.notifications), 
              onPressed: (){
                print('Your click notification');
              }
            )
          ],
        ),
        body: Center(
          child: Text("Hello Flutter")
        ),
    );
  }
}