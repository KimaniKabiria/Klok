import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //Location name for the UI
  String time = ''; //Time in that Location
  String flag; //Url to asset flag icon
  String url; //Location URL for API endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      //Make the request
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      Map data = jsonDecode(response.body);

      //Get properties from Data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //Create datetimer object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //Set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}
