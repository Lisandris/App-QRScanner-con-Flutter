import 'package:flutter/material.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';


// ScanModel scan contiene la informacion del scan 
launcherUrl( BuildContext context, ScanModel scan ) async {

  if(scan.tipo == 'http') {
    final String url = scan.valor; // obtenermos el string de la url
    // final String url = 'https://healthybelleza.com'; // obtenermos el string de la url
    print('Soy la URL sin Procesar: $url'); 
    final Uri uri = Uri.parse(url); // tomamos el string y lo convertimos en formato Uri  
    print('Soy el URI procesaro: $uri');
    // funcion propia del paquete
    if (!await launchUrl(uri) ) {
      throw 'Could not launch $url';
    }
  
  }else{
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }


}
