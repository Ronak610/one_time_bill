import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DraftScreen extends StatefulWidget {
  const DraftScreen({Key? key}) : super(key: key);

  @override
  State<DraftScreen> createState() => _DraftScreenState();
}

class _DraftScreenState extends State<DraftScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(elevation: 10,
          onPressed: () {
            Get.toNamed("S");
          },
          label: Text("Create"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
