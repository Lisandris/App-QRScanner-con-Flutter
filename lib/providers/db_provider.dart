import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_scanner/models/scan_model.dart';
export 'package:qr_scanner/models/scan_model.dart';

class DBProvider{

  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if ( _database != null ) return _database;

    _database = await initDB();

    return _database;

  }

  Future<Database> initDB() async {

    // path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join( documentsDirectory.path, 'ScansDB.db' );
    print( path );
    print('lisa: $path');

    // crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) { },
      onCreate:  (Database db, int version) async{

        await  db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )

        ''');
      }
    );



  }

  Future<int?> nuevoScanRaw( ScanModel nuevoScan) async {

    final id    = nuevoScan.id;
    final tipo  = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    // verificar base de datos
    final db = await database;

    final res = await db?.rawInsert('''
       INSERT INTO Scans( id, tipo, valor)
        VALUES ($id, '$tipo', '$valor') 
    ''');
    return res;
  }

  Future<int?> nuevoScan( ScanModel nuevoScan) async {

    final db =await database;
    final res = await db?.insert('Scans', nuevoScan.toJson());
    
    // Este es el ID del utimo registro insertado
    return res;
  }

  Future<ScanModel?> getScanById( int id ) async {

    final db = await database;
    final res = await db?.query('Scans', where: 'id = ?', whereArgs: [id]);
  
    return res!.isNotEmpty
        ? ScanModel.fromJson( res.first )
        : null;
  }

   Future<List<ScanModel>?> getTodosLosScans() async {

    final db = await database;
    final res = await db?.query('Scans');
  
    return res != null
        ? res.map( (s) => ScanModel.fromJson(s) ).toList()
        : [];
  }

  Future<List<ScanModel>?> getScansPorTipo( String tipo) async {

    final db = await database;
    final res = await db?.rawQuery('''
      SELECT * FROM Scans WHERE TIPO = '$tipo'
    ''');
  
    return res != null
        ? res.map( (s) => ScanModel.fromJson(s) ).toList()
        : [];
  }
}