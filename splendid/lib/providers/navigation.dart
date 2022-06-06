import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendid/gui/views/administration.dart';
import 'package:splendid/gui/views/clients.dart';
import 'package:splendid/gui/views/inbox.dart';
import 'package:splendid/gui/views/orders.dart';
import 'package:splendid/gui/views/settings.dart';
import 'package:splendid/gui/views/users.dart';

enum NavBarItem { inbox, clients, users, orders, administration, settings }

final navigationProvider = StateProvider<NavBarItem>((ref) => NavBarItem.inbox);
final pagesProvider = StateProvider<List<Widget>>(
  (ref) => [
    const Inbox(),
    const Clients(),
    const Users(),
    const Orders(),
    const Administration(),
    const Settings(),
  ],
);
