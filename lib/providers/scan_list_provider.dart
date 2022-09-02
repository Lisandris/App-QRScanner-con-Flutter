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

  // Esta asociado a la interfas de usuario
  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...scans!]; /* para crear un nuevo listado */
    notifyListeners(); /* para actualizar la pantalla */
  }

  cagarScansPorTipo ( String tipo ) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo); /* se encarga de hacer las interacciones con la db */
    this.scans = [...scans!];
    this.tipoSeleccionado = tipo; /*  El tipo que recibe como argumento */
    notifyListeners();
  }

  borrarTodos() async{
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners(); /* Indica que todos los scans estan vacios */
  }

  borrarScanPorId(int? id ) async {
    await DBProvider.db.deleteScan(id);
  }


}