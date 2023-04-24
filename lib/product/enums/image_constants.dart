import 'package:flutter/material.dart';

enum IconConstants {
  microphone('microphone'),
  appIcon('nuntium'),
  ;

  final String value;
  const IconConstants(this.value);

  String get toPng => 'assets/icon/ic_$value.png';
  Image get toImage => Image.asset(toPng);
}
