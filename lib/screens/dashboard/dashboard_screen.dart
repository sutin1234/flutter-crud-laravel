import 'package:flutter/material.dart';
import 'package:flutter_stock/screens/bottomnav/account/account_screen.dart';
import 'package:flutter_stock/screens/bottomnav/home/home_screen.dart';
import 'package:flutter_stock/screens/bottomnav/notification/notification_screen.dart';
import 'package:flutter_stock/screens/bottomnav/setting/setting_screen.dart';
import 'package:flutter_stock/screens/bottomnav/stock/stock_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  SharedPreferences sharePref;

  // สร้างตัวแปร List เก็บรายการหน้าที่ต้องการเปลี่ยนใน Bottom Navigationbar
  int currentIndex = 0;
  String title;
  String storeName, storeEmail;
  bool authLogin;

  @override
  void initState() {
    super.initState();
    title = "DashBoard";
    checkAuthLogin();
  }

  // Switch Tabs pages
  final List<Widget> pageList = [
    HomeScreen(),
    StockScreen(),
    NotificationScreen(),
    SettingScreen(),
    AccountScreen()
  ];

  // สร้าง method สำหรับการเปลี่ยนหน้า
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      switch (index) {
        case 0:
          title = 'หน้าหลัก';
          break;
        case 1:
          title = 'สต๊อกสินค้า';
          break;
        case 2:
          title = 'แจ้งเตือน';
          break;
        case 3:
          title = 'ตั้งค่า';
          break;
        case 4:
          title = 'ฉัน';
          break;
      }
    });
  }

// Check AuthLogin
  checkAuthLogin() async {
    sharePref = await SharedPreferences.getInstance();
    if (sharePref.getBool('authLogin') == false ||
        sharePref.getBool('authLogin') == null) {
      Navigator.pushNamed(context, '/login');
    }

    setState(() {
      storeName = sharePref.getString('storeName');
      storeEmail = sharePref.getString('storeEmail');
      authLogin = sharePref.getBool('authLogin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.kanit(),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharePref.clear();
              Navigator.pushNamed(context, '/login');
            },
            child: Text(
              "ออกจากระบบ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: SafeArea(
          child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://image.freepik.com/free-vector/profile-icon-male-avatar-hipster-man-wear-headphones_48369-8728.jpg'),
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.megapixl.com/4707/47075236.jpg'),
                  ),
                )
              ],
              accountName: Text(storeName),
              accountEmail: Text(storeEmail),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.vickyalvearshecter.com/wp-content/uploads/2015/02/2012-06-08_0000066-as-Smart-Object-1-600x400.jpg'),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('เกี่ยวกับเรา'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('ข้อมูลการใช้งาน'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/term');
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('ติดต่อทีมงาน'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('ออกจากระบบ'),
              onTap: () {},
            ),
            Divider(
              color: Colors.green[200],
            ),
            ListTile(
              leading: Icon(Icons.cancel),
              title: Text('ปิดเมนู'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      )),
      body: pageList[currentIndex],
      // ส่วนของ Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('หน้าหลัก')),
            BottomNavigationBarItem(
                icon: Icon(Icons.storage), title: Text('สต็อก')),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text('แจ้งเตือน')),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), title: Text('ตั้งค่า')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('ฉัน')),
          ]),
    );
  }
}
