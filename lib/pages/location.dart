import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(endpoint: 'Asia/Jakarta', place: 'Jakarta'),
    WorldTime(endpoint: 'America/New_York', place: 'New York'),
    WorldTime(endpoint: 'America/Chicago', place: 'Chicago'),
    WorldTime(endpoint: 'Europe/London', place: 'London'),
    WorldTime(endpoint: 'Asia/Kolkata', place: 'Kolkata')
  ];

  updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'place': instance.place,
      'time': instance.time,
      'img': instance.img,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: ((context, index) => Card(
                child: ListTile(
                  title: Text(locations[index].place!),
                  onTap: () {
                    updateTime(index);
                  },
                ),
              ))),
    );
  }
}
