// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    Key? key,
    required this.value,
    required this.color,
  }) : super(key: key);
  final String value;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.textTheme.titleMedium?.copyWith(
        color: color
      ),
    );
  }
}
