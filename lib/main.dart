import 'package:flutter/material.dart';
import 'Sortiment.dart';
import 'CAppBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentBody;

    switch (currentPageIndex) {
      case 1:
        currentBody = const Sortiment();
        break;
      case 2:
        currentBody = const Center(child: Text("Warenkorb Placeholder"));
        break;
      case 0:
      default:
        currentBody = const Center(child: Text("Home Placeholder"));
        break;
    }

    return Scaffold(
      appBar: CAppBar(),
      body: currentBody,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.list)),
            label: 'Sortiment',
          ),
          NavigationDestination(
            icon: Badge(label: Text('2'), child: Icon(Icons.shopping_bag)),
            label: 'Warenkorb',
          ),
        ],
      ),
    );
  }
}


class Card_ extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardClass();
}

class _CardClass extends State<Card_> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.safety_check),
              title: Text("Card Number :"),
              subtitle: Text("Press on Card for more options"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {},
                  child: const Text("mehr entdecken"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
