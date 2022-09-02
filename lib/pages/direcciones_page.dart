import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final scanListProvider = Provider.of<ScanListProvider>(context);
   final scans =scanListProvider.scans;


    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Color.fromARGB(255, 224, 97, 139),
        ),
        onDismissed: (DismissDirection direction ){
          Provider.of<ScanListProvider>(context, listen: false)
            .borrarScanPorId(scans[i].id);
        },
        child: ListTile(
          leading: Icon( Icons.home_outlined, color: Theme.of(context).primaryColor ),
          title: Text( scans[i].valor),
          subtitle: Text( scans[i].id.toString()),
          trailing: Icon(Icons.keyboard_arrow_right, color: Theme.of(context).primaryColor,),
          onTap: () => print( scans[i].id),
        ),
      )
    );
  }
}




    