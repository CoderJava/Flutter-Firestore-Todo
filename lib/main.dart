import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFBE4D4),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Firestore firestore = Firestore.instance;
  final Color colorPrimary = Color(0xFFFBE4D4);
  final Color colorSecondary = Color(0xFFEC81B7);
  final Color colorTertiary = Color(0xFF425195);
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
      backgroundColor: colorPrimary,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -64,
              right: -128,
              child: Container(
                width: 256.0,
                height: 256.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9000),
                  color: colorTertiary,
                ),
              ),
            ),
            Positioned(
              top: -164,
              right: -8.0,
              child: Container(
                width: 256.0,
                height: 256.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9000),
                  backgroundBlendMode: BlendMode.hardLight,
                  color: Colors.redAccent.withOpacity(0.8),
                ),
              ),
            ),
            _buildWidgetListTodo(widthScreen, heightScreen, context),
          ],
        ),
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
