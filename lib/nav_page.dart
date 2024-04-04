import 'package:flutter/material.dart';
import 'package:ud_vote/pages/results.dart';
import 'package:ud_vote/pages/stats.dart';
import 'package:ud_vote/pages/explore.dart';
import 'package:ud_vote/pages/home.dart';


class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int currentIndex = 0;

  final tabs = [

    const Home(),
    const Results(),
    const Stats(),
    const Explore(),


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xff898989),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.indigo,
        items: [

          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'home'.toUpperCase()
          ),


          BottomNavigationBarItem(
              icon: const Icon(Icons.library_books_sharp),
              label: 'results'.toUpperCase()
          ),


          BottomNavigationBarItem(
              icon: const Icon(Icons.insert_chart_outlined_outlined),
              label: 'stats'.toUpperCase()
          ),


          BottomNavigationBarItem(
              icon: const Icon(Icons.explore),
              label: 'explore'.toUpperCase()
          ),
        ],

        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },

      ),
    );
  }
}
