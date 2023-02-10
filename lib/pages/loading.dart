import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  WorldTime instance = WorldTime(endpoint: 'Europe/London',place: 'London');

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await instance.getTime();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'place': instance.place,
      'time': instance.time,
      'img': instance.img,
      'isDaytime': instance.isDaytime
    });
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.black45,
        body: SpinKitRotatingPlain(
          color: Colors.white,
          size: 50.0,
        ));
  }
}
