import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'scanerWindow.dart';
import 'inventoryWindow.dart';

class menuWindow extends StatefulWidget {
  @override
  _menuWindowState createState() => _menuWindowState();
}

class _menuWindowState extends State<menuWindow> {
  int? _selectedIndex = 0;

  void miFuncion(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildToggleSwitch() {
    return ToggleSwitch(
      minWidth: 115.0,
      cornerRadius: 20.0,
      activeBgColors: [[Color(0xffFF6996)], [Color(0xffFF6996)]],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.white,
      inactiveFgColor: Colors.black,
      initialLabelIndex: _selectedIndex,
      totalSwitches: 2,
      borderColor: [Color(0xff000000)],
      borderWidth: 1.0,
      labels: ['Escaner', 'Inventario'],
      customTextStyles: [
        TextStyle(fontFamily: 'Lemonr', fontSize: 15),
        TextStyle(fontFamily: 'Lemonr', fontSize: 15),
      ],
      radiusStyle: true,
      onToggle: (index) {
        miFuncion(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color(0xffDEDEDE),
            height: 1.0,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildToggleSwitch(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/Logotxt.png'),
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0 ? scanerWindow() : inventoryWindow(),
    );
  }
}