import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 var pages = [
  '/about',
  '/media_layout',
  '/media_query',
  '/media_query',
  '/media_query',
  '/media_query',
  '/media_query',
  '/media_query'
 ];


  var services = [
    "Animation",
    "Google Map",
    "QR/Barcode Scan",
    "Provider",
    "BLOC",
    "Redux",
    "Firebase",
    "Notification"
  ];

  // ignore: non_constant_identifier_names
  var IconData = [
    Icons.android,
    Icons.map,
    Icons.scanner,
    Icons.star_half,
    Icons.block,
    Icons.redeem,
    Icons.cloud,
    Icons.notifications
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        child: GridView.builder(
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.4)),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  print('onTabIndex: $index');
                  Navigator.pushNamed(context, pages[index]);
                },
                child: Card(
                  color: Colors.teal,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),
                      Icon(
                        IconData[index],
                        size: 30.0,
                        color: Colors.white,
                      ),
                      // Image.asset(
                      //   images[index],
                      //   height: 50,
                      //   width: 50,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          services[index],
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Montserrat",
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    ));
  }
}
