// Author: jumail@utm.my.
// Date: Dec 2021

import 'package:flutter/foundation.dart';

class Viewmodel with ChangeNotifier {
  bool _initialized = false;
  bool get initialized => _initialized;
  void markInitialized() => _initialized = true;

  bool _busy = false;

  get busy => _busy;

  void turnBusy() {
    _busy = true;

    notifyListeners();
  }

  void turnIdle() {
    _busy = false;
    notifyListeners();
  }

  /// A convenient method, to implicitly write the turnBusy()... turnIdle()
  Future<void> update(AsyncCallback? fn) async {
    turnBusy();
    if (fn != null) await fn();
    turnIdle();
  }

  /// To be overridden by the child class if it needs to
  /// do something once the viewmodel has been created
  void init() => markInitialized();
}
