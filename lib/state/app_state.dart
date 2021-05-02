import 'package:flutter/foundation.dart';

import 'package:cashtrack/domain/model/user.dart';

class AppState extends ChangeNotifier {
  User _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}
