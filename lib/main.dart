import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/mapa_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Scanner',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => HomePage(),
        'mapa': ( _ ) => MapaPage(),
      },
      theme: ThemeData(  /* Tema principal */
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 184, 8, 66)
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor:Color.fromARGB(255, 184, 8, 66),
          unselectedItemColor: Color.fromARGB(255, 224, 97, 139) 
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 184, 8, 66)
        )
      ),
    );
  }
}