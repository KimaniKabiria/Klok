import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
        child: Column(
          children: [
            Text(
              data['time'],
              style: TextStyle(
                fontSize: 100.0,
                fontFamily: 'Bellota',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_pin),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontFamily: 'Bellota',
                        fontSize: 28.0,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text('Edit Location'))
          ],
        ),
      )),
    );
  }
}
