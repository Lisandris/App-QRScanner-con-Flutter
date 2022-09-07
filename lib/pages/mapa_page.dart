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
      zoom: 18,
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
        title: const Text('Mapa'),
        actions: [
          IconButton(
            icon: Icon( Icons.location_on_outlined),
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
               controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: scan.getLatLng(),
                      zoom: 18,
                      tilt: 50
                    )
                  )
                );
            }
          )
        ],
      ),
      body: GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers ),
        onPressed: (){
          
        }
       ),
   );
  }
}