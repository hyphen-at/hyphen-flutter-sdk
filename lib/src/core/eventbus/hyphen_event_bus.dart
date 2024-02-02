import 'package:hyphen_flutter_sdk/src/core/eventbus/hyphen_event_bus_type.dart';
import 'package:event_bus/event_bus.dart';

class HyphenEventBus {
  static final EventBus _eventBus = EventBus();
  static final _HyphenEventBusInstance _instance = _HyphenEventBusInstance(); // to-do

  static void initialize() {
    //_eventBus.register(_instance);
  }

  static void post(HyphenEventBusType event) {
    _eventBus.fire(event);
  }

  static void onEventReceived(Function(HyphenEventBusType) callback) {
    _eventBus.on<HyphenEventBusType>().listen((event) {
      callback(event);
    });
  }
}

class _HyphenEventBusInstance {}
