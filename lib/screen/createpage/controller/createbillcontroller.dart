import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetimebill/screen/createpage/model/BuildingModel.dart';
import 'package:onetimebill/screen/createpage/model/CreateBillModel.dart';

class CreateBillController1 extends GetxController {


  RxInt SeltcedButton = 0.obs;
  RxBool selectAll = false.obs;
  RxBool selected = false.obs;
  RxString fdate = "".obs;
  RxString dudate = "".obs;
  RxString dropvalue = "Common Area Usage".obs;
  RxString pubdate = "".obs;
  RxDouble Totalamount = 0.0.obs;
  DateTime? lastDate = DateTime(2023, 6, 6);
  DateTime? firstDate = DateTime(2023, 6, 3);
  RxString buldingName = "".obs;
  RxDouble Myheight = 0.0.obs;
  RxDouble GST = 0.0.obs;
  TextEditingController txtAmount = TextEditingController();
  RxBool Gstonoff = false.obs;


  RxList<CreateBillModel> searchList = <CreateBillModel>[].obs;
  RxList<String> SelectedData = <String>[].obs;
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

