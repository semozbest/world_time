import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}
class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations=[
    WorldTime(url: 'Europe/London',location:'London',flag: 'https://www.countryflags.io/GB/flat/64.png' ),
    WorldTime(url: 'Europe/Berlin',location:'Germany',flag: 'https://www.countryflags.io/DE/flat/64.png' ),
    WorldTime(url: 'Africa/Cairo',location:'Cairo',flag: 'https://www.countryflags.io/EG/flat/64.png' ),
    WorldTime(url: 'Africa/Nairobi',location:'Nairobi',flag: 'https://www.countryflags.io/KE/flat/64.png' ),
    WorldTime(url: 'America/Chicago',location:'Chicago',flag: 'https://www.countryflags.io/US/flat/64.png' ),
    WorldTime(url: 'America/New_York',location:'New York',flag: 'https://www.countryflags.io/US/flat/64.png' ),
    WorldTime(url: 'Asia/Seoul',location:'Seoul',flag: 'https://www.countryflags.io/KR/flat/64.png' ),
    WorldTime(url: 'Asia/Jakarta',location:'Jakarta',flag: 'https://www.countryflags.io/ID/flat/64.png' ),
  ];

  void updateTime(index) async {
    WorldTime instance=locations[index];
    await instance.getTime();
    //navigate to home screen and pass it to home screen
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime
    });
  }
  @override
  Widget build(BuildContext context) {
    print('build funtion run');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:AppBar(
        backgroundColor: Colors.blue[900],
        title:Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child:ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(locations[index].flag),
              ),
            ),
          );
        },
      ),
    );
  }
}
