import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService {
  static final ConfigService _singleton = new ConfigService._internal();
  String _endpointHost;
  String _deviceName;
  String get deviceName => _deviceName;
  String get endpointHost => _endpointHost;
  bool _synchronizeClipboard;
  bool get synchronizeClipboard => _synchronizeClipboard;

  factory ConfigService() {
    return _singleton;
  }

  ConfigService._internal() {}

  Future<bool> initialize() async {
    _deviceName = await _getDeviceName();
    _endpointHost = await _getEndpointHost();
    _synchronizeClipboard = await _getSynchronizeClipboard();
    print("config initialized");
    return true;
  }

  Future<String> _getDeviceName() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceName");
  }

  Future<String> _getEndpointHost() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString("endpointHost");
  }

  Future<bool> _getSynchronizeClipboard() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool("synchronizeClipboard");
  }

  set endpointHost(String endpointHost) {
    var prefs = SharedPreferences.getInstance();
    prefs.then((instance) {
      instance.setString("endpointHost", endpointHost);
      _endpointHost = endpointHost;
    });
  }

  set deviceName(String deviceName) {
    var prefs = SharedPreferences.getInstance();
    prefs.then((instance) {
      instance.setString("deviceName", deviceName);
      _deviceName = deviceName;
    });
  }

  set synchronizeClipboard(bool synchronizeClipboard) {
    var prefs = SharedPreferences.getInstance();
    prefs.then((instance) {
      instance.setBool("synchronizeClipboard", synchronizeClipboard);
      _synchronizeClipboard = synchronizeClipboard;
    });
  }
}
