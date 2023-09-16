import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  MyHomePage(title: 'Flutter nav bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _SelectedIndex = 0;
  List Items = [
    Text('home', selectionColor: Colors.blue,),
    Text('Favourite'),
    Text('SearchScreen'),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _SelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child:Items.elementAt(_SelectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.cyan,
            icon: Icon(Icons.home, color: Colors.brown,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.red,),
            label: 'Favourite',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.blueGrey,),
            label: 'Search',
            backgroundColor: Colors.lightBlue
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _SelectedIndex,
        selectedItemColor: Colors.blue[800],
        iconSize: 30,
        onTap: _onItemTapped,
        elevation: 3,
        mouseCursor: SystemMouseCursors.grab,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
