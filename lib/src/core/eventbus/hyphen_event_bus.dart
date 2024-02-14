import 'package:hyphen_flutter_sdk/src/core/eventbus/hyphen_event_bus_type.dart';
import 'package:event_bus/event_bus.dart';

class HyphenEventBus {
  static final HyphenEventBus _instance = HyphenEventBus._internal();
  final EventBus _eventBus = EventBus();

  Function(HyphenEventBusType)? _onEventReceived;

  factory HyphenEventBus() {
    return _instance;
  }

  HyphenEventBus._internal() {
    initialize();
  }

  void initialize() {
    _eventBus.on<HyphenEventBusType>().listen((event) {
      _onEventReceived?.call(event);
    });
  }

  void post(HyphenEventBusType event) {
    _eventBus.fire(event);
  }

  void observe(void Function(HyphenEventBusType) callback) {
    _onEventReceived = callback;
  }
}

