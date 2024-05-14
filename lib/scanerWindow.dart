import 'package:flutter/material.dart';

class scanerWindow extends StatelessWidget {

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
                                          icon: Icon(Icons.facebook),
                                          onPressed: () {
                                            // Aquí va el enlace a la página de Facebook
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.gite),
                                          onPressed: () {
                                            // Aquí va el enlace a la página de GitHub
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.gite),
                                          onPressed: () {
                                            // Aquí va el enlace a la página de LinkedIn
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.gite),
                                          onPressed: () {
                                            // Aquí va el enlace a la página de Instagram
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
                                          icon: Icon(Icons.facebook),
                                          onPressed: () {
                                            // Aquí va el enlace a la página de Facebook
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.gite),
                                          onPressed: () {
                                            // Aquí va el enlace a la página de GitHub
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.gite),
                                          onPressed: () {
                                            // Aquí va el enlace a la página de LinkedIn
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.gite),
                                          onPressed: () {
                                            // Aquí va el enlace a la página de Instagram
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
                                  padding: EdgeInsets.only(left: 25), // Ajusta este valor al padding que desees
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
                                  children: List.generate(5, (index) {
                                    List<IconData> icons = [
                                      Icons.cake,
                                      Icons.cake,
                                      Icons.cake,
                                      Icons.cake,
                                      Icons.cake,
                                    ];
                                    return Padding(
                                      padding: EdgeInsets.only(right: 8),
                                      child: Icon(icons[index], color: Colors.white),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


