import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
         child: Text('เนื้อหาหน้าแจ้งเตือน'),
       ),
    );
  }
}