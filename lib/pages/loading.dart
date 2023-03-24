import 'package:flutter/material.dart';
import 'package:klock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi');
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.watch_later,
                color: Colors.yellow[50],
                size: 150.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'KLOCK',
                style: TextStyle(
                  fontFamily: 'Bellota',
                  fontSize: 80.0,
                  color: Colors.yellow[200],
                ),
              ),
              const SizedBox(height: 30.0),
              const SpinKitRing(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ));
  }
}
