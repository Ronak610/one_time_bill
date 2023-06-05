import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetimebill/screen/createpage/controller/createbillcontroller.dart';

class SelecteScreen extends StatefulWidget {
  const SelecteScreen({Key? key}) : super(key: key);

  @override
  State<SelecteScreen> createState() => _SelecteScreenState();
}

class _SelecteScreenState extends State<SelecteScreen> {

  CreateBillController createBillController = Get.put(CreateBillController());

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
                      createBillController.SeltcedButton.value = 1;
                      for(int j=0; j<createBillController.buildingsList.length; j++)
                      {
                        for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                        {
                          createBillController.buildingsList[j].buildings![i].checked = false;
                        }
                      }
                      Get.toNamed('C');
                    },
                    child: Text("Single Unit")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, fixedSize: Size(200, 44)),
                    onPressed: () {
                      for(int j=0; j<createBillController.buildingsList.length; j++)
                      {
                        for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                        {
                          createBillController.buildingsList[j].buildings![i].checked = false;
                        }
                      }
                      createBillController.SeltcedButton.value = 2;
                      Get.toNamed('C');},
                    child: Text("Multiple Unit")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 10, fixedSize: Size(200, 44)),
                    onPressed: () {
                      for(int j=0; j<createBillController.buildingsList.length; j++)
                      {
                        for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                        {
                          createBillController.buildingsList[j].buildings![i].checked = true;
                        }
                      }
                      createBillController.selectAll.value = true;
                      createBillController.buildingsList.value = createBillController.buildingsList.value;
                      createBillController.SeltcedButton.value = 3;
                      Get.toNamed('C');},
                    child: Text("All Unit")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
