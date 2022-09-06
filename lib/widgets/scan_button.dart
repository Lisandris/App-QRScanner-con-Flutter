import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';


import '../providers/scan_list_provider.dart';


class ScanButton
 extends StatelessWidget {
   const ScanButton ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon( Icons.filter_center_focus),
      onPressed: () async {

        // String barcodeScanRes =  await FlutterBarcodeScanner.scanBarcode(
        //   '#ff6666', 'Cancelar', false, ScanMode.QR
        // );

        // final barcodeScanRes = 'https://healthybelleza.com';
        final barcodeScanRes = 'geo:4524+VMV';
       
        if ( barcodeScanRes == '-1')
        return;

        final scanListProvider = Provider.of<ScanListProvider>( context, listen: false );
        
        final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);

       launcherUrl(context, nuevoScan);
     
      }
    );
  }
}