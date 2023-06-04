import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillScreen extends StatefulWidget {
  const BillScreen({Key? key}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Create Bill :-",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
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
                title: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              ListTile(
                leading: Text("Bill Due Date :"),
                title: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              ListTile(
                leading: Text("Bill Type :"),
                title: Text("One Time Bill"),
              ),
              ListTile(
                leading: Text("Bill Reason :"),
                title: TextFormField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              ListTile(
                leading: Text("Bill Amount :"),
                title: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ListTile(
                leading: Text("GST Amount :"),
                title: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ListTile(
                leading: Text("Total Bill Amount :"),
                title: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ListTile(
                leading: Text("Publish Date :"),
                title: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
