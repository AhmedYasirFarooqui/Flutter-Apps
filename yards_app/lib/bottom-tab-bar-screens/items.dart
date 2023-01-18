// ignore_for_file: unused_local_variable, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({
    super.key,
    this.shipsName,
    this.rent,
    this.duration,
    this.people,
    this.overnight,
    this.fromdate,
    this.todate,
    this.fromtime,
    this.totime,
  });
  final String? shipsName;
  final String? rent;
  final String? duration;
  final String? people;
  final String? overnight;
  final String? fromdate;
  final String? todate;
  final String? fromtime;
  final String? totime;

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    // debugPrint(information.length.toString());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.0,
        backgroundColor: const Color(0xFF163257),
        centerTitle: true,
        title: const Text(
          'Items',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Card(
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height / 6,
                  child: Image(
                    image: AssetImage('assets/images/sail.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: height / 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$255',
                      style: TextStyle(
                        fontSize: 16.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: width / 1.5),
                    Text(
                      '19 Aug',
                      style: TextStyle(
                        fontSize: 16.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 50),
                Padding(
                  padding: EdgeInsets.only(right: height * 0.243),
                  child: Text(
                    'Muhammad Hamza',
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: height / 50),
                Padding(
                  padding: EdgeInsets.only(right: height * 0.3),
                  child: Text(
                    '03041234567',
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: information.length,
      //   itemBuilder: (context, index) {
      //     return InkWell(
      //       onTap: () {},
      //       child: Container(
      //         color: Colors.blue,
      //         child: Column(
      //           children: [
      //             Text(information[index]['ship name']),
      //             Text(information[index]['rent']),
      //             Text(information[index]['duration']),
      //           ],
      //         ),
      //       ),
      //       // child: Card(
      //       //   child: Container(
      //       //     color: Color(0xff87CEEB),
      //       //     child: ListTile(
      //       //       title: Text('New Buyer Request'),
      //       //       subtitle: Text(information[index]['fromdate']),
      //       //       trailing: Text(information[index]['fromtime']),
      //       //     ),
      //       //   ),
      //       // ),
      //     );
      //   },
      // ),
    );
  }
}
