import 'package:flutter/material.dart';
import 'package:flutter_real_state_ui/style.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    List<Widget> _buildScreens() {
      return [
        const FirstScreen(),
        const SecondScreen(),
        const FirstScreen(),
        const SecondScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          activeColorPrimary: Colors.white,
          inactiveIcon: const Icon(Icons.home_outlined),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search_rounded),
          activeColorPrimary: Colors.white,
          inactiveIcon: const Icon(Icons.search_rounded),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.bookmark),
          activeColorPrimary: Colors.white,
          inactiveIcon: const Icon(Icons.bookmark_border_outlined),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          activeColorPrimary: Colors.white,
          inactiveIcon: const Icon(Icons.person_outline_rounded),
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: primaryColor,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      // decoration: NavBarDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   colorBehindNavBar: Colors.white,
      // ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Location', style: iconTitleStyle),
                          Text('Los Angeles, CA',
                              style: primarySmallTitleStyle),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        maxRadius: width * 0.07,
                        child: const Icon(Icons.person, color: primaryColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: width * 0.45),
                  alignment: Alignment.centerLeft,
                  width: width,
                  child: const Text(
                    'Discover Best Suitable Property',
                    style: primaryBigTitleStyle,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      maxRadius: width * 0.07,
                      backgroundColor: primaryColor,
                      child: Image.asset('img1.png', width: width * 0.09),
                    ),
                    CircleAvatar(
                      maxRadius: width * 0.07,
                      backgroundColor: primaryColor,
                      child: Image.asset('img2.png', width: width * 0.09),
                    ),
                    CircleAvatar(
                      maxRadius: width * 0.07,
                      backgroundColor: primaryColor,
                      child: Image.asset('img3.png', width: width * 0.09),
                    ),
                    CircleAvatar(
                      maxRadius: width * 0.07,
                      backgroundColor: primaryColor,
                      child: Image.asset('img4.png', width: width * 0.09),
                    ),
                    CircleAvatar(
                      maxRadius: width * 0.07,
                      backgroundColor: primaryColor,
                      child: Image.asset('img5.png', width: width * 0.09),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Best for you', style: primarySmallTitleStyle),
                    Text('View More', style: iconTitleStyle),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(width * 0.05),
                      child: Image.asset(
                        'pic3.jpg',
                        fit: BoxFit.cover,
                        width: width * 0.8,
                        height: height * 0.4,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: width * 0.8,
                        height: height * 0.12,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(width * 0.05),
                            bottomLeft: Radius.circular(width * 0.05),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(width * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('CRAFTSMAN HOUSE',
                                  style: whitTitleStyle),
                              const Text(
                                '520 ZN Beaudry Ave, Los Angeles',
                                style: desc1WhiteStyle,
                              ),
                              SizedBox(height: height * 0.01),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.bed, color: iconColor),
                                      Text('4 Beds', style: desc2WhiteStyle)
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.bathroom, color: iconColor),
                                      Text('2 Baths', style: desc2WhiteStyle)
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(Icons.garage, color: iconColor),
                                      Text('1 Garage', style: desc2WhiteStyle)
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Nearby your location', style: primaryTitleStyle),
                    Text('View More', style: iconTitleStyle),
                  ],
                ),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.04),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(width * 0.03),
                          child: Image.asset(
                            'pic2.jpg',
                            width: width * 0.2,
                            height: height * 0.1,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: width * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('RANCH HOME',
                                style: primarySmallTitleStyle),
                            SizedBox(height: height * 0.02),
                            const Text(
                              '904 Beverly Hills Los Angeles',
                              style: iconTitleStyle,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String desc =
        'Urwex verifies personal profiles, maintains a smart messaging system so brokers can talk with confidence, and collects and transfers payments securely';
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width * 0.1),
                      bottomRight: Radius.circular(width * 0.1),
                    ),
                    child: Image.asset(
                      'pic4.jpg',
                      width: width,
                      height: height * 0.43,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(width * 0.022),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(width),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: width * 0.05,
                            color: Colors.grey[900],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(width * 0.02),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(width),
                          ),
                          child: Icon(
                            Icons.bookmark_border_outlined,
                            size: width * 0.05,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.015,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('CRAFTMAN HOUSE', style: primaryTitleStyle),
                    const Text(
                      '520 N Beaudry Ave, Los Angeles',
                      style: primarySmallTitleStyle,
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.bed, color: iconColor),
                            Text('4 Beds', style: iconTitleStyle)
                          ],
                        ),
                        SizedBox(width: width * 0.02),
                        Row(
                          children: const [
                            Icon(Icons.bathroom_rounded, color: iconColor),
                            Text('2 Bath', style: iconTitleStyle)
                          ],
                        ),
                        SizedBox(width: width * 0.02),
                        Row(
                          children: const [
                            Icon(Icons.garage_rounded, color: iconColor),
                            Text('4 Garage', style: iconTitleStyle)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.person,
                                  color: primaryColor, size: width * 0.06),
                              maxRadius: width * 0.05,
                              backgroundColor: Colors.grey,
                            ),
                            SizedBox(width: width * 0.01),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('John Smith',
                                    style: primarySmallTitleStyle),
                                Text('Owner Craftnan House',
                                    style: iconTitleStyle),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(width * 0.03),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(Icons.call, color: Colors.white),
                              Text('Call', style: desc2WhiteStyle)
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                      child: Text(desc, style: iconTitleStyle),
                    ),
                    SizedBox(height: height * 0.01),
                    Text('Gallery', style: primarySmallTitleStyle),
                    SizedBox(height: height * 0.01),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              child: Image.asset(
                                'pic1.jpg',
                                width: width * 0.1,
                                height: height * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              child: Image.asset(
                                'pic2.jpg',
                                width: width * 0.1,
                                height: height * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              child: Image.asset(
                                'pic3.jpg',
                                width: width * 0.1,
                                height: height * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(width * 0.03),
                              child: Image.asset(
                                'pic5.jpg',
                                width: width * 0.1,
                                height: height * 0.1,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
