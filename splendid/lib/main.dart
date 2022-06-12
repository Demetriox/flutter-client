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
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.light,
          secondary: Colors.amber,
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
  }

  var isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final selectedItem = ref.watch(navigationProvider);
    final pages = ref.watch(pagesProvider);
    return Scaffold(
      body: Row(children: [
        Column(
          children: [
            SizedBox(
              width: xOverflow,
              height: MediaQuery.of(context).size.height,
              child: RotatedBox(
                quarterTurns: 1,
                child: NavigationBar(
                  animationDuration: const Duration(milliseconds: 100),
                  labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                  selectedIndex: selectedItem.index,
                  onDestinationSelected: (index) => {
                    ref.read(navigationProvider.notifier).update(
                        (state) => state = NavBarItem.values.elementAt(index))
                  },
                  destinations: const [
                    RotatedBox(
                      quarterTurns: 3,
                      child: NavigationDestination(
                        icon: Icon(Icons.space_dashboard),
                        label: "Dashboard",
                        tooltip: "",
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: NavigationDestination(
                        icon: Icon(Icons.inbox),
                        label: "Inbox",
                        tooltip: "",
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: NavigationDestination(
                        icon: Icon(Icons.badge),
                        label: "Clients",
                        tooltip: "",
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: NavigationDestination(
                        icon: Icon(Icons.supervised_user_circle),
                        label: "Users",
                        tooltip: "",
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: NavigationDestination(
                        icon: Icon(Icons.task),
                        label: "Tasks",
                        tooltip: "",
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: NavigationDestination(
                        icon: Icon(Icons.content_paste),
                        label: "Board",
                        tooltip: "",
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: NavigationDestination(
                        icon: Icon(Icons.shield_outlined),
                        label: "Admin",
                        tooltip: "",
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: NavigationDestination(
                        icon: Icon(Icons.settings),
                        label: "Settings",
                        tooltip: "",
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - xOverflow,
              height: yOverflow,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => {},
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
            SizedBox(
              height: MediaQuery.of(context).size.height - yOverflow,
              width: MediaQuery.of(context).size.width - xOverflow,
              child: pages[selectedItem.index],
            )
          ],
        )
      ]),
    );
  }
}
