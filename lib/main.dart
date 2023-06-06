import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onetimebill/screen/createpage/view/billscreen.dart';
import 'package:onetimebill/screen/createpage/view/createscreen.dart';
import 'package:onetimebill/screen/createpage/view/selectunitscreen.dart';
import 'package:onetimebill/screen/draftbillpage/view/draftscreen.dart';
import 'package:onetimebill/screen/publishebillpage/view/publishedscreen.dart';
import 'package:onetimebill/tabscreen.dart';

void main() {
  runApp(
    GetMaterialApp(theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      // initialRoute: 'Bill',
      routes: {
       '/': (p0) => tab(),
        'Bill':(p0) => BillScreen(),
        'D': (p0) => DraftScreen(),
        'P': (p0) => PublishScreen(),
        'C': (p0) => CreateScreen(),
        'S': (p0) => SelecteScreen(),
      },
    ),
  );
}
