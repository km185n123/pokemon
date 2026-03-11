import 'dart:async';

class TabEventBus {
  final _tabController = StreamController<int>.broadcast();

  Stream<int> get tabStream => _tabController.stream;

  void tabChanged(int index) {
    _tabController.add(index);
  }

  void dispose() {
    _tabController.close();
  }
}
