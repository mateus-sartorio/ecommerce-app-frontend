import 'package:ecommerce_app/components/bottom_navbar.dart';
import 'package:ecommerce_app/pages/cart_page.dart';
import 'package:ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavbar(onTabChange: (index) => navigateBottomBar(index)),
      body: _pages[_selectedIndex],
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
          )),
      drawer: Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // logo
              Column(
                children: [
                  DrawerHeader(
                      child: Image.asset(
                    "assets/images/nike-logo.png",
                    color: Theme.of(context).shadowColor,
                  )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                        leading: Icon(Icons.home), title: Text("Home")),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text("About"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                    leading: Icon(Icons.logout), title: Text("Logout")),
              ),
              //other pages
            ]),
      ),
    );
  }
}
