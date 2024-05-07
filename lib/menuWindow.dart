import 'package:flutter/material.dart';

class menuWindow extends StatefulWidget {
  @override
  _menuWindowState createState() => _menuWindowState();
}

class _menuWindowState extends State<menuWindow> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
          side: BorderSide(color: Color(0xffDEDEDE), width: 1),
        ),
        actions: [
          ToggleButtons(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Escaner'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Inventario'),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            isSelected: [_selectedIndex == 0, _selectedIndex == 1],
            color: Colors.black,
            selectedColor: Colors.white,
            fillColor: Colors.pink,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/Logotxt.png'),
          ),
        ],
      ),
      body: _selectedIndex == 0 ? PantallaEscaner() : PantallaInventario(),
    );
  }
}

class PantallaEscaner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pantalla Escaner'),
    );
  }
}

class PantallaInventario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Pantalla Inventario'),
    );
  }
}
