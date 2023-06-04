import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onetimebill/screen/draftbillpage/view/draftscreen.dart';
import 'package:onetimebill/screen/navigatorcontoller.dart';
import 'package:onetimebill/screen/publishebillpage/view/publishedscreen.dart';

class tab extends StatefulWidget {
  const tab({Key? key}) : super(key: key);

  @override
  State<tab> createState() => _tabState();
}

class _tabState extends State<tab> {
  @override
  Widget build(BuildContext context) {
    NavigatorController navigatorController = Get.put(NavigatorController());
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("One Time Bill"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Draft Bill",
                ),
                Tab(
                  text: "Published Bill",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DraftScreen(),
              PublishScreen(),
            ],
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              unselectedItemColor: Colors.black26,
              selectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              currentIndex: navigatorController.NavigatIndex.value,
              showUnselectedLabels: true,
              onTap: (value) {
                navigatorController.NavigatIndex.value = value;
              },

              items: [
                BottomNavigationBarItem(
                  label: "One Time Bill",
                  icon: Icon(
                    Icons.date_range_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(
                    Icons.home,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
