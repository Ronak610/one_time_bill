import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetimebill/screen/createpage/controller/createbillcontroller.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  CreateBillController1 createBillController = Get.put(CreateBillController1());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create One Time Bill :-",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          actions: [
            Obx(
              () => ElevatedButton(
                onPressed: () {
                  createBillController.Gstonoff.value = !createBillController.Gstonoff.value;
                },
                child: Text(
                  createBillController.Gstonoff.value ? "GST:ON" : "GST:OFF",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                    createBillController.Gstonoff.value ? Colors.green : Colors.red),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: ListTile(
                  leading: Text("Create Bills for Units :"),
                  title: Text("Bill For-"),
                ),
              ),
              ListTile(
                leading: Text("Bill Date :"),
                title: Obx(
                  () => TextFormField(
                    keyboardType: TextInputType.none,
                    readOnly: true,
                    controller: TextEditingController(
                        text: createBillController.fdate.value),
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2050));
                      if (date != null) {
                        createBillController.firstDate = date;
                        print(
                            "===== ${date.day} ${createBillController.lastDate!.day}");
                        if (createBillController.firstDate!
                                .compareTo(createBillController.lastDate!) <=
                            0) {
                          createBillController.fdate.value =
                              "${date.day} / ${date.month} / ${date.year}";
                        }
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "DD/MM/YYYY"),
                  ),
                ),
              ),
              ListTile(
                leading: Text("Bill Due Date :"),
                title: Obx(
                  () => TextFormField(
                    keyboardType: TextInputType.none,
                    readOnly: true,
                    controller: TextEditingController(
                        text: createBillController.dudate.value),
                    onTap: () async {
                      DateTime? duedate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2050));
                      if (duedate != null) {
                        createBillController.lastDate = duedate;
                        if (createBillController.firstDate!
                                .compareTo(createBillController.lastDate!) <=
                            0) {
                          createBillController.dudate.value =
                              "${duedate.day} / ${duedate.month} / ${duedate.year}";
                        }
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "DD/MM/YYYY"),
                  ),
                ),
              ),
              ListTile(
                leading: Text("Bill Type :"),
                title: Text("One Time Bill"),
              ),
              ListTile(
                leading: Text("Bill Reason :"),
                title: Obx(
                  () => TextFormField(
                    // controller: TextEditingController(text: dropvalue.value),
                    readOnly: true,
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: createBillController.dropvalue.value,
                            onChanged: (value) {
                              createBillController.dropvalue.value =
                                  value.toString();
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text("Common Area Usage"),
                                value: "Common Area Usage",
                              ),
                              DropdownMenuItem(
                                child: Text("Chair Usage"),
                                value: "Chair Usage",
                              ),
                              DropdownMenuItem(
                                child: Text("Festival"),
                                value: "Festival",
                              ),
                              DropdownMenuItem(
                                child: Text("Donation"),
                                value: "Donation",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Text("Bill Amount :"),
                title: TextFormField(
                  controller: createBillController.txtAmount,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      createBillController.GST.value = (double.parse(value) * 15) / 100;
                      createBillController.Totalamount.value =
                          double.parse(value) + createBillController.GST.value;
                    } else {
                      createBillController.Totalamount.value = 0;
                    }
                  },
                ),
              ),
              Obx(
                () => createBillController.Gstonoff.value
                    ? ListTile(
                        leading: Text("GST Amount :"),
                        title: TextFormField(
                          controller: TextEditingController(
                              text: "15% : \$${createBillController.GST.value.toStringAsFixed(2)}"),
                          readOnly: true,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 0,
                      ),
              ),
              ListTile(
                leading: Text("Total Bill Amount :"),
                title: Obx(
                  () => TextFormField(
                    controller: TextEditingController(
                        text:
                            "${createBillController.Totalamount.toStringAsFixed(2)}"),
                    readOnly: true,
                    keyboardType: TextInputType.none,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Text("Publish Date :"),
                title: Obx(
                  () => TextFormField(
                    keyboardType: TextInputType.none,
                    readOnly: true,
                    controller: TextEditingController(
                        text: createBillController.pubdate.value),
                    decoration: InputDecoration(
                      hintText: "DD/MM/YYYY",
                      suffixIcon: IconButton(
                        onPressed: () {
                          createBillController.pubdate.value = "";
                        },
                        icon: Icon(Icons.close),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onTap: () async {
                      DateTime? pdate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2050));
                      if (pdate != null) {
                        if (createBillController.firstDate!.compareTo(pdate) <=
                            0) {
                          createBillController.pubdate.value =
                              "${pdate.day} / ${pdate.month} / ${pdate.year}";
                        }
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                  label: Text(
                    "Create Bill",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
