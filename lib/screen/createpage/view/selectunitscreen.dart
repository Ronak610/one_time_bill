import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelecteScreen extends StatefulWidget {
  const SelecteScreen({Key? key}) : super(key: key);

  @override
  State<SelecteScreen> createState() => _SelecteScreenState();
}

class _SelecteScreenState extends State<SelecteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Do you want to create One-Time bill for?",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, fixedSize: Size(200, 44)),
                    onPressed: () {
                      Get.toNamed('C');
                    },
                    child: Text("Single Unit")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, fixedSize: Size(200, 44)),
                    onPressed: () {Get.toNamed('C');},
                    child: Text("Multiple Unit")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, fixedSize: Size(200, 44)),
                    onPressed: () {Get.toNamed('C');},
                    child: Text("All Unit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
