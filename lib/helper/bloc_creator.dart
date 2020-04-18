import 'package:flutter/material.dart';
import 'package:flutterappcomunicationbloc/base.dart';
import 'package:provider/provider.dart';

mixin BlocCreator<T extends StatefulWidget> on State<T> {
  B createBloc<B>() {
    var globalBloc = Provider.of<GlobalBloc>(context, listen: false);
    B bloc = Provider.of<B>(context);
    if (bloc is BaseBloc) {
      bloc.injectBloc(globalBloc);
    }
    return bloc;
  }

  B findBloc<B>() {
    return Provider.of<B>(context);
  }
}
