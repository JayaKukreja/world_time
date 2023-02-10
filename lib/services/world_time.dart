import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  late String time;
  String endpoint;
  late String? img;
  String place;
  late bool isDaytime;

  WorldTime({required this.endpoint, this.img,required this.place});

  Future<void> getTime() async {
    try {
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$endpoint');
      Response response = await get(url);
      // converts string(json) to object i.e. Map
      Map data = jsonDecode(response.body);
      place = place;
      print('data:$data');
      // place = data['location'];
      // place = data[place];
      String dateTime = data['datetime'];
      // print(dateTime);
      String offset = data['utc_offset'].substring(1, 3);
      String minutes = data['utc_offset'].substring(4);
      DateTime now = DateTime.parse(dateTime);
      var now2 = now
          .add(Duration(hours: int.parse(offset), minutes: int.parse(minutes)));
      // setState(() {
      // time = now2.toString();
      time = DateFormat.jm().format(now2);
      isDaytime = now.hour >= 6 && now.hour < 20 ? true : false;
      print(now2.toString());
      print(time);
    } catch (e) {
      print('Error: $e');
      time = 'not retrieved';
    }
    // });
    // return time;
  }
}
