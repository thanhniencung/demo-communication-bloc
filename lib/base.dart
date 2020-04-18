import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterappcomunicationbloc/event/base_event.dart';

abstract class BaseBloc {
  GlobalBloc globalBloc;

  void injectBloc(GlobalBloc bloc) {
    globalBloc = bloc;
    globalBloc.globalStream.listen((event) {
      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);

  void emit(BaseEvent event) {
    if (globalBloc == null) {
      throw Exception("GlobalBloc can not be null");
    }
    globalBloc.globalSink.add(event);
  }
}

class GlobalBloc extends BaseBloc {
  final globalController = StreamController<BaseEvent>.broadcast();

  Stream get globalStream => globalController.stream;
  Sink get globalSink => globalController.sink;

  void emit(BaseEvent data) {
    globalSink.add(data);
  }

  void dispose() {
    globalController.close();
  }

  @override
  void dispatchEvent(BaseEvent event) {
    // TODO: implement dispatchEvent
  }
}

class AppContainer extends StatelessWidget {
  final Widget child;

  const AppContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC Communication"),
      ),
      body: Container(
        child: child,
      ),
    );
  }
}
