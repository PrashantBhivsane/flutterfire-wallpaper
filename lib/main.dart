import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_one/pages/category.dart';
import 'package:test_one/pages/settings.dart';
import 'package:test_one/pages/wallscreen.dart';
import 'package:test_one/utils/expandignav.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

            primaryColor: Colors.black,
            accentColor: Colors.grey,

      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems()
  {
    return
        [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home')
          )
          ,BottomNavigationBarItem(
            icon: new Icon(Icons.dashboard),
            title: new Text('Categories')
        )
          ,BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings')
        )
        ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView()
  {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[WallScreen(),Category(),Settings()],
    );
  }

  void pageChanged(int index)
  {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index)
  {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Icon(Icons.dashboard),
            ),
            Text('Papers'),
            Padding(
              padding: const EdgeInsets.all(2.0),
            )

          ],
        ),

      ),
      body: buildPageView(),
      bottomNavigationBar: ExpandingBottomBar(
        backgroundColor: Colors.white,
        navBarHeight: 60.0,
        items: [
          ExpandingBottomBarItem(
            icon: Icons.home,
            text: "Home",
            selectedColor: Colors.white,
          ),
          ExpandingBottomBarItem(
            icon: Icons.category,
            text: "Categories",
            selectedColor: Colors.white,
          ),
          ExpandingBottomBarItem(
            icon: Icons.settings,
            text: "Settings",
            selectedColor: Colors.white,
          ),
        ],
        selectedIndex: bottomSelectedIndex,
        onIndexChanged: bottomTapped,
      ),

      floatingActionButton: FloatingActionButton(

        onPressed: _incrementCounter,
        mini: true,
        child: Icon(Icons.keyboard_arrow_up),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
       );

  }
}

class Home extends StatefulWidget
{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: Colors.white,
    );
  }
}



