import 'package:flutter/material.dart';
import 'package:user/homepage.dart';
import 'package:user/queuepage.dart';
import 'package:user/visitpage.dart';
import 'package:user/profilepage.dart';

class MainNav extends StatefulWidget {
  final int startIndex;

  const MainNav({super.key, this.startIndex = 0});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  late int index;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    index = widget.startIndex;

    pages = const [
      HomePage(),
      QueuePage(),
      VisitPage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (i) {
          setState(() {
            index = i;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Queue",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Visit",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
