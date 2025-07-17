import 'package:flutter/material.dart';
import 'Sortiment.dart';
import 'CAppBar.dart';
import 'FilterView.dart';


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
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF0066CC),       // Primary Blue
          onPrimary: Colors.white,          // Text on primary buttons
          secondary: Color(0xFF2B2B2B),     // For headings or icons
          onSecondary: Colors.white,        // Text on secondary surfaces
          background: Color(0xFFE5EAF1),     // Background
          onBackground: Color(0xFF2B2B2B),   // General text
          surface: Colors.white,            // Cards, containers
          onSurface: Color(0xFF8A8A8A),
          error: Colors.red,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: Color(0xFFE5EAF1), // Match screen bg
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFE5EAF1),
          foregroundColor: Color(0xFF2B2B2B),
          elevation: 0,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Color(0xFF2B2B2B)), // replaces headline6
          bodyMedium: TextStyle(color: Color(0xFF8A8A8A)), // replaces bodyText2
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0066CC),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
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
  String? filterSearchParam;

  void _onSearchSelected(String searchParam) {
    setState(() {
      filterSearchParam = searchParam;
    });
  }

  void _clearFilter() {
    setState(() {
      filterSearchParam = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentBody;

    if (filterSearchParam != null) {
      currentBody = FilterView(searchParam: filterSearchParam);
    } else {
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
    }

    return Scaffold(
      appBar: filterSearchParam != null
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _clearFilter,
              ),
              title:  Text(filterSearchParam ?? ''),
            )
          : CAppBar(onSearchSelected: _onSearchSelected),
      body: currentBody,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            filterSearchParam = null; // Reset search
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.list),
            label: 'Sortiment',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag),
            label: 'Warenkorb',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: 'Merkliste',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Home',
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
