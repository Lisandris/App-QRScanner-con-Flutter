import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/direcciones_page.dart';
import 'package:qr_scanner/pages/mapas_page.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
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
            icon: const Icon( Icons.delete_forever_rounded),
            onPressed: (){ 

              Provider.of<ScanListProvider> ( context, listen: false).borrarTodos();

            }
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
      
      // TODO temporal leer la base de datos
      //  final tempscan = new ScanModel(valor: 'https://healhybelleza.com/'); 
      //  el new es opcional
      // accionames el metodo nuevoScan para insertarlo en la base de datos
      // DBProvider.db.deleteAllScans().then( print); 
      
      // Usar el ScanListProvider
      final scanListProvider = Provider.of<ScanListProvider>(context, listen: false );

      switch( currentIndex ) {
        
        case 0:
        scanListProvider.cagarScansPorTipo('geo');
          return const MapasPage();

        case 1:
        scanListProvider.cagarScansPorTipo('http');
            return const DireccionesPage();

        default:
          return const MapasPage();
      }
  }
}