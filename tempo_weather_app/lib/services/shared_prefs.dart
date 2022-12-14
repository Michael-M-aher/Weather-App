import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/strings.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;
  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  bool get firstOpen => _sharedPrefs!.getBool(keyFirstOpen) ?? true;

  set firstOpen(bool value) {
    _sharedPrefs!.setBool(keyFirstOpen, value);
  }

  String get tempUnit => _sharedPrefs!.getString(keyTempUnit) ?? "Celcius";

  set tempUnit(String value) {
    _sharedPrefs!.setString(keyTempUnit, value);
  }

  String get windSpeedUnit =>
      _sharedPrefs!.getString(keyWindSpeedUnit) ?? "m/s";

  set windSpeedUnit(String value) {
    _sharedPrefs!.setString(keyWindSpeedUnit, value);
  }

  LatLong get location {
    double lat = _sharedPrefs!.getDouble(keyLat) ?? 30.0444;
    double long = _sharedPrefs!.getDouble(keyLat) ?? 31.2357;
    return LatLong(lat, long);
  }

  set location(LatLong value) {
    _sharedPrefs!.setDouble(keyLat, value.latitude);
    _sharedPrefs!.setDouble(keyLong, value.longitude);
  }

  String get weather1h => _sharedPrefs!.getString(keyWeather1h) ?? '';

  set weather1h(String value) {
    _sharedPrefs!.setString(keyWeather1h, value);
  }

  String get weather1d => _sharedPrefs!.getString(keyWeather1d) ?? '';

  set weather1d(String value) {
    _sharedPrefs!.setString(keyWeather1d, value);
  }

  String getFullAddress() {
    return _sharedPrefs!.getString(keyLocality) != null
        ? '${_sharedPrefs!.getString(keyLocality)}, ${_sharedPrefs!.getString(keyGovernment)}, ${_sharedPrefs!.getString(keyCountry)}'
        : 'Cairo, Egypt';
  }

  String getShortAddress() {
    return _sharedPrefs!.getString(keyLocality) != null
        ? '${_sharedPrefs!.getString(keyLocality)}, ${_sharedPrefs!.getString(keyCountry)}'
        : 'Cairo, Egypt';
  }

  void setAddress(Map<String, dynamic> address, LatLong latLong) async {
    _sharedPrefs!.setString(
        keyLocality,
        address['neighbourhood'] ??
            address['suburb'] ??
            address['road'] ??
            address['city'] ??
            '');
    _sharedPrefs!.setString(keyGovernment, address['city'] ?? 'Cairo');
    _sharedPrefs!.setString(keyCountry, address['country'] ?? 'Egypt');
  }
}

final sharedPrefs = SharedPrefs();
