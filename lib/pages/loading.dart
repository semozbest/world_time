import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async
  {
    WorldTime instance=WorldTime(location:'cairo',flag:'cairo',url:'Africa/Cairo');
    await instance.getTime();
    Navigator.pushReplacementNamed(context,'/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body:Center(
        child:SpinKitFadingCube(
          color:Colors.redAccent,
          size:90.0,
          duration: Duration(seconds: 2),
        ),
      )
    );
  }
}
