import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

  Future initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "dbteste.db");

    final exist = await databaseExists(path);

    if(exist){
      print('Db já existe');
      await openDatabase(path);
    } else {
      print('criando uma copia do assets');
      try{
        await Directory(dirname(path)).create(recursive:true);
      } catch(_){}
      ByteData data = await rootBundle.load(join("assets", "dbteste.db"));
      List<int> bytes = data .buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
      print("db copiado");
    }
    return await openDatabase(path);

  }
