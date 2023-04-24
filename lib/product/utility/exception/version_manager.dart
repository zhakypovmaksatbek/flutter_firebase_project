import 'package:flutter_firebase_project/product/utility/exception/custom_exception.dart';

class VersionManager {
  VersionManager({required this.deviceValue, required this.databaseValue});

  final String deviceValue;
  final String databaseValue;
  bool isNeedUpdate() {
    final deviceNumberSplit = deviceValue.split('.').join();
    final databaseNumberSplit = databaseValue.split('.').join();

    final deviceNumber = int.tryParse(deviceNumberSplit);
    final databaseNumber = int.tryParse(databaseNumberSplit);

    if (deviceNumber == null || databaseNumber == null) {
      throw VersionCustomException(
          '$deviceValue or $databaseValue is not valid parse');
    }
    return deviceNumber < databaseNumber;
  }
}
