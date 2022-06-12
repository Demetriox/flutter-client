import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendid/gui/views/admin.dart';
import 'package:splendid/gui/views/board.dart';
import 'package:splendid/gui/views/clients.dart';
import 'package:splendid/gui/views/dashboard.dart';
import 'package:splendid/gui/views/inbox.dart';
import 'package:splendid/gui/views/tasks.dart';
import 'package:splendid/gui/views/settings.dart';
import 'package:splendid/gui/views/users.dart';

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
