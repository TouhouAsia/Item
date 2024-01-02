import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _hashcode = prefs.getString('ff_hashcode') ?? _hashcode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _CameraPermission = false;
  bool get CameraPermission => _CameraPermission;
  set CameraPermission(bool _value) {
    _CameraPermission = _value;
  }

  bool _PhotosPermission = false;
  bool get PhotosPermission => _PhotosPermission;
  set PhotosPermission(bool _value) {
    _PhotosPermission = _value;
  }

  String _hashcode = '';
  String get hashcode => _hashcode;
  set hashcode(String _value) {
    _hashcode = _value;
    prefs.setString('ff_hashcode', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
