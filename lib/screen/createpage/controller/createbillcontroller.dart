import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetimebill/screen/createpage/model/BuildingModel.dart';
import 'package:onetimebill/screen/createpage/model/CreateBillModel.dart';

class CreateBillController extends GetxController {
  RxString fdate = "".obs;
  DateTime? firstDate = DateTime(2023, 6, 3);
  DateTime? lastDate = DateTime(2023, 6, 6);
  RxString dudate = "".obs;
  RxString pubdate = "".obs;
  RxDouble Totalamount = 0.0.obs;
  RxString dropvalue = "Common Area Usage".obs;
  TextEditingController txtAmount = TextEditingController();
  RxList<BuildingModel> buildingsList = [
    BuildingModel(
      buildings: [
        CreateBillModel(name: "A-101", checked: false, selected: false),
        CreateBillModel(name: "A-102", checked: false, selected: false),
        CreateBillModel(name: "A-103", checked: false, selected: false),
      ],
      buildingName: "A",
    ),
    BuildingModel(
      buildings: [
        CreateBillModel(name: "B-101", checked: false, selected: false),
        CreateBillModel(name: "B-102", checked: false, selected: false),
        CreateBillModel(name: "B-103", checked: false, selected: false),
      ],
      buildingName: "B",
    ),
    BuildingModel(
      buildings: [
        CreateBillModel(name: "C-101", checked: false, selected: false),
        CreateBillModel(name: "C-102", checked: false, selected: false),
        CreateBillModel(name: "C-103", checked: false, selected: false),
      ],
      buildingName: "C",
    ),
    BuildingModel(
      buildings: [
        CreateBillModel(name: "D-101", checked: false, selected: false),
        CreateBillModel(name: "D-102", checked: false, selected: false),
        CreateBillModel(name: "D-103", checked: false, selected: false),
      ],
      buildingName: "D",
    ),
  ].obs;
}
