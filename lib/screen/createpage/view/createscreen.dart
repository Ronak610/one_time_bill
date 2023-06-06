import 'dart:async';

import 'package:easy_search_bar/easy_search_bar.dart';
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
  CreateBillController1 createBillController = Get.put(CreateBillController1());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: EasySearchBar(
          backgroundColor: Colors.white,
          title: Text(
            "Select Units For Adhoc Bills",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
         onSearch: (value){
             int count = 0;
             createBillController.searchList.value = [];
            if(value.isNotEmpty)
              {
                for(BuildingModel buildingModel in createBillController.buildingsList)
                {
                  print("=====45 ${buildingModel.buildingName}");
                  for(CreateBillModel createBillModel in buildingModel.buildings!)
                  {
                    if(createBillModel.name!.toLowerCase().contains(value.toLowerCase()))
                    {
                      count=1;
                      print("=======34 ${createBillModel.name}");
                      createBillController.searchList.add(createBillModel);
                    }
                  }
                }
              }
            else
              {
                createBillController.searchList.value = [];
              }
         },

        ),
        body: Obx(() => createBillController.searchList.isNotEmpty
            ?  ListView.builder(
          itemCount: createBillController.searchList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 5.0,left: 8,right: 8),
              child: ListTile(
                tileColor: createBillController.searchList[index].checked! ? Colors.indigo.shade100 : null,
                onTap: () {
                  if(createBillController.SeltcedButton.value == 1)
                  {
                    for(int j=0; j<createBillController.buildingsList.length; j++)
                    {
                      for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                      {
                        createBillController.buildingsList[j].buildings![i].checked = false;
                      }
                    }
                    for(int i=0; i<createBillController.searchList.length; i++)
                    {
                      createBillController.searchList[i].checked = false;
                    }
                    createBillController.searchList[index].checked = true;
                    createBillController.searchList[index] = createBillController.searchList[index];
                    print("======ccc $index ${createBillController.searchList[index].name} ${createBillController.searchList[index].checked}");
                    for(int i=0; i<createBillController.buildingsList.length; i++)
                    {
                      for(int j=0; j<createBillController.buildingsList[i].buildings!.length; j++)
                      {
                        if(createBillController.buildingsList[i].buildings![j].name == createBillController.searchList[index].name)
                        {
                          print("====== i = $i j = $j index = $index ifffff ss ${createBillController.searchList[index].name} ss ${createBillController.searchList[index].checked} bb ${createBillController.buildingsList[i].buildings![j].name} bb ${createBillController.buildingsList[i].buildings![j].checked}");
                          createBillController.buildingsList[i].buildings![j] = createBillController.searchList[index];
                        }
                      }
                    }
                    for(int i=0; i<createBillController.buildingsList.length; i++)
                    {
                      createBillController.buildingsList[i] = createBillController.buildingsList[i];
                    }
                  }
                  else
                  {
                    createBillController.searchList[index].checked = !createBillController.searchList[index].checked!;
                    createBillController.searchList[index] = createBillController.searchList[index];
                    for(int i=0; i<createBillController.buildingsList.length; i++)
                    {
                      for(int j=0; j<createBillController.buildingsList[i].buildings!.length; j++)
                      {
                        if(createBillController.buildingsList[i].buildings![j].name == createBillController.searchList[index].name)
                        {
                          print("====== i = $i j = $j index = $index ifffff ss ${createBillController.searchList[index].name} ss ${createBillController.searchList[index].checked} bb ${createBillController.buildingsList[i].buildings![j].name} bb ${createBillController.buildingsList[i].buildings![j].checked}");
                          createBillController.buildingsList[i].buildings![j] = createBillController.searchList[index];
                        }
                      }
                    }
                    for(int i=0; i<createBillController.buildingsList.length; i++)
                    {
                      createBillController.buildingsList[i] = createBillController.buildingsList[i];
                    }
                    int count = 0;
                    createBillController.SelectedData.value = [];
                    for (BuildingModel buildngmodel in createBillController.buildingsList) {
                      int count2 = 0;
                      for (int i = 0; i < buildngmodel.buildings!.length; i++) {
                        if (buildngmodel.buildings![i].checked!) {
                          count2++;
                          createBillController.SelectedData.add("${buildngmodel.buildings![i].name!}");
                        }
                      }
                      if (count2 == buildngmodel.buildings!.length) {
                        count++;
                      }
                    }
                    if (count == createBillController.buildingsList.length)
                    {
                      createBillController.selectAll.value = true;
                    }
                    else
                    {
                      createBillController.selectAll.value = false;
                    }
                  }
                  int count3 = 0;
                  for (BuildingModel buildngmodel in createBillController.buildingsList)
                  {
                    int count2 = 0;
                    for (int i = 0; i < buildngmodel.buildings!.length; i++) {
                      if (buildngmodel.buildings![i].checked == false) {
                        count2++;
                      }
                    }
                    if (count2 == buildngmodel.buildings!.length) {
                      count3++;
                    }
                  }
                  if (count3 == createBillController.buildingsList.length) {
                    createBillController.selected.value = false;
                  }
                  else
                  {
                    createBillController.selected.value = true;
                  }
                  if(createBillController.selected.value == false) {
                    Timer(const Duration(milliseconds: 1500), () {
                      createBillController.Myheight.value = 0;
                    });
                  }
                  else
                  {
                    createBillController.Myheight.value = 70;
                  }
                },
                title: Text(
                    "${createBillController.searchList[index].name}"),
                trailing: IconButton(
                    icon: Icon(createBillController.searchList[index].checked! ? Icons.remove : Icons.add),
                    style: IconButton.styleFrom(backgroundColor: createBillController.searchList[index].checked! ? Colors.red.shade300 : Colors.green.shade300),
                    onPressed: () {
                      if(createBillController.SeltcedButton.value == 1)
                      {
                        for(int j=0; j<createBillController.buildingsList.length; j++)
                        {
                          for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                          {
                            createBillController.buildingsList[j].buildings![i].checked = false;
                          }
                        }
                        for(int i=0; i<createBillController.searchList.length; i++)
                        {
                          createBillController.searchList[i].checked = false;
                        }
                        createBillController.searchList[index].checked = true;
                        createBillController.searchList[index] = createBillController.searchList[index];
                        print("======ccc $index ${createBillController.searchList[index].name} ${createBillController.searchList[index].checked}");
                        for(int i=0; i<createBillController.buildingsList.length; i++)
                        {
                          for(int j=0; j<createBillController.buildingsList[i].buildings!.length; j++)
                          {
                            if(createBillController.buildingsList[i].buildings![j].name == createBillController.searchList[index].name)
                            {
                              print("====== i = $i j = $j index = $index ifffff ss ${createBillController.searchList[index].name} ss ${createBillController.searchList[index].checked} bb ${createBillController.buildingsList[i].buildings![j].name} bb ${createBillController.buildingsList[i].buildings![j].checked}");
                              createBillController.buildingsList[i].buildings![j] = createBillController.searchList[index];
                            }
                          }
                        }
                        for(int i=0; i<createBillController.buildingsList.length; i++)
                        {
                          createBillController.buildingsList[i] = createBillController.buildingsList[i];
                        }
                      }
                      else
                      {
                        createBillController.searchList[index].checked = !createBillController.searchList[index].checked!;
                        createBillController.searchList[index] = createBillController.searchList[index];
                        for(int i=0; i<createBillController.buildingsList.length; i++)
                        {
                          for(int j=0; j<createBillController.buildingsList[i].buildings!.length; j++)
                          {
                            if(createBillController.buildingsList[i].buildings![j].name == createBillController.searchList[index].name)
                            {
                              print("====== i = $i j = $j index = $index ifffff ss ${createBillController.searchList[index].name} ss ${createBillController.searchList[index].checked} bb ${createBillController.buildingsList[i].buildings![j].name} bb ${createBillController.buildingsList[i].buildings![j].checked}");
                              createBillController.buildingsList[i].buildings![j] = createBillController.searchList[index];
                            }
                          }
                        }
                        for(int i=0; i<createBillController.buildingsList.length; i++)
                        {
                          createBillController.buildingsList[i] = createBillController.buildingsList[i];
                        }
                        int count = 0;
                        for (BuildingModel buildngmodel in createBillController.buildingsList) {
                          int count2 = 0;
                          for (int i = 0; i < buildngmodel.buildings!.length; i++) {
                            if (buildngmodel.buildings![i].checked!) {
                              count2++;
                            }
                          }
                          if (count2 == buildngmodel.buildings!.length) {
                            count++;
                          }
                        }
                        if (count == createBillController.buildingsList.length)
                        {
                          createBillController.selectAll.value = true;
                        }
                        else
                        {
                          createBillController.selectAll.value = false;
                        }
                      }
                    }),
              ),
            );
          },
        )
            : Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black26,
            ),
            createBillController.SeltcedButton.value==1?Container(height: 0,)
                :Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    for(int j=0; j<createBillController.buildingsList.length; j++)
                    {
                      for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                      {
                        createBillController.buildingsList[j].buildings![i].checked = createBillController.selectAll.value ? false : true;
                      }
                    }
                    createBillController.selectAll.value = createBillController.selectAll.value ? false : true;
                    createBillController.buildingsList.value = createBillController.buildingsList.value;
                    createBillController.SelectedData.value = [];
                    for (BuildingModel buildngmodel in createBillController.buildingsList) {
                      for (int i = 0; i < buildngmodel.buildings!.length; i++) {
                        if (buildngmodel.buildings![i].checked!) {
                          createBillController.SelectedData.add("${buildngmodel.buildings![i].name!}");
                        }
                      }
                    }
                    int count3 = 0;
                    for (BuildingModel buildngmodel in createBillController.buildingsList)
                    {
                      int count2 = 0;
                      for (int i = 0; i < buildngmodel.buildings!.length; i++) {
                        if (buildngmodel.buildings![i].checked == false) {
                          count2++;
                          createBillController.SelectedData.add("${buildngmodel.buildings![i].name!}");
                        }
                      }
                      if (count2 == buildngmodel.buildings!.length) {
                        count3++;
                      }
                    }
                    if (count3 == createBillController.buildingsList.length) {
                      createBillController.selected.value = false;
                    }
                    else
                    {
                      createBillController.selected.value = true;
                    }
                    if(createBillController.selected.value == false) {
                      Timer(const Duration(milliseconds: 1500), () {
                        createBillController.Myheight.value = 0;
                      });
                    }
                    else
                    {
                      createBillController.Myheight.value = 70;
                    }
                  },
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
                      style: TextStyle(decoration: createBillController.selectAll.value? TextDecoration.lineThrough:TextDecoration.none),
                    ),
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
                      height:  createBillController.buildingsList[index].buildings!.length * 55 + 65,
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
                                  height: 55,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: ListTile(
                                      onTap: () {
                                        if (createBillController.SeltcedButton.value == 1) {
                                          for (int i=0; i<createBillController.buildingsList.length; i++) {
                                            for (int j=0; j<createBillController.buildingsList[i].buildings!.length; j++) {
                                              createBillController.buildingsList[i].buildings![j].checked = false;
                                            }
                                          }
                                          createBillController.buildingsList[index].buildings![e.key].checked = true;
                                          createBillController.buildingsList[index] = createBillController.buildingsList[index];

                                        }
                                        else {
                                          createBillController.buildingsList[index].buildings![e.key].checked = !createBillController.buildingsList[index].buildings![e.key].checked!;
                                          createBillController.buildingsList[index] = createBillController.buildingsList[index];
                                          for (BuildingModel buildngmodel in createBillController.buildingsList) {
                                            for (CreateBillModel createBillModel in buildngmodel.buildings!) {
                                              if (createBillModel.checked != true) {
                                                createBillController.selectAll.value = false;
                                              }
                                            }
                                          }
                                          print("======bbbdfgh ${createBillController.Myheight}");
                                          int count = 0;
                                          createBillController.SelectedData.value = [];
                                          for (BuildingModel buildngmodel in createBillController.buildingsList)
                                          {
                                            int count2 = 0;
                                            for (int i = 0; i < buildngmodel.buildings!.length; i++) {
                                              if (buildngmodel.buildings![i].checked!) {
                                                count2++;
                                                createBillController.SelectedData.add("${buildngmodel.buildings![i].name!}");
                                              }
                                            }
                                            if (count2 ==
                                                buildngmodel.buildings!
                                                    .length) {
                                              count++;
                                            }
                                          }
                                          if (count == createBillController.buildingsList.length) {
                                            createBillController.selectAll
                                                .value = true;
                                          }
                                          int count3 = 0;
                                          for (BuildingModel buildngmodel in createBillController.buildingsList)
                                          {
                                            int count2 = 0;
                                            for (int i = 0; i < buildngmodel.buildings!.length; i++) {
                                              if (buildngmodel.buildings![i].checked == false) {
                                                count2++;
                                              }
                                            }
                                            if (count2 == buildngmodel.buildings!.length) {
                                              count3++;
                                            }
                                          }
                                          if (count3 == createBillController.buildingsList.length) {
                                            createBillController.selected.value = false;
                                          }
                                          else
                                            {
                                              createBillController.selected.value = true;
                                            }
                                          if(createBillController.selected.value == false) {
                                            Timer(const Duration(milliseconds: 1500), () {
                                              createBillController.Myheight.value = 0;
                                            });
                                          }
                                          else
                                          {
                                            createBillController.Myheight.value = 70;
                                          }
                                        }
                                      },
                                       tileColor: createBillController.buildingsList[index].buildings![e.key].checked! ? Colors.indigo.shade100 : null,
                                      title: Text(
                                          "${createBillController.buildingsList[index].buildings![e.key].name}"),
                                      trailing: IconButton(
                                          icon: Icon(createBillController.buildingsList[index].buildings![e.key].checked! ? Icons.remove : Icons.add),
                                          style: IconButton.styleFrom(backgroundColor: createBillController.buildingsList[index].buildings![e.key].checked! ? Colors.red.shade300 : Colors.green.shade300),
                                          onPressed: () {
                                            if (createBillController.SeltcedButton.value == 1) {
                                              for (int i=0; i<createBillController.buildingsList.length; i++) {
                                                for (int j=0; j<createBillController.buildingsList[i].buildings!.length; j++) {
                                                  createBillController.buildingsList[i].buildings![j].checked = false;
                                                }
                                              }
                                              createBillController.buildingsList[index].buildings![e.key].checked = true;
                                              createBillController.buildingsList[index] = createBillController.buildingsList[index];
                                            }
                                            else {
                                              createBillController.buildingsList[index].buildings![e.key].checked = !createBillController.buildingsList[index].buildings![e.key].checked!;
                                              createBillController.buildingsList[index] = createBillController.buildingsList[index];
                                              for (BuildingModel buildngmodel in createBillController.buildingsList) {
                                                for (CreateBillModel createBillModel in buildngmodel.buildings!) {
                                                  if (createBillModel.checked != true) {
                                                    createBillController.selectAll.value = false;
                                                  }
                                                }
                                              }
                                              int count = 0;
                                              createBillController.SelectedData.value = [];
                                              for (BuildingModel buildngmodel in createBillController
                                                  .buildingsList) {
                                                int count2 = 0;
                                                for (int i = 0; i < buildngmodel
                                                    .buildings!.length; i++) {
                                                  if (buildngmodel.buildings![i]
                                                      .checked!) {
                                                    count2++;
                                                    createBillController.SelectedData.add("${buildngmodel.buildings![i].name!}");
                                                  }
                                                }
                                                if (count2 ==
                                                    buildngmodel.buildings!
                                                        .length) {
                                                  count++;
                                                }
                                              }
                                              if (count ==
                                                  createBillController.buildingsList
                                                      .length) {
                                                createBillController.selectAll
                                                    .value = true;
                                              }
                                            }
                                            int count3 = 0;
                                            for (BuildingModel buildngmodel in createBillController.buildingsList)
                                            {
                                              int count2 = 0;
                                              for (int i = 0; i < buildngmodel.buildings!.length; i++) {
                                                if (buildngmodel.buildings![i].checked == false) {
                                                  count2++;
                                                }
                                              }
                                              if (count2 == buildngmodel.buildings!.length) {
                                                count3++;
                                              }
                                            }
                                            if (count3 == createBillController.buildingsList.length) {
                                              createBillController.selected.value = false;
                                            }
                                            else
                                            {
                                              createBillController.selected.value = true;
                                            }
                                            if(createBillController.selected.value == false) {
                                              Timer(const Duration(milliseconds: 1500), () {
                                                createBillController.Myheight.value = 0;
                                              });
                                            }
                                            else
                                            {
                                              createBillController.Myheight.value = 70;
                                            }
                                          }),
                                    ),
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
        )),
        bottomNavigationBar: Obx(
          () {
            print("======dfgh ${createBillController.Myheight}");
            return AnimatedContainer(
              duration: Duration(milliseconds: 400),
              width: double.infinity,
              color: Colors.indigo.shade100,
              height: createBillController.Myheight.value,
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: createBillController.SelectedData.length,
                      itemBuilder: (context, index) => Center(child: Text("${createBillController.SelectedData[index]},   ")),
                    ),
                  ),
                  SizedBox(width: 15,),
                  TextButton(onPressed: (){
                   if(createBillController.SelectedData.length != 0)
                     {
                       Get.toNamed('Bill');
                     }
                  }, child: Text("Next"),style: TextButton.styleFrom(backgroundColor: Colors.white),)
                ],
              )
            );
          },
        ),
      ),
    );
  }
}
