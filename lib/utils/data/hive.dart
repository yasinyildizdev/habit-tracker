import 'package:hive_flutter/hive_flutter.dart';

var myBox = Hive.box('userPrefs');

dynamic hiveWriteData(String key, dynamic value) {
  myBox.put(key, value);
  return value;
}

dynamic hiveToggleData(String key) {
  dynamic x = hiveReadData(key);
  hiveWriteData(key, !x);
  return !x;
}

dynamic hiveReadData(String key) {
  return myBox.get(key);
}

void hiveDeleteData(String key) {
  myBox.delete(key);
}