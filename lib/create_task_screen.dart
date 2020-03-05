import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo/app_color.dart';
import 'package:flutter_firestore_todo/widget_background.dart';
import 'package:intl/intl.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final Firestore firestore = Firestore.instance;
  final AppColor appColor = AppColor();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerDescription = TextEditingController();
  final TextEditingController controllerDate = TextEditingController();

  double widthScreen;
  double heightScreen;
  String strDate;

  @override
  void initState() {
    strDate = DateFormat('EEEE dd, MMMM').format(DateTime.now());
    controllerDate.text = strDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    widthScreen = mediaQueryData.size.width;
    heightScreen = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: appColor.colorPrimary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            WidgetBackground(),
            Container(
              width: widthScreen,
              height: heightScreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildWidgetFormPrimary(),
                  SizedBox(height: 16.0),
                  _buildWidgetFormSecondary(),
                  _buildWidgetButtonCreateTask(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetFormPrimary() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
          SizedBox(height: 16.0),
          Text(
            'Create\nNew Task',
            style: Theme.of(context).textTheme.display1.merge(
                  TextStyle(color: Colors.grey[800]),
                ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: controllerName,
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetFormSecondary() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: controllerDescription,
              decoration: InputDecoration(
                labelText: 'Description',
                suffixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.description),
                  ],
                ),
              ),
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // TODO: do something in here
              },
              child: TextField(
                controller: controllerDate,
                decoration: InputDecoration(
                  labelText: 'Date',
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.today),
                    ],
                  ),
                ),
                style: TextStyle(fontSize: 18.0),
                enabled: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetButtonCreateTask() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RaisedButton(
        color: appColor.colorTertiary,
        child: Text('CREATE TASK'),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        onPressed: () {
          // TODO: do something in here
        },
      ),
    );
  }

}
