import 'package:flutter/material.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/mapas_page.dart';
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
      body: DireccionesPage(),

     bottomNavigationBar: CustomNavigationBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      // Cambiar para mostrar la pag respectiva
      final currentIndex = 1;

      switch( currentIndex ) {
        
        case 0:
          return MapasPage();

         case 1:
            return DireccionesPage();

        default:
        return MapasPage();
      }
  }
}