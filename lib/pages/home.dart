import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/about.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  final btmNavItems = const [
    Icon(Icons.watch_later, size: 30),
    Icon(Icons.info_outline, size: 30),
    // Icon(Icons.compare_arrows, size: 30),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      body: SafeArea(
        child: getSelectedWidget(index: index),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.yellow[200])),
        child: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.black54,
          color: Colors.black87,
          items: btmNavItems,
          index: index,
          animationDuration: const Duration(
            milliseconds: 200,
          ),
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
        ),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const Home();
        break;
      case 1:
        widget = const About();
        break;
      default:
        widget = const Home();
        break;
    }
    return widget;
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    // Set Background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Icon timeIcon = data['isDayTime']
        ? const Icon(
            Icons.light_mode,
            size: 200.0,
            color: Colors.amber,
          )
        : const Icon(
            Icons.dark_mode,
            size: 200.0,
          );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
      child: Column(
        children: [
          timeIcon,
          const SizedBox(
            height: 50.0,
          ),
          Text(
            data['time'],
            style: const TextStyle(
              fontSize: 80.0,
              fontFamily: 'Bellota',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_pin,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontFamily: 'Bellota',
                      fontSize: 28.0,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.white70,
                  ),
                  label: const Text(
                    'Change Location',
                    style: TextStyle(fontSize: 20.0, color: Colors.white70),
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black87),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
