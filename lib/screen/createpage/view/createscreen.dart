import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Select Units For Adhoc Bills",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black26,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
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
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " * Building A",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("A-101"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("A-102"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("A-103"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black26,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " * Building B",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("B-101"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("B-102"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("B-103"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black26,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          " * Building C",
                          style: TextStyle(),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("C-101"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("C-102"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      title: Text("C-103"),
                      trailing:
                          IconButton(icon: Icon(Icons.add), onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.black26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
