import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeColor { blue, red, pink, yellow, green, purple }

final themeProvider = StateProvider<ThemeColor>((ref) => ThemeColor.blue);

final colorsProvider = StateProvider<List<Color>>(
  (ref) => [
    Colors.blue,
    Colors.red,
    Colors.pink,
    Colors.yellow,
    Colors.green,
    Colors.purple,
  ],
);

final colorNamesProvider = StateProvider<List<String>>(
  (ref) => [
    "blue",
    "red",
    "pink",
    "yellow",
    "green",
    "purple",
  ],
);
