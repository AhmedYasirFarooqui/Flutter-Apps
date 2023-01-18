// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

import '../../modals/ads_modal.dart';
import '../../services/ads_service.dart';

class AdsListScreen extends StatefulWidget {
  const AdsListScreen({
    super.key,
    // this.images,
  });
  // final List? images;

  @override
  State<AdsListScreen> createState() => _AdsListScreenState();
}

class _AdsListScreenState extends State<AdsListScreen> {
  ApiService adsService = ApiService();
  List<Datum>? ads;
  dynamic baseURL = 'https://bachaopakistan.com/demo/public/images';
  @override
  Widget build(BuildContext context) {
    // ads!.shuffle();
    // debugPrint(ads![0].id.toString());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF207dff),
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Ads List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
      body: FutureBuilder(
        future: adsService.getAds(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot) {
          if (snapshot.hasData) {
            ads = snapshot.data;
            return ListView.builder(
              itemCount: ads!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width / 15,
                  height: height / 5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF207dff),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage('$baseURL/${ads![index].image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       children: [
      //         SizedBox(height: height / 40),
      //         Container(
      //           width: width / 1.7,
      //           height: height / 5,
      //           decoration: BoxDecoration(
      //             border: Border.all(
      //               color: Color(0xFF207dff),
      //             ),
      //             borderRadius: BorderRadius.circular(8.0),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
