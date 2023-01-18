// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:bachao_pakistan/custom-widgets/custom_options.dart';
import 'package:flutter/material.dart';

import '../../modals/users_modal.dart';
import '../../services/user_service.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  UserService listedUsers = UserService();
  List<Datum>? users;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF207dff),
        // automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'List of Users',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: FutureBuilder(
        future: listedUsers.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot) {
          if (snapshot.hasData) {
            List<Datum>? users = snapshot.data;
            return ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('${users[index].id}.'),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          users[index].name,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Text(
                          users[index].email,
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        trailing: Text(
                          '${users[index].earnings} Points',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
