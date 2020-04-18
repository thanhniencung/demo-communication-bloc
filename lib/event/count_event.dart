import 'package:flutterappcomunicationbloc/event/base_event.dart';

class CountEvent extends BaseEvent {
  final int count;
  CountEvent(this.count);
}
