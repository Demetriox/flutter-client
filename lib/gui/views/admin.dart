import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 350,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SettingsList(
                  lightTheme: const SettingsThemeData(
                    settingsListBackground: Colors.transparent,
                    settingsSectionBackground: Colors.transparent,
                  ),
                  darkTheme: const SettingsThemeData(
                    settingsListBackground: Colors.transparent,
                    settingsSectionBackground: Colors.transparent,
                  ),
                  sections: [
                    SettingsSection(
                      title: const Text("Administration"),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                            leading: const Icon(Icons.badge),
                            title: const Text("Clients"),
                            onPressed: (context) => {}),
                        SettingsTile.navigation(
                            leading: const Icon(Icons.supervised_user_circle),
                            title: const Text("Users"),
                            onPressed: (context) => {}),
                        SettingsTile.navigation(
                            leading: const Icon(Icons.task),
                            title: const Text("Tasks"),
                            onPressed: (context) => {}),
                        SettingsTile.navigation(
                            leading: const Icon(Icons.task),
                            title: const Text("Tasks"),
                            onPressed: (context) => {}),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Settings"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
