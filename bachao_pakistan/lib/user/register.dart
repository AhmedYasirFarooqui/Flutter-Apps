// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:bachao_pakistan/admin/admin_dashboard.dart';
import 'package:bachao_pakistan/custom-widgets/custom_text_field.dart';
import 'package:bachao_pakistan/custom-widgets/custom_buttons.dart';
import 'package:bachao_pakistan/user/transaction.dart';
// import 'package:bachao_pakistan/custom-widgets/custom_validator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:bachao_pakistan/user/transaction.dart';
import 'package:flutter/services.dart';
import 'package:pk_cnic_input_field/pk_cnic_input_field.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../custom-widgets/number_formatter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? cnicController = TextEditingController();
  TextEditingController? mobileController = TextEditingController();
  TextEditingController? cityController = TextEditingController();
  TextEditingController? addressController = TextEditingController();
  final List<String> items = [
    'Karachi',
    'Lahore',
    'Peshawar',
    'Islamabad',
    'Bahawalpur',
    'Quetta',
    'Multan',
    'Nawabshah',
  ];
  String? selectedValue;
  showError(String title, errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            errorMessage,
            style: TextStyle(
              color: Color(0xFF207dff),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Color(0xFF207dff),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void signup(String name, email, password, cnic, city, phone, address) async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://bachaopakistan.com/demo/public/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'cnic': cnic,
          'city': city,
          'phone': phone,
          'address': address,
        },
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      final keysList = data.keys.toList();
      final valuesList = data.values.toList();
      if (data.keys.first == 'data') {
        // showError(data.keys.first, data.values.first);
        if (mounted) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TransactionScreen(
                approved: 'inactive',
              ),
            ),
          );
        }
      } else {
        showError(data.keys.first, data.values.first);
      }
    } catch (e) {
      showError('error', e.toString());
    }
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  bool isChecked = false;
  final mobileFormatter = NumberTextFormatter();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/work-2.jpg'),
              colorFilter: ColorFilter.mode(
                Color(0xFF207dff).withOpacity(0.9),
                BlendMode.srcATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height / 15),
                  Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  SizedBox(height: height / 35),
                  CustomTextField(
                    // icon: Icons.person,
                    borderColor: Colors.white,
                    controller: nameController,
                    hintText: 'Username...',
                  ),
                  SizedBox(height: height / 35),
                  CustomTextField(
                    // icon: Icons.mail,
                    borderColor: Colors.white,
                    controller: emailController,
                    hintText: 'Email...',
                  ),
                  SizedBox(height: height / 35),
                  CustomTextField(
                    // icon: Icons.lock,
                    borderColor: Colors.white,
                    controller: passwordController,
                    hintText: 'Password...',
                    isObscure: true,
                  ),
                  SizedBox(height: height / 35),
                  CustomTextField(
                    controller: cnicController,
                    keyBoardType: TextInputType.number,
                    // icon: Icons.person,
                    hintText: 'CNIC (XXXXX-XXXXXXX-X)',
                    borderColor: Colors.white,
                    inputForamatter: [
                      FilteringTextInputFormatter.digitsOnly,
                      NumberTextInputFormatter(),
                    ],
                  ),
                  SizedBox(height: height / 35),
                  CustomTextField(
                    // icon: Icons.phone,
                    controller: mobileController,
                    hintText: 'Mobile Number...',
                    borderColor: Colors.white,
                    keyBoardType: TextInputType.phone,
                    // inputForamatter: [
                    //   FilteringTextInputFormatter.digitsOnly,
                    //   mobileFormatter,
                    // ],
                  ),
                  SizedBox(height: height / 35),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          SizedBox(
                            width: width / 50,
                          ),
                          Expanded(
                            child: Text(
                              'Choose City...',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: items
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                          cityController!.text = selectedValue!;
                          // debugPrint(selectedValue);
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.blue,
                      iconDisabledColor: Colors.grey,
                      buttonWidth: width / 1.2,
                      buttonHeight: height / 14,
                      buttonPadding: const EdgeInsets.only(
                        left: 14,
                        right: 14,
                      ),
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      buttonElevation: 0,
                      itemHeight: height / 17,
                      itemPadding: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                      ),
                      dropdownMaxHeight: height / 3,
                      dropdownWidth: width / 1.2,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarRadius: const Radius.circular(5),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(0, 0),
                    ),
                  ),
                  SizedBox(height: height / 35),
                  CustomTextField(
                    // icon: Icons.person,
                    controller: addressController,
                    borderColor: Colors.white,
                    hintText: 'Address...',
                  ),
                  SizedBox(height: height / 85),
                  Row(
                    children: [
                      SizedBox(width: width / 20),
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        checkColor: Color(0xFF207dff),
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              isChecked = value!;
                            },
                          );
                        },
                      ),
                      Text(
                        'I accept the Terms & Conditions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height / 80),
                  CustomButtons(
                    text: 'Register',
                    onPressed: () {
                      // emailController!.text == 'admin@admin.com'
                      //     ? Navigator.of(context).push(
                      //         MaterialPageRoute(
                      //           builder: (context) => AdminDashboard(),
                      //         ),
                      //       )
                      //     : emailController!.text == 'customer@customer.com'
                      //         ? Navigator.of(context).push(
                      //             MaterialPageRoute(
                      //               builder: (context) => TransactionScreen(),
                      //             ),
                      //           )
                      //         : debugPrint('Field is empty');
                      isChecked == true
                          ? signup(
                              nameController!.text,
                              emailController!.text,
                              passwordController!.text,
                              cnicController!.text,
                              cityController!.text,
                              mobileController!.text,
                              addressController!.text,
                            )
                          : showError('Error',
                              'Please accept the terms and conditions.');
                    },
                  ),
                  SizedBox(height: height / 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
