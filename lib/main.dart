import 'dart:io' show Platform;
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sprint/gui/widgets/global/sidebar.dart';
import 'package:sprint/providers/navigation.dart';
import 'package:sprint/providers/theme.dart';
import 'package:sprint/utils/constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  if (isMobile) {
    FlutterNativeSplash.remove();
  }
  runApp(const ProviderScope(child: MyApp()));
  doWhenWindowReady(() {
    if (!isMobile) {
      final win = appWindow;
      const minSize = Size(600, 450);
      win.minSize = minSize;
      win.alignment = Alignment.center;
      win.title = "Sprint";
      win.show();
    }
  });
}

void initialization(BuildContext context) async {
  //Load dependencies and more
  dotenv.load();
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeProvider);
    final colors = ref.watch(colorsProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sprint',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: colors[selectedTheme.index],
          brightness: Brightness.light,
        ),
      ),
      home: const Home(title: 'Sprint'),
    );
  }
}

class Home extends ConsumerStatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    ref.read(navigationProvider);
    ref.read(themeProvider);
  }

  var isSidebarVisible = true;

  @override
  Widget build(BuildContext context) {
    final selectedItem = ref.watch(navigationProvider);
    final pages = ref.watch(pagesProvider);
    return Scaffold(
      bottomNavigationBar: Visibility(
        visible: isMobile,
        child: Sidebar(selectedItem: selectedItem, ref: ref),
      ),
      appBar: isMobile ? AppBar(title: const Text("Sprint")) : null,
      body: isMobile
          ? pages[selectedItem.index]
          : WindowBorder(
              color: Theme.of(context).colorScheme.background,
              width: 1,
              child: Row(
                children: [
                  Visibility(
                    visible: isSidebarVisible,
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        children: [
                          Container(
                            height: Platform.isMacOS ? 50 : 0,
                            color: Theme.of(context).colorScheme.background,
                            child: WindowTitleBarBox(
                              child: Expanded(child: MoveWindow()),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child:
                                  Sidebar(selectedItem: selectedItem, ref: ref),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            color: Theme.of(context).colorScheme.background,
                            child: WindowTitleBarBox(
                              child: Row(
                                children: [
                                  Container(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Visibility(
                                              visible: !isSidebarVisible,
                                              child: const SizedBox(width: 80)),
                                          TextButton(
                                            onPressed: () => setState(() {
                                              isSidebarVisible =
                                                  !isSidebarVisible;
                                            }),
                                            child: const Icon(
                                                Icons.vertical_split),
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: MoveWindow(
                                      child: Row(
                                        children: [
                                          Text(
                                            selectedItem.name.characters.first
                                                    .toUpperCase() +
                                                selectedItem.name.substring(1),
                                            style:
                                                const TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const WindowButtons(),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: pages[selectedItem.index],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF000000),
    mouseOver: const Color(0xFFe9e9e9),
    mouseDown: const Color.fromARGB(255, 241, 240, 240),
    iconMouseOver: const Color(0xFF000000),
    iconMouseDown: const Color(0xFF000000));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF000000),
    iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
