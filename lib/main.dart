import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_todo/app_color.dart';
import 'package:flutter_firestore_todo/create_task_screen.dart';
import 'package:flutter_firestore_todo/widget_background.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColor().colorSecondary,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Firestore firestore = Firestore.instance;
  final AppColor appColor = AppColor();
  final List<Map<String, dynamic>> datas = [
    {
      'task_name': 'Eat Breakfast',
      'date': 'Dec 25',
      'time': '08:00 - 09:00',
    },
    {
      'task_name': 'Read a book',
      'date': 'Dec 25',
      'time': '09:00 - 10:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double widthScreen = mediaQueryData.size.width;
    double heightScreen = mediaQueryData.size.height;

    return Scaffold(
      backgroundColor: appColor.colorPrimary,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            WidgetBackground(),
            _buildWidgetListTodo(widthScreen, heightScreen, context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateTaskScreen()));
        },
        backgroundColor: appColor.colorTertiary,
      ),
    );
  }

  Container _buildWidgetListTodo(double widthScreen, double heightScreen, BuildContext context) {
    return Container(
      width: widthScreen,
      height: heightScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'Todo',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> itemData = datas[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                itemData['task_name'],
                                style: Theme.of(context).textTheme.title.merge(
                                      TextStyle(fontWeight: FontWeight.normal),
                                    ),
                              ),
                              Text(
                                itemData['date'] + ', ' + itemData['time'],
                                style: Theme.of(context).textTheme.subtitle.merge(
                                      TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
