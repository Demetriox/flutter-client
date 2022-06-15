import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendid/providers/theme.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  ConsumerState<Settings> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<Settings> {
  @override
  void initState() {
    super.initState();
    ref.read(themeProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ExpansionTileCard(
                        expandedTextColor:
                            Theme.of(context).colorScheme.primary,
                        leading: const Icon(Icons.color_lens),
                        title: const Text("Appearance"),
                        trailing: const Icon(Icons.arrow_drop_down),
                        children: [
                          ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                iconColor:
                                    Theme.of(context).colorScheme.secondary,
                                textColor:
                                    Theme.of(context).colorScheme.secondary,
                                leading: const Icon(Icons.brush),
                                title: const Text("Accent"),
                                trailing: Wrap(
                                  children: [
                                    ColorIndicator(
                                      width: 44,
                                      height: 44,
                                      borderRadius: 22,
                                      color: Colors.blue,
                                      onSelect: () => ref
                                          .read(themeProvider.notifier)
                                          .update((state) =>
                                              state = ThemeColor.blue),
                                    ),
                                    const SizedBox(width: 5),
                                    ColorIndicator(
                                      width: 44,
                                      height: 44,
                                      borderRadius: 22,
                                      color: Colors.red,
                                      onSelect: () => ref
                                          .read(themeProvider.notifier)
                                          .update((state) =>
                                              state = ThemeColor.red),
                                    ),
                                    const SizedBox(width: 5),
                                    ColorIndicator(
                                      width: 44,
                                      height: 44,
                                      borderRadius: 22,
                                      color: Colors.pink,
                                      onSelect: () => ref
                                          .read(themeProvider.notifier)
                                          .update((state) =>
                                              state = ThemeColor.pink),
                                    ),
                                    const SizedBox(width: 5),
                                    ColorIndicator(
                                      width: 44,
                                      height: 44,
                                      borderRadius: 22,
                                      color: Colors.yellow,
                                      onSelect: () => ref
                                          .read(themeProvider.notifier)
                                          .update((state) =>
                                              state = ThemeColor.yellow),
                                    ),
                                    const SizedBox(width: 5),
                                    ColorIndicator(
                                      width: 44,
                                      height: 44,
                                      borderRadius: 22,
                                      color: Colors.green,
                                      onSelect: () => ref
                                          .read(themeProvider.notifier)
                                          .update((state) =>
                                              state = ThemeColor.green),
                                    ),
                                    const SizedBox(width: 5),
                                    ColorIndicator(
                                      width: 44,
                                      height: 44,
                                      borderRadius: 22,
                                      color: Colors.purple,
                                      onSelect: () => ref
                                          .read(themeProvider.notifier)
                                          .update((state) =>
                                              state = ThemeColor.purple),
                                    ),
                                  ],
                                ),
                              ),
                              ListTile(
                                iconColor:
                                    Theme.of(context).colorScheme.secondary,
                                textColor:
                                    Theme.of(context).colorScheme.secondary,
                                leading: const Icon(Icons.nightlight),
                                title: const Text("Theme"),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
