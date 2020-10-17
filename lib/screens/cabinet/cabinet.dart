import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/cabinet_model.dart';
import 'package:flutter_app/models/room_model.dart';
import 'package:flutter_app/screens/cabinet/cabinet_form.dart';
import 'package:flutter_app/screens/cabinet/cabinet_list.dart';
import 'package:flutter_app/screens/custom/custom_app_bar.dart';
import 'file:///C:/Nisha/projects/mobile-app/flutter_app/lib/screens/navigation/left_navigation.dart';
import 'package:flutter_app/services/database_service.dart';
import 'package:provider/provider.dart';

class Cabinet extends StatefulWidget {
  @override
  _CabinetState createState() => _CabinetState();
}

class _CabinetState extends State<Cabinet> {
  bool isLoading = false;

  void _showCabinetAdd(uid) {
    setState(() {
      isLoading = true;
    });

    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return StreamProvider<List<RoomModel>>.value(
          child: CabinetForm(onCreate: _onCreate),
          value: DatabaseService(uid: uid).rooms);
    }));
  }

  _onCreate(String cabinetName, String cabinetId, String cabinetSize,
      String uid, String roomDocId) async {
    CabinetModel roomModel =
        new CabinetModel(cabinetId, cabinetName, cabinetSize);
    await DatabaseService(docId: roomDocId, uid: uid)
        .addCabinetData(cabinetName, cabinetId, cabinetSize);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Scaffold(
      body: CabinetList(),
      drawer: LeftNavigation(),
      appBar: CustomAppBar(title: "Cabinet",),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          _showCabinetAdd(user.uid);
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0Xff5f72a9),
      ),
    );
  }
}
