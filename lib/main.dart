import 'package:flutter/material.dart';
import 'package:flutterappcomunicationbloc/base.dart';
import 'package:flutterappcomunicationbloc/counter.dart';
import 'package:flutterappcomunicationbloc/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (_) => GlobalBloc(),
        child: AppContainer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                HomePage(),
                SizedBox(
                  height: 50,
                ),
                CounterPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
