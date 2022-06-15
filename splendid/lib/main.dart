import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendid/gui/widgets/global/sidebar.dart';
import 'package:splendid/providers/navigation.dart';
import 'package:splendid/providers/theme.dart';
import 'package:splendid/utils/constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  if (isMobile) {
    FlutterNativeSplash.remove();
  }
  runApp(const ProviderScope(child: MyApp()));
  doWhenWindowReady(() {
    final win = appWindow;
    const minSize = Size(600, 450);
    win.minSize = minSize;
    win.alignment = Alignment.center;
    win.title = "Sprint";
    win.show();
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
      home: const Home(title: 'Splendid'),
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
      body: WindowBorder(
        color: Theme.of(context).colorScheme.background,
        width: 1,
        child: Row(
          children: [
            Visibility(
              visible: isSidebarVisible,
              child: Column(
                children: [
                  SizedBox(
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: Column(
                        children: [
                          WindowTitleBarBox(child: MoveWindow()),
                          Sidebar(selectedItem: selectedItem, ref: ref)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      color: Theme.of(context).colorScheme.background,
                      child: WindowTitleBarBox(
                        child: Row(
                          children: [
                            Expanded(child: MoveWindow()),
                            const WindowButtons(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () => setState(() {
                                isSidebarVisible = !isSidebarVisible;
                              }),
                              child: const Icon(Icons.vertical_split),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              selectedItem.name.characters.first.toUpperCase() +
                                  selectedItem.name.substring(1),
                              style: const TextStyle(fontSize: 18),
                            )
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
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
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
