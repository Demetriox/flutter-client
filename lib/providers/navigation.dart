import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprint/gui/views/admin.dart';
import 'package:sprint/gui/views/board.dart';
import 'package:sprint/gui/views/dashboard.dart';
import 'package:sprint/gui/views/settings.dart';

enum NavBarItem { dashboard, board, administration, settings }

final navigationProvider =
    StateProvider<NavBarItem>((ref) => NavBarItem.dashboard);

final pagesProvider = StateProvider<List<Widget>>(
  (ref) => [
    const Dashboard(),
    const Board(),
    const Admin(),
    const Settings(),
  ],
);
