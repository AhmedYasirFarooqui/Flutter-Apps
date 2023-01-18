// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

class Buttons extends StatefulWidget {
  const Buttons({
    this.text,
    this.width,
    this.height,
    this.onPressed,
    this.color,
    this.textcolor,
  });

  final String? text;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textcolor;

  final VoidCallback? onPressed;

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        elevation: 0.0,
      ),
      onPressed: widget.onPressed,
      // ignore: sized_box_for_whitespace
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Center(
          child: Text(
            widget.text.toString(),
            style: TextStyle(
              fontSize: 18.0,
              decoration: TextDecoration.none,
              color: widget.textcolor,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  // const CustomText(String s,
  //     {this.text, this.fontSize, this.fontFamily, this.color});

  @override
  const CustomText({this.text, this.fontSize, this.fontFamily, this.color});

  final String? text;
  final double? fontSize;
  final String? fontFamily;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        decoration: TextDecoration.none,
        color: color,
      ),
    );
  }
}

class CustomLisTile extends StatefulWidget {
  const CustomLisTile({
    this.text,
    this.fontSize,
    this.fontFamily,
    this.onTap,
    this.icon,
  });

  final String? text;
  final double? fontSize;
  final String? fontFamily;
  final VoidCallback? onTap;
  final Icon? icon;

  @override
  _CustomLisTileState createState() => _CustomLisTileState();
}

class _CustomLisTileState extends State<CustomLisTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.icon,
      title: Text(
        widget.text.toString(),
        style: TextStyle(
          fontSize: widget.fontSize,
          fontFamily: widget.fontFamily,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
      ),
      onTap: widget.onTap,
    );
  }
}

class CustomNewsCards extends StatefulWidget {
  const CustomNewsCards(
      {this.imgPath, this.headline, this.time, this.date, this.onTap});

  final String? imgPath;
  final String? headline;
  final String? time;
  final String? date;
  final VoidCallback? onTap;

  @override
  State<CustomNewsCards> createState() => _CustomNewsCardsState();
}

class _CustomNewsCardsState extends State<CustomNewsCards> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height / 6.5,
      child: InkWell(
        onTap: widget.onTap,
        child: Card(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          child: Row(
            children: [
              widget.imgPath != null && widget.imgPath!.isNotEmpty
                  ? Container(
                      width: width / 2.3,
                      height: height / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.imgPath.toString(),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : CircularProgressIndicator(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 7.0,
                      ),
                      child: Text(
                        widget.headline.toString(),
                        softWrap: true,
                        textScaleFactor: 1.2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 11.0,
                          height: 1.1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: height / 30,
                    // ),
                    SizedBox(
                      height: height / 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.date!),
                          SizedBox(width: width / 3),
                          Icon(
                            Icons.bookmark,
                            color: AppColors.red,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.icon,
    this.text,
    this.keyboardType,
    this.isObscure = false,
  }) : super(key: key);
  final TextEditingController? controller;
  final IconData? icon;
  final String? text;
  final TextInputType? keyboardType;
  final bool isObscure;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.isObscure,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: Icon(
            widget.icon,
            color: Colors.white,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          label: Text(
            widget.text!,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class CustomCarouselOptions extends StatefulWidget {
  const CustomCarouselOptions(this.imgPath, this.text);

  final String? imgPath;
  final String? text;

  @override
  State<CustomCarouselOptions> createState() => _CustomCarouselOptionsState();
}

class _CustomCarouselOptionsState extends State<CustomCarouselOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '3 hours ago.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'ZillaSlab',
                ),
              ),
              SizedBox(
                width: 80.0,
              ),
              Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(
            height: 65.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.text.toString(),
              style: TextStyle(
                color: Colors.white,
                // fontWeight: FontWeight.w200,
                fontFamily: 'ZillaSlab',
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.grey,
            BlendMode.darken,
          ),
          image: AssetImage(widget.imgPath.toString()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
