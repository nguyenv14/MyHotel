import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_hotel/view/home/home_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> _pages = [const HomePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        children: _pages,
        index: currentIndex,
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: (p0) => setState(() {
                currentIndex = p0;
              }),
          items: [
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.hotel),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.cartFlatbed),
              title: Text("My trip"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.solidHeart),
              title: Text("Favorite"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: Icon(FontAwesomeIcons.solidUser),
              title: Text("Profile"),
              selectedColor: Colors.pink,
            ),
          ]),
    );
  }
}
