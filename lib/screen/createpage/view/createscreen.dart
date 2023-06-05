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
  @override
  Widget build(BuildContext context) {
    CreateBillController createBillController = Get.put(CreateBillController());
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
          onSearch: (value) {
            createBillController.searchlist.value = [];
            if(value.isNotEmpty)
              {
                for(BuildingModel buildingModel in createBillController.buildingsList)
                {
                  for(CreateBillModel createBillModel in buildingModel.buildings!)
                  {
                    if(createBillModel.name!.contains(value))
                    {
                      createBillController.searchlist.add(createBillModel);
                    }
                  }
                }
              }
            else
              {
                createBillController.searchlist.value = [];
              }
          },
          // suggestions: [createBillController.buildingsList.value.toString()],
        ),
        body: Obx(() => createBillController.searchlist.isNotEmpty
            ? ListView.builder(
          itemCount: createBillController.searchlist.length,
          itemBuilder: (context, index) {
            return  ListTile(
              leading: Checkbox(
                value: createBillController
                    .searchlist[index]
                    .checked,
                onChanged: (value) {
                  int count = 0;
                  for(int i=0; i<createBillController.searchlist.length; i++)
                  {
                    if(index == i)
                    {
                      if(createBillController.searchlist[index].name == createBillController.searchlist[i].name)
                      {
                        count = 1;
                        print("======= ${createBillController.searchlist[i].name}");
                        createBillController.searchlist[i] = CreateBillModel(
                            name: createBillController.searchlist[i].name,
                            checked: createBillController.searchlist[i].checked! ? false : true,
                            selected: createBillController.searchlist[i].selected! ? false : true
                        );

                        for(int x=0; x<createBillController.searchlist.length; x++)
                        {
                          if(x != i)
                          {
                            createBillController.searchlist[x] = CreateBillModel(
                                name: createBillController.searchlist[x].name,
                                checked: false,
                                selected: createBillController.searchlist[x].selected! ? false : true
                            );
                          }
                        }
                      }
                      break;
                    }
                    if(count==1)
                    {
                      print("========== ${createBillController.searchlist[index].name}");
                      break;
                    }
                  }
                  for(int j=0; j<createBillController.searchlist.length; j++)
                    {
                      if(createBillController.searchlist[j].checked!)
                        {
                          print("=====jjjjjj $j");
                          for(int i=0; i<createBillController.buildingsList.length; i++)
                            {
                              for(int x=0; x<createBillController.buildingsList[i].buildings!.length; x++)
                                {
                                  if(createBillController.buildingsList[i].buildings![x].name == createBillController.searchlist[j].name)
                                    {
                                      print("========$i $x $j");
                                      createBillController.buildingsList[i].buildings![x] = createBillController.searchlist[j];

                                    }
                                }
                            }
                        }
                    }
                },
              ),
              title: Text(
                  "${createBillController.searchlist[index].name}"),
              trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {}),
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
            createBillController.SeltcedButton.value != 1 ? Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: (){
                  if(createBillController.selectAll.value)
                    {
                      for(int j=0; j<createBillController.buildingsList.length; j++)
                      {
                        for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                        {
                          print("==== $j $i");
                          createBillController.buildingsList[j].buildings![i].checked = false;
                        }
                      }
                    }
                  else
                    {
                      for(int j=0; j<createBillController.buildingsList.length; j++)
                      {
                        for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                        {
                          print("==== $j $i");
                          createBillController.buildingsList[j].buildings![i].checked = true;
                        }
                      }
                    }
                  createBillController.selectAll.value = createBillController.selectAll.value ? false : true;
                  for(int i=0; i<createBillController.buildingsList.length; i++)
                    {
                      createBillController.buildingsList[i] = createBillController.buildingsList[i];
                    }
                  print("==== ${createBillController.buildingsList[0].buildings![0].checked}");
                },
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
                    child: Obx(
                      () => Text(
                        "Select All",
                        style: TextStyle(decoration: createBillController.selectAll.value ? TextDecoration.lineThrough : TextDecoration.none),
                      ),
                    ),
                  ),
                ),
              ),
            ) : Text(""),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () =>  ListView.builder(
                    itemCount: createBillController.buildingsList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: createBillController
                            .buildingsList[index].buildings!.length *
                            50 +
                            55,
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
                              child:  Obx(
                                () => Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: createBillController
                                        .buildingsList[index].buildings!
                                        .asMap()
                                        .entries
                                        .map((e) => SizedBox(
                                      height: 50,
                                      child: Obx(
                                        () =>  ListTile(
                                          leading: Checkbox(
                                            value: createBillController.buildingsList[index].buildings![e.key].checked,
                                            onChanged: (value) {
                                              if(createBillController.SeltcedButton.value == 1)
                                                {
                                                  for(int j=0; j<createBillController.buildingsList.length; j++)
                                                    {
                                                      for(int i=0; i<createBillController.buildingsList[j].buildings!.length; i++)
                                                      {
                                                        createBillController.buildingsList[j].buildings![i].checked = false;
                                                      }
                                                    }
                                                  createBillController.buildingsList[index].buildings![e.key].checked = value;
                                                  createBillController.buildingsList[index] = createBillController.buildingsList[index];
                                                }
                                              else
                                                {
                                                  createBillController.buildingsList[index].buildings![e.key].checked = value;
                                                  createBillController.buildingsList[index] = createBillController.buildingsList[index];
                                                }
                                              // for(int i=0; i<createBillController.buildingsList.length; i++)
                                              //   {
                                              //     print("====== 23 ${createBillController.buildingsList[index].buildings![e.key].name} ${createBillController.buildingsList[i].buildings![e.key].name}");
                                              //     if(i==e.key)
                                              //       {
                                              //         print("======${e.key} $i $index ${createBillController.buildingsList[i].buildings![e.key].name} ${createBillController.buildingsList[index].buildings![e.key].name}");
                                              //         createBillController.buildingsList[index] = BuildingModel(
                                              //           buildingName: createBillController.buildingsList[index].buildingName,
                                              //           buildings: createBillController.buildingsList[index].buildings!.asMap().entries.map((en) => CreateBillModel(
                                              //             selected: createBillController.buildingsList[index].buildings![en.key].selected,
                                              //             name: createBillController.buildingsList[index].buildings![en.key].name,
                                              //             checked: true
                                              //           ),).toList()
                                              //         );
                                              //
                                              //         // createBillController.searchlist[i] = CreateBillModel(
                                              //         //     name: createBillController.searchlist[i].name,
                                              //         //     checked: createBillController.searchlist[i].checked! ? false : true,
                                              //         //     selected: createBillController.searchlist[i].selected! ? false : true
                                              //         // );
                                              //         //
                                              //         // for(int x=0; x<createBillController.buildingsList[index].buildings!.length; x++)
                                              //         // {
                                              //         //   if(x != i)
                                              //         //   {
                                              //         //     print("====== xxxxxx ${createBillController.buildingsList[index].buildings![x].name}");
                                              //         //     // createBillController.searchlist[x] = CreateBillModel(
                                              //         //     //     name: createBillController.searchlist[x].name,
                                              //         //     //     checked: false,
                                              //         //     //     selected: createBillController.searchlist[x].selected! ? false : true
                                              //         //     // );
                                              //         //   }
                                              //         // }
                                              //       }
                                              //     else
                                              //       {
                                              //         createBillController.buildingsList[index] = BuildingModel(
                                              //             buildingName: createBillController.buildingsList[index].buildingName,
                                              //             buildings: createBillController.buildingsList[index].buildings!.asMap().entries.map((en) => CreateBillModel(
                                              //                 selected: createBillController.buildingsList[index].buildings![en.key].selected,
                                              //                 name: createBillController.buildingsList[index].buildings![en.key].name,
                                              //                 checked: false
                                              //             ),).toList()
                                              //         );
                                              //       }
                                              //   }
                                              // createBillController.buildingsList[index] = BuildingModel(buildingName: createBillController.buildingsList[index].buildingName,
                                              //     buildings: createBillController.buildingsList[index].buildings!.asMap().entries.map((en) => CreateBillModel(
                                              //         name: createBillController.buildingsList[index].buildings![en.key].name,
                                              //         selected: createBillController.buildingsList[index].buildings![en.key].selected,
                                              //         checked: en.key == e.key ? true : false),
                                              //     ).toList());
                                              // for(int i=0; i<createBillController.buildingsList.length; i++) {
                                              //     print("======= $i $index ${e.key}");
                                              //     if(index == i)
                                              //       {
                                              //         // print("=======12345 $i $index ${e.key}");
                                              //         // createBillController.buildingsList[index].buildings![e.key] = CreateBillModel(
                                              //         //   name: createBillController.buildingsList[index].buildings![e.key].name,
                                              //         //   selected: createBillController.buildingsList[index].buildings![e.key].selected,
                                              //         //   checked: createBillController.buildingsList[index].buildings![e.key].checked! ? false : true,
                                              //         // );
                                              //         createBillController.buildingsList[index] = BuildingModel(
                                              //           buildingName: createBillController.buildingsList[index].buildingName,
                                              //           buildings: createBillController.buildingsList[index].buildings!.asMap().entries.map((en) {
                                              //             print("=======$i $index ${en.key} ${e.key}");
                                              //             return CreateBillModel(
                                              //               name: createBillController.buildingsList[index].buildings![en.key].name,
                                              //               selected: createBillController.buildingsList[index].buildings![en.key].selected,
                                              //               checked: createBillController.buildingsList[index].buildings![en.key].checked! ? false : true,
                                              //             );
                                              //           },).toList(),
                                              //         );
                                              //         break;
                                              //       }
                                              //   }
                                            },
                                          ),
                                          title: Text(
                                              "${createBillController.buildingsList[index].buildings![e.key].name}"),
                                          trailing: IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {}),
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
            ),
          ],
        )),
      ),
    );
  }
}
