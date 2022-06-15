import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeColor { pink, blue, red, yellow, green, purple, black, white }

final themeProvider = StateProvider<ThemeColor>((ref) => ThemeColor.blue);
