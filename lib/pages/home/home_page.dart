import 'package:ferme_vaches_mobile/pages/cart/cart_history.dart';
import 'package:ferme_vaches_mobile/pages/home/main_home_page.dart';
import 'package:ferme_vaches_mobile/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late PersistentTabController _controller;

  List pages = [
    MainHomePage(),
    Container(child: Center(child: Text('Page Historique'))),
    CartHistory(),
    Container(child: Center(child: Text('Page espace client')))
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /* @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.mainColor,
            unselectedItemColor: Colors.amberAccent,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0.0,
            unselectedFontSize: 0.0,
            currentIndex: _selectedIndex,
            onTap: onTapNav,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Accueil",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive),
                label: "Historique",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Panier",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Moi",
              ),
            ]));
  }
  /*
  List<Widget> _buildScreens() {
    return [
      MainHomePage(),
      Container(child: Center(child: Text('Page suivante'))),
      Container(child: Center(child: Text('Page suivante 1'))),
      Container(child: Center(child: Text('Page suivante 2'))),
      //Container(child: Center(child: Text('Page suivante 3'))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Accueil"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill),
        title: ("Historique"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Panier"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Moi"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }*/
}
