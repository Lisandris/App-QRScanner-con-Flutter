import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text( 'Historial' ),
        actions: [
          IconButton(
            icon: Icon( Icons.delete_forever_rounded),
            onPressed: (){ }
          )
        ],
      ),
      body: Center(
        child: Text('Home page'),
     ),
     bottomNavigationBar: CustomNavigatorBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     
   );
  }
}