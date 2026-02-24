import 'package:flutter/material.dart';
import 'package:lms/global/utils/helper/console_logger.dart';

import '../utils/helper/local_storage_helper.dart';

class AppStateModel with ChangeNotifier {
  bool _authenticated  = false;
  String? _userToken;
  Locale _locale = const Locale("en");
  // AuthModel? _userInfo;

  // AuthModel? get userInfo => _userInfo;

  Locale get locale => _locale;

  bool get isAuthenticated => _authenticated;

  String? get userToken => _userToken;

  bool get rtl => _locale == const Locale("ar");

  Future<void> init() async {
    await _loadUserPreferences();
  }

  void setLocale(Locale locale) {
    if (_locale != locale) {
      _locale = locale;
      debugPrint('set this local ${locale.languageCode}');
      notifyListeners();
    }
  }

  Future<void> _loadUserPreferences() async {
    // final storedUser = await LocalStorageHelper.getUserData();
    final storedToken = await LocalStorageHelper.getToken();
    final storedLocale = await LocalStorageHelper.getLocale();

    // printSuccess('AppStateModel - storedUser: $storedUser');
    printSuccess('AppStateModel - storedToken: $storedToken');
    printSuccess('AppStateModel - storedLocale: $storedLocale');

    // _userInfo = storedUser;
    _userToken = storedToken;
    _locale = storedLocale;
    _authenticated = (_userToken != null && _userToken!.isNotEmpty);

    // _authenticated = _userInfo != null &&
    //     _userToken != null &&
    //     _userToken!.isNotEmpty &&
    //     _userInfo?.registered == true;

    printSuccess('AppStateModel - _authenticated: $_authenticated');
    notifyListeners();
  }

  // Future<void> updateUserPreferences(AuthModel newData) async {
  //   await LocalStorageHelper.setUserData(newData);
  //   _userInfo = newData;
  //   _userToken = newData.token;
  //   _authenticated = true;
  //   notifyListeners();
  // }

  Future<void> updateToken({required newToken}) async {
    _userToken = newToken;
    notifyListeners();
  }

  // Future<void> logout() async {
  //   await LocalStorageHelper.clearUserData();
  //   _authenticated = false;
  //   _userToken = null;
  //   _userInfo = null;
  //   notifyListeners();
  // }
}
