import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/Loading.dart';
import 'package:worldtime/pages/ninja_card.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/home',
        routes: {
            '/':(context) =>Loading(),
            '/home':(context)=>Home(),
            '/location': (context) =>ChooseLocation(),
            '/NinjaCard':(context) =>NinjaCard(),
        },
    ),
);
