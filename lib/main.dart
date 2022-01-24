import 'package:flutter/material.dart';
import 'package:testando_bd_existente/dbhelper.dart';
import 'package:testando_bd_existente/pessoa_dao.dart';

import 'dashboard.dart';

void main() {
  runApp(TestandoBanco());
}


class TestandoBanco extends StatefulWidget {
  const TestandoBanco({ Key? key }) : super(key: key);

  @override
  _TestandoBancoState createState() => _TestandoBancoState();
}

class _TestandoBancoState extends State<TestandoBanco> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

