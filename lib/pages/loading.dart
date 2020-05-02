import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async
  {
    WorldTime instance=WorldTime(location:'cairo',flag:'cairo',url:'Africa/Cairo');
    await instance.getTime();
    print(instance.time);
  }

  @override
  void initState() {
    // TODO: implement initState
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
          child:Text('loading screen'),
      ),
    );
  }
}
