import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splendid/providers/navigation.dart';
import 'package:splendid/utils/constants.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  if (isMobile) {
    FlutterNativeSplash.remove();
  }
  runApp(const ProviderScope(child: MyApp()));
}

void initialization(BuildContext context) async {
  //Load dependencies and more
  dotenv.load();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sprint',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  }

  var isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final selectedItem = ref.watch(navigationProvider);
    final pages = ref.watch(pagesProvider);
    return Scaffold(
      body: pages[selectedItem.index],
      appBar: AppBar(
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: NavigationBarTheme(
              data: NavigationBarThemeData(
                indicatorColor: Colors.white.withOpacity(0.5),
                labelTextStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              child: NavigationBar(
                animationDuration: const Duration(seconds: 1),
                labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
                height: 60,
                selectedIndex: selectedItem.index,
                onDestinationSelected: (index) => {
                  ref.read(navigationProvider.notifier).update(
                      (state) => state = NavBarItem.values.elementAt(index))
                },
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.menu),
                    label: "Menu",
                    tooltip: "",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.inbox),
                    label: "Inbox",
                    tooltip: "",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_add),
                    label: "Clients",
                    tooltip: "",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline),
                    label: "Users",
                    tooltip: "",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.dashboard_customize_sharp),
                    label: "Board",
                    tooltip: "",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.shield_outlined),
                    label: "Administration",
                    tooltip: "",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.settings),
                    label: "Settings",
                    tooltip: "",
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
