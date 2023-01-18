// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bachao_pakistan/modals/users_modal.dart';
import 'package:bachao_pakistan/services/user_service.dart';
import 'package:flutter/material.dart';

// import '../../user.dart';

class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({super.key});

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {
  UserService listedUsers = UserService();
  List<Datum>? users;

  // @override
  // void initState() {
  //   super.initState();
  //   setState(
  //     () {
  //       users = List.of(allUsers);
  //     },
  //   );
  // }

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
          'Payment History',
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
                child: Column(
                  children: [
                    Row(
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
                              users[index].earnings,
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
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
