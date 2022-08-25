import 'package:flutter/material.dart';
import 'package:qr_scanner/widgets/custom_navigationbar.dart';
import 'package:qr_scanner/widgets/scan_button.dart';


class HomePage extends StatelessWidget {

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
     bottomNavigationBar: CustomNavigationBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}