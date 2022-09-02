import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

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
        final barcodeScanRes = ' https://healthybelleza.com';
       
        final scanListProvider = Provider.of<ScanListProvider>( context, listen: false );
        
        scanListProvider.nuevoScan(barcodeScanRes);
        scanListProvider.nuevoScan('geo:15.35.15.66');
      }
    );
  }
}