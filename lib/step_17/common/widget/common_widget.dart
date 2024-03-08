import 'package:flutter/material.dart';

/// 縦方向32ピクセルのマージン用
Widget padding32() {
  return _padding(32);
}

Widget _padding(double d) {
  return Padding(
    padding: EdgeInsets.only(
      top: d,
    ),
  );
}
