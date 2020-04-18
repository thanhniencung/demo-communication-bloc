import 'package:flutter/material.dart';
import 'package:flutterappcomunicationbloc/base.dart';
import 'package:flutterappcomunicationbloc/event/base_event.dart';
import 'package:flutterappcomunicationbloc/event/count_event.dart';
import 'package:flutterappcomunicationbloc/helper/bloc_creator.dart';
import 'package:flutterappcomunicationbloc/home.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => CounterBloc(),
      child: Counter(),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> with BlocCreator {
  CounterBloc counterBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (counterBloc == null) {
      counterBloc = createBloc<CounterBloc>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          color: Colors.indigo,
          onPressed: () {
            counterBloc.increment();
          },
          child: Text(
            "+",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        RaisedButton(
          color: Colors.indigo,
          onPressed: () {
            counterBloc.decrement();
          },
          child: Text(
            "-",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class CounterBloc extends BaseBloc {
  var count = 0;

  void increment() {
    emit(CountEvent(++count));
  }

  void decrement() {
    emit(CountEvent(--count));
  }

  @override
  void dispatchEvent(BaseEvent event) {
    // TODO: implement dispatchEvent
  }
}
