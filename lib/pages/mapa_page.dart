import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  // con el controller podemos editar camara y demas
Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {

    final ScanModel? scan = ModalRoute.of(context)!.settings.arguments as ScanModel?;
    
    final CameraPosition puntoInicial = CameraPosition(
      target: scan!.getLatLng(),
      zoom: 17.5,
      tilt: 50  /* grado de inclinacion */
    );

    // Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng()
    ));

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
   );
  }
}