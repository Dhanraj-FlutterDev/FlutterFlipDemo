import 'package:flip_box_bar_plus/flip_box_bar_plus.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlipDemo(),
    );
  }
}

class FlipDemo extends StatefulWidget {
  @override
  _FlipDemoState createState() => _FlipDemoState();
}

class _FlipDemoState extends State<FlipDemo> {

  int currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            currentPage = index;
          });
        },
        children: [
          Center(
            child: Text('Home Selected',style: TextStyle(fontSize: 30),),
          ),
          Center(
            child: Text('Notification Selected',style: TextStyle(fontSize: 30),),
          ),
          Center(
            child: Text('Message Selected',style: TextStyle(fontSize: 30),),
          ),
          Center(
            child: Text('People Selected',style: TextStyle(fontSize: 30),),
          ),
          Center(
            child: Text('Settings Selected',style: TextStyle(fontSize: 30),),
          ),
        ],
      ),
      bottomNavigationBar: FlipBoxBarPlus(
          items: [
           FlipBarItem(icon: Icon(Icons.home),
               text: Text('Home'),
           frontColor: Colors.pink,
             backColor: Colors.pinkAccent
           ),
            FlipBarItem(icon: Icon(Icons.notifications),

                text: Text('Notification'),
            frontColor: Colors.yellow,
              backColor: Colors.yellowAccent
            ),
            FlipBarItem(icon: Icon(Icons.message),

                text: Text('Message'),
                frontColor: Colors.red,
                backColor: Colors.redAccent
            ),
            FlipBarItem(icon: Icon(Icons.people),

                text: Text('People'),
                frontColor: Colors.blue,
                backColor: Colors.blueAccent
            ),
            FlipBarItem(icon: Icon(Icons.settings),

                text: Text('Settings'),
                frontColor: Colors.purple,
                backColor: Colors.purpleAccent
            ),

          ],
          onIndexChanged: (index){
            setState(() {
              currentPage = index;
            });
            _pageController.jumpToPage(index);
          },
          selectedIndex: currentPage),
    );
  }
}


















