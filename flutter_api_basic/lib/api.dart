import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API extends StatefulWidget {
  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  getuser() async {
    var users = [];
    var response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    var jsonData = jsonDecode(response.body);

    for (var i in jsonData) {
      UsersModel user =
          UsersModel(i['name'], i['username'], i['company']['name']);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getuser(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Container(
            child: Text('Nothing in Api'),
          );
        } else
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) {
              return ListTile(
                title: Text(snapshot.data[i].name),
                subtitle: Text(snapshot.data[i].company),
              );
            },
          );
      },
    ));
  }
}

class UsersModel {
  var name;
  var username;
  var company;

  UsersModel(this.name, this.username, this.company);
}
