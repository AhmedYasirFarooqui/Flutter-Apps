// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

// import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:yards_app/rent_form.dart';

class BoatsInformation extends StatefulWidget {
  const BoatsInformation({
    super.key,
    this.name,
    this.modal,
    this.price,
    this.image,
    this.captain,
    this.location,
  });
  final String? image;
  final String? captain;
  final String? name;
  final String? modal;
  final String? location;
  final String? price;

  @override
  State<BoatsInformation> createState() => _BoatsInformationState();
}

class _BoatsInformationState extends State<BoatsInformation> {
  final _loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: width,
              height: height / 3,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 172, 215, 233),
                image: DecorationImage(
                  image: AssetImage(
                    widget.image!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox(height: height / 60),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                color: Color.fromARGB(255, 172, 215, 233),
              ),
              width: width,
              height: height / 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // padding: EdgeInsets.only(right: height * 0.15),
                    child: Row(
                      children: [
                        SizedBox(width: width / 50),
                        Text(
                          widget.name!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: width / 50),
                        Text(
                          widget.location!,
                          style: TextStyle(
                            color: Color(0xFF163257),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: width / 50),
                        Text(
                          widget.captain!,
                          style: TextStyle(
                            color: Color(0xFF163257),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: width / 50),
                        Text(
                          widget.price!,
                          style: TextStyle(
                            color: Color(0xFF163257),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: width / 1.8),
                        Text(
                          '${widget.modal!} Model',
                          style: TextStyle(
                            color: Color(0xFF163257),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 40),
            Row(
              children: [
                SizedBox(width: width / 45),
                Container(
                  child: Text(
                    'Rent',
                    style: TextStyle(
                      color: Color(0xFF163257),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: width / 1.8),
                Text(
                  '\$500 per Day',
                  style: TextStyle(
                    color: Color(0xFF163257),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: height / 40),
            InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  barrierDismissible: false, // user must tap button!
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Features',
                        style: TextStyle(
                          color: Color(0xFF163257),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          // itemBuilder:(context, index) => Text('● Feature 1'),
                          children: [
                            Text('● Feature'),
                            Text('● Feature'),
                            Text('● Feature'),
                            Text('● Feature'),
                            Text('● Feature'),
                            Text('● Feature'),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          child: const Text('ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  SizedBox(width: width / 45),
                  Container(
                    child: Text(
                      'Features',
                      style: TextStyle(
                        color: Color(0xFF163257),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: width / 1.4),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18.0,
                    color: Color(0xFF163257),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 40),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  SizedBox(width: width / 45),
                  Container(
                    child: Text(
                      'Refund Policy',
                      style: TextStyle(
                        color: Color(0xFF163257),
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: width / 1.63),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18.0,
                    color: Color(0xFF163257),
                  ),
                ],
              ),
            ),
            SizedBox(height: height / 40),
            Accordion(
              maxOpenSections: 2,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              contentBorderColor: Color(0xFF163257),
              children: [
                AccordionSection(
                  isOpen: false,
                  headerBackgroundColor: Color(0xFF163257),
                  headerBackgroundColorOpened: Color(0xFF163257),
                  header: Text(
                    'Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Text(
                    _loremIpsum,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                  contentBorderWidth: 1,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.0,
                backgroundColor: Color(0xFF163257),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 90,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: Color(0xFF163257),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Buy'),
                            ),
                            SizedBox(width: width / 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: Color(0xFF163257),
                              ),
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RentForm(
                                    shipName: widget.name,
                                    rent: '\$500 per day',
                                    image: widget.image,
                                  ),
                                ),
                              ),
                              child: const Text('Rent'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Send Inquery'),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
