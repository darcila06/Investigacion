import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Juegos de suma cero';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juegos de suma cero'),
        actions: <Widget>[],
      ),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Text(""),
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage("assets/images/konrad.png"),
              )),
        ),
        ListTile(
          title: Text('Juegos 2x2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
          leading: GestureDetector(
            child: Container(
              width: 48,
              height: 48,
              padding: EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              child: CircleAvatar(child: Icon(Icons.table_chart_outlined)),
            ),
          ),
        ),
        ListTile(
          title: Text('Juegos 3x3'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
          leading: GestureDetector(
            child: Container(
              width: 48,
              height: 48,
              padding: EdgeInsets.symmetric(vertical: 4.0),
              alignment: Alignment.center,
              child: CircleAvatar(
                child: Icon(Icons.table_chart_outlined),
              ),
            ),
          ),
        ),
      ])),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_outlined),
            label: 'Juegos 2x2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart_outlined),
            label: 'Juegos 3x3',
          ),
        ],
      ),
    );
  }
}
