import 'dart:convert';
import 'dart:io';

import 'package:botx/requests/server_requests.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class loginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => loginPageState();
}

// ignore: camel_case_types
class loginPageState extends State<loginPage> {
  final String userUrl = "http://test-haran.ddns.net:8000/user/";
  final String apiUrl = "http://test-haran.ddns.net:8000/api/";
  final String updateUrl = "http://test-haran.ddns.net:8000/bot_update/";
  final String dataUrl = "http://test-haran.ddns.net:8000/bot_data/";
  UserModel _user;
  Future<UserModel> createUser(String id, String password) async {
    final response1 = await http.post(userUrl,
        body: jsonEncode(<String, String>{
          "username": id,
          "password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response1.statusCode == 200) {
      final String u = response1.body;
      print("-------TEST_USER-------");
      print(jsonEncode(<String, String>{
        "username": id,
        "password": password,
      }));
      print(u);
      return userModelFromJson(u);
    } else {
      print(response1.statusCode);
    }
  }

  Future apiTest() async {
    final response2 = await http.post(apiUrl,
        body: jsonEncode({
          'Session_Id': _user.sessionId,
          'Hash_Data': _user.hash,
          'User_id': _user.userId,
          'Start_Latitude': '7.52525',
          'Start_Longitude': '7.551458',
          'End_Latitude': '8.6862',
          'End_Longitude': '8.47522',
          'Raw_Data': 'vsfvvvrwrvsvfvsfv'
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response2.statusCode == 200) {
      final String api = response2.body;
      print("------TEST_API------");
      print(jsonEncode({
        'Session_Id': _user.sessionId,
        'Hash_Data': _user.hash,
        'User_id': _user.userId,
        'Start_Latitude': '7.52525',
        'Start_Longitude': '7.551458',
        'End_Latitude': '8.6862',
        'End_Longitude': '8.47522',
        'Raw_Data': 'vsfvvvrwrvsvfvsfv'
      }));
      print(api);
      botTest();
    } else {
      print(response2.statusCode);
      botTest();
    }
  }

  Future botTest() async {
    final response3 = await http.post(updateUrl,
        body: jsonEncode({
          'Key': 'LuciferMoringStar',
          'Id': '1',
          'Battery': '99',
          'Latitide': '24525245',
          'Longitide': '152.659626',
          'lock': '1',
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response3.statusCode == 200) {
      final String update = response3.body;
      print("------TEST_UPDATE------");
      print(jsonEncode({
        'Key': 'LuciferMoringStar',
        'Id': '1',
        'Battery': '99',
        'Latitide': '24525245',
        'Longitide': '152.659626',
        'lock': '1'
      }));
      print(update);

      dataTest();
      //return (userModelFromJson(user));
    } else {
      print(response3.statusCode);
      dataTest();
      //return null;
    }
  }

  Future dataTest() async {
    final response4 = await http.post(dataUrl,
        body: jsonEncode({
          'Bot_uuid': '1',
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    if (response4.statusCode == 200) {
      final String update = response4.body;
      print("------TEST_DATA------");
      print(jsonEncode({
        'Bot_uuid': '1',
      }));
      print(update);
      //return (userModelFromJson(user));
    } else {
      print(response4.statusCode);
      //return null;
    }
  }

  @override
  void initState() {
    super.initState();
    yes();
  }

  yes() async {
    final UserModel user = await createUser('Haran', 'Haran123');
    setState(() {
      _user = user;
      apiTest();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 0,
      height: 0,
    );
  }
}
