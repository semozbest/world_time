import 'package:http/http.dart';
import 'dart:convert';
class WorldTime{
  String location; //location name for the UI
  String time;  // the time in that location
  String flag;  //flag of the country
  String url;   //location url

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    Response response= await get('http://worldtimeapi.org/api/timezone/$url');
    Map data=jsonDecode(response.body);

    //get properties from the data
    String datetime=data['datetime'];
    String offset=data['utc_offset'].substring(1,3);

    //create date time object
    DateTime now =DateTime.parse(datetime);
    now=now.add(Duration(hours:int.parse(offset)));

    //set the time property
    time=now.toString();
  }
}