import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetimebill/screen/createpage/controller/createbillcontroller.dart';
import 'package:onetimebill/screen/createpage/model/BuildingModel.dart';
import 'package:onetimebill/screen/createpage/model/CreateBillModel.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    CreateBillController createBillController = Get.put(CreateBillController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Units For Adhoc Bills",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black26,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Select All",
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: createBillController.buildingsList.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height:  createBillController.buildingsList[index].buildings!.length * 50+55,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           Container(
                              height: 50,
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                " * Building ${createBillController.buildingsList[index].buildingName}",
                                style: TextStyle(),
                              ),
                            ),
                          Expanded(
                            child: Obx(
                              () => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: createBillController.buildingsList[index].buildings!
                                    .asMap()
                                    .entries
                                    .map((e) => SizedBox(
                                  height: 50,
                                      child: ListTile(
                                            leading: Checkbox(
                                              value: createBillController.buildingsList[index].buildings![e.key].checked,
                                              onChanged: (value) {
                                                createBillController.buildingsList[index] = BuildingModel(
                                                  buildingName: createBillController.buildingsList[index].buildingName,
                                                  buildings: createBillController.buildingsList[index].buildings!.asMap().entries.map((en) => CreateBillModel(name: createBillController.buildingsList[index].buildings![en.key].name,selected: createBillController.buildingsList[index].buildings![en.key].selected,checked: en.key == e.key ? true : false)).toList()
                                                );
                                              },
                                            ),
                                            title: Text(
                                                "${createBillController.buildingsList[index].buildings![e.key].name}"),
                                            trailing: IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {}),
                                          ),
                                    ))
                                    .toList(),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
