import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                        baseColor: Colors.amber,
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
                                leading: Icon(Icons.brush),
                                title: Text("Accent"),
                                trailing: Wrap(children: [
                                  ColorIndicator(
                                    width: 44,
                                    height: 44,
                                    borderRadius: 22,
                                    color: Colors.blue,
                                    onSelect: () => {},
                                  ),
                                  SizedBox(width: 5),
                                  ColorIndicator(
                                    width: 44,
                                    height: 44,
                                    borderRadius: 22,
                                    color: Colors.red,
                                    onSelect: () => {},
                                  ),
                                  SizedBox(width: 5),
                                  ColorIndicator(
                                    width: 44,
                                    height: 44,
                                    borderRadius: 22,
                                    color: Colors.pink,
                                    onSelect: () => {},
                                  ),
                                  SizedBox(width: 5),
                                  ColorIndicator(
                                    width: 44,
                                    height: 44,
                                    borderRadius: 22,
                                    color: Colors.green,
                                    onSelect: () => {},
                                  ),
                                  SizedBox(width: 5),
                                  ColorIndicator(
                                    width: 44,
                                    height: 44,
                                    borderRadius: 22,
                                    color: Colors.purple,
                                    onSelect: () => {},
                                  ),
                                  SizedBox(width: 5),
                                  ColorIndicator(
                                    width: 44,
                                    height: 44,
                                    borderRadius: 22,
                                    color: Colors.black,
                                    onSelect: () => {},
                                  ),
                                ]),
                              ),
                              ListTile(
                                iconColor:
                                    Theme.of(context).colorScheme.secondary,
                                textColor:
                                    Theme.of(context).colorScheme.secondary,
                                leading: Icon(Icons.nightlight),
                                title: Text("Theme"),
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
