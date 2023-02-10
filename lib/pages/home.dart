import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  late String bgImage;

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    bgImage = data['isDaytime'] ? 'day.png' : 'night.jpeg';
    Color bgColor = data['isDaytime'] ? Colors.white : Colors.purple;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/$bgImage'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result =
                            await Navigator.pushNamed(context, '/location');
                        print("result:$result");
                        setState(() {
                          data = {
                            'time': result['time'],
                            'place': result['place'],
                            'isDaytime': result['isDaytime'],
                          };
                        });
                        print("data:$data");
                      },
                      icon: const Icon(Icons.edit_location),
                      label: const Text('Edit Location')),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    data['place'],
                    style: const TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    data['time'],
                    style: const TextStyle(fontSize: 60),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
