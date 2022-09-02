import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  nuevoScan( String valor ) async {

    // creando la instancia del nuevo scan
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    // asignar el ID de la base de datos al modelo
    nuevoScan.id = id!;

    if (tipoSeleccionado == nuevoScan.tipo ) {
      scans.add(nuevoScan);
      notifyListeners();
    }
  }


}