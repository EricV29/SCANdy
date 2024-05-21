import 'package:flutter/material.dart';
import 'inventoryWindow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scanerWindow extends StatefulWidget {
  @override
  _ScannerWindowState createState() => _ScannerWindowState();
}

class _ScannerWindowState extends State<scanerWindow> {
  String _scanBarcodeResult = '';

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#FF6996',
        'Cancel',
        true,
        ScanMode.BARCODE,
      );
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcodeResult = barcodeScanRes;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                      children: <Widget>[
                        Text('Hola, Ximena',
                          style: TextStyle(
                              color: Color(0xFFFF6996),
                              fontFamily: 'Lemonr',
                              fontSize: 30
                          ),
                        ),
                      ]
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.cake_outlined,
                        color: Color(0xFF8AE5EB),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  '¿Quiénes somos?',
                                  style: TextStyle(
                                      color: Color(0xFFFF6996),
                                      fontFamily: 'Lexendb',
                                      fontSize: 25
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                  children: <Widget>[
                                    Divider(  // Añade una línea gris
                                      color: Colors.grey,
                                      thickness: 2,
                                      endIndent: 20,
                                      indent: 20,
                                    ),
                                    Text(
                                      'Somos un dúo de estudiantes universitarios de la Escuela Superior de Tlahuelilpan de la UAEH, cursando la Licenciatura en Ingeniería de Software. Nos apasiona el diseño y desarrollo de software.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Lexendb',
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      'Edwin Yair Sandoval Muciño',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF8AE5EB),
                                        fontFamily: 'Lexendb',
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/linkedin.svg',
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          onPressed: () {
                                            launch('https://www.linkedin.com/in/yair-sandoval-2a63812a6/');
                                          },
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/github.svg',
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          onPressed: () {
                                            launch('https://github.com/YairSM20');
                                          },
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/facebook.svg',
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          onPressed: () {
                                            launch('https://www.facebook.com/yair.sandoval.9406');
                                          },
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/instagram.svg',
                                            height: 40.0,
                                            width: 40.0,
                                          ),
                                          onPressed: () {
                                            launch('https://www.instagram.com/yair.mucino/');
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Eric Jared Villeda Reyes',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF8AE5EB),
                                        fontFamily: 'Lexendb',
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/linkedin.svg',
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          onPressed: () {
                                            launch('https://www.linkedin.com/in/eric-villeda-reyes-584856281/');
                                          },
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/github.svg',
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          onPressed: () {
                                            launch('https://github.com/EricV29');
                                          },
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/facebook.svg',
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                          onPressed: () {
                                            launch('https://www.facebook.com/eric.villedareyes/');
                                          },
                                        ),
                                        IconButton(
                                          icon: SvgPicture.asset(
                                            'assets/instagram.svg',
                                            height: 40.0,
                                            width: 40.0,
                                          ),
                                          onPressed: () {
                                            launch('https://www.instagram.com/ericvilledareyes/');
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          '¿Quiénes somos?',
                          style: TextStyle(
                              color: Color(0xFF8AE5EB),
                              fontSize: 15,
                            fontFamily: 'Lexendr',
                          ),
                        ),
                      ),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 15,
                          offset: Offset(-3, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'SCANdy ',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Lexendb',
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'es una aplicación que te permite escanear tus productos de repostería favoritos. Además, te proporciona las mejores recetas, incluyendo tus favoritas, que puedes preparar en tu propia cocina.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lexendr',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF8AE5EB),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 25),
                                  child: Text(
                                    '¿Qué es SCANDY?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontFamily: 'Lexendb',
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    'assets/cake.svg',
                                    'assets/strawberry.svg',
                                    'assets/orange.svg',
                                    'assets/juice.svg',
                                    'assets/cake.svg',
                                    'assets/cake.svg',
                                    'assets/strawberry.svg',
                                  ].asMap().entries.map((entry) {
                                    int idx = entry.key;
                                    String asset = entry.value;
                                    return Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Transform.rotate(
                                        angle: (idx % 2 == 0) ? -math.pi / 3 : math.pi / 3,  // 60 grados en radianes
                                        child: SvgPicture.asset(
                                          asset,
                                          height: 18.0,
                                          width: 18.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 15,
                          offset: Offset(-3, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Image.asset('assets/bars.png'),
                        ),
                      ],
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                        onTap: () async {
                          await scanBarcodeNormal();
                          //Navigator.push(
                          //                             context,
                          //                             MaterialPageRoute(builder: (context) => inventoryWindow()),
                          //                           );
                        },
                        child: Container(
                          width: constraints.maxWidth,
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF6996),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 15,
                                offset: Offset(-3, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text('Escanear producto',
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 27,
                                      fontFamily: 'Lemonr',
                                    ),
                                  ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Text('Scan result: $_scanBarcodeResult\n'),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


