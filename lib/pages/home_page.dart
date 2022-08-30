import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/mapas_page.dart';
import 'package:qr_scanner/providers/ui_providers.dart';
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
      body: _HomePageBody(),

     bottomNavigationBar: CustomNavigationBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

      // Obtener el selected menu opt
      final uiProvider = Provider.of<UiProvider>(context);

      // Cambiar para mostrar la pag respectiva
      final currentIndex = uiProvider.selectedMenuOpt;
      

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