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
      body: Dosxdos(),
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
            Navigator.of(context).pop();
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

class Dosxdos extends StatefulWidget {
  @override
  _DosxdosState createState() => _DosxdosState();
}

class _DosxdosState extends State<Dosxdos> {
  final c1f1 = TextEditingController();
  final c2f1 = TextEditingController();
  final c1f2 = TextEditingController();
  final c2f2 = TextEditingController();
  final maximin1 = TextEditingController();
  final maximin2 = TextEditingController();
  final minimax1 = TextEditingController();
  final minimax2 = TextEditingController();
  final silla = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: {0: FractionColumnWidth(0.3)},
            border: TableBorder.all(),
            children: [
              TableRow(children: [
                Text(''),
                Text('Estrategia 1'),
                Text('Estrategia 2'),
                Text('MaxiMin')
              ]),
              TableRow(children: [
                Text('Estrategia 1'),
                TextField(
                  controller: c1f1,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: c2f1,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: maximin1,
                  enableInteractiveSelection: false,
                  enabled: false,
                )
              ]),
              TableRow(children: [
                Text('Estrategia 2'),
                TextField(
                  controller: c1f2,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: c2f2,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: maximin2,
                  enableInteractiveSelection: false,
                  enabled: false,
                )
              ]),
              TableRow(children: [
                Text('MiniMax'),
                TextField(
                  controller: minimax1,
                  enableInteractiveSelection: false,
                  enabled: false,
                ),
                TextField(
                  controller: minimax2,
                  enableInteractiveSelection: false,
                  enabled: false,
                ),
                TextField(
                  enableInteractiveSelection: false,
                  enabled: false,
                )
              ])
            ],
          ),
          TextField(
            controller: silla,
            enableInteractiveSelection: false,
            enabled: false,
          ),
          RaisedButton(
            onPressed: () {
              ResolverJuego();
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('Enviar Juego', style: TextStyle(fontSize: 20)),
            ),
          ),
          RaisedButton(
            onPressed: () {
              ReiniciarJuego();
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('Reiniciar Juego', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }

  ResolverJuego() async {
    int v1f1 = int.parse(c1f1.text);
    int v2f1 = int.parse(c2f1.text);
    int v1f2 = int.parse(c1f2.text);
    int v2f2 = int.parse(c2f2.text);
    int maximinuno = 0;
    int maximindos = 0;
    int minimaxuno = 0;
    int minimaxdos = 0;
    int minimax = 0;
    int maximin = 0;

    if (v1f1 < v2f1) {
      maximin1.text = c1f1.text;
      maximinuno = v1f1;
    } else {
      maximin1.text = c2f1.text;
      maximinuno = v2f1;
    }

    if (v1f2 < v2f2) {
      maximin2.text = c1f2.text;
      maximindos = v1f2;
    } else {
      maximin2.text = c2f2.text;
      maximindos = v2f2;
    }

    if (v1f1 > v1f2) {
      minimax1.text = c1f1.text;
      minimaxuno = v1f1;
    } else {
      minimax1.text = c1f2.text;
      minimaxuno = v1f2;
    }

    if (v2f1 > v2f2) {
      minimax2.text = c2f1.text;
      minimaxdos = v2f1;
    } else {
      minimax2.text = c2f2.text;
      minimaxdos = v2f2;
    }

    if (minimaxuno < minimaxdos) {
      minimax = minimaxuno;
    } else {
      minimax = minimaxdos;
    }
    if (maximinuno > maximindos) {
      maximin = maximinuno;
    } else {
      maximin = maximindos;
    }

    if (minimax == maximin) {
      silla.text = "Hay punto de silla en " +
          minimax.toString() +
          " y en " +
          maximin.toString();
    } else {
      silla.text = "No hay punto de silla";
    }
    print(silla.text);
  }

  void ReiniciarJuego() {
    c1f1.text = "";
    c2f1.text = "";
    c1f2.text = "";
    c2f2.text = "";
    maximin1.text = "";
    maximin2.text = "";
    minimax1.text = "";
    minimax2.text = "";
    silla.text = "";
  }
}

