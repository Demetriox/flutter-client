import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprint/gui/views/admin.dart';
import 'package:sprint/gui/views/board.dart';
import 'package:sprint/gui/views/clients.dart';
import 'package:sprint/gui/views/dashboard.dart';
import 'package:sprint/gui/views/inbox.dart';
import 'package:sprint/gui/views/tasks.dart';
import 'package:sprint/gui/views/settings.dart';
import 'package:sprint/gui/views/users.dart';

enum NavBarItem {
  dashboard,
  inbox,
  clients,
  users,
  orders,
  board,
  administration,
  settings
}

final navigationProvider =
    StateProvider<NavBarItem>((ref) => NavBarItem.dashboard);

final pagesProvider = StateProvider<List<Widget>>(
  (ref) => [
    const Dashboard(),
    const Inbox(),
    const Clients(),
    const Users(),
    const Tasks(),
    const Board(),
    const Admin(),
    const Settings(),
  ],
);
