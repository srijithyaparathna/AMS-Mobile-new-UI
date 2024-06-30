import 'package:appointmentms/pages/Departments/DepartmentView.dart';
import 'package:appointmentms/pages/Login%20S/LoginHome.dart';
import 'package:appointmentms/widgets/Topwavewithoutmenu.dart';
import 'package:appointmentms/widgets/apptext2.dart';
import 'package:appointmentms/widgets/bottomwave.dart';
import 'package:appointmentms/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

TextEditingController FacultyEmailController = TextEditingController();
TextEditingController PasswordController = TextEditingController();
String message = "";
String regNumber = "";

class _StudentLoginState extends State<StudentLogin> {
  bool _obscureText = true; // Added for toggling password visibility

  void getRegNumber(String email) async {
    print("Getting registration number...");
    try {
      String url = "http://192.168.8.94/db/student/regnumber/$email";
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        dynamic jsonData = jsonDecode(response.body);

        if (jsonData is List) {
          for (var item in jsonData) {
            if (item is Map<String, dynamic> && item.containsKey('Reg_number')) {
              regNumber = item['Reg_number'];
              print(regNumber);

              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('Reg_number', regNumber);
            } else {
              print("Registration number not found in item: $item");
            }
          }
        } else if (jsonData is Map<String, dynamic>) {
          if (jsonData.containsKey('Reg_number')) {
            regNumber = jsonData['Reg_number'];
            print(regNumber);

            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setString('Reg_number', regNumber);
          } else {
            print("Key 'Reg_number' not found in the response.");
          }
        } else {
          print("Unexpected response format.");
        }
      } else {
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (err) {
      print("An error occurred: $err");
    }
  }

  Future<void> saveRegNumber(String regNumber) async {
    print("Saving registration number...");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Reg_number', regNumber);
  }

  Future<void> storeEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('staffEmail', email);
  }

  Future<void> printStoredRegNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? regNumber = prefs.getString('Reg_number');
    if (regNumber != null) {
      print('Stored RegNumber: $regNumber');
    } else {
      print('No RegNumber found in SharedPreferences.');
    }
  }

  void handleLogin(BuildContext context, String email, String password) async {
    try {
      print("handle login");
      Map<String, dynamic> body = {
        'Email': email,
        'Password': password,
      };
      String jsonBody = jsonEncode(body);
      print(jsonBody);

      String url = "http://192.168.8.94/db/student/login";
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );

      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      print(response.body);
      if (data['Status'] == "Success") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DepartmentView()),
        );
        print("Login successful");
        print(regNumber);
      } else {
        setState(() {
          message = "Invalid email or password";
          print("Invalid email or password");
        });
      }
    } catch (err) {
      setState(() {
        message = "Invalid email or password";
        print("Invalid email or password");
        print(err);
      });
    }
  }

  void handleSubmit() {
    String email = FacultyEmailController.text;
    String password = PasswordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        message = "Please fill all the fields";
        print("please fill all the fields");
      });
    } else if (!email.contains("engug.ruh.ac.lk")) {
      setState(() {
        message = "Invalid email";
        print("Invalid email");
      });
    } else {
      handleLogin(context, email, password);
      print("handle submit ");
      getRegNumber(email);
      saveRegNumber(email);
      printStoredRegNumber(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopWaveWithoutMenuIcon(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                SizedBox(height: 5.0),
                Center(child: AppLargeText2(text: "LOGIN")),
                SizedBox(height: 35.0),
                Container(
                  width: 380,
                  height: 45,
                  child: TextField(
                    controller: FacultyEmailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: 25.0),
                Container(
                  width: 380,
                  height: 45,
                  child: TextField(
                    controller: PasswordController,
                    obscureText: _obscureText, // Set this to true to obscure text
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
                Buttons(
                  text: "Login",
                  onPressed: () {
                    print("press login");
                    handleSubmit();
                  },
                ),
                // Row(
                //   children: [
                //     SizedBox(width: 90.0),
                //     BottomText2(text: "Forgot password ?"),
                //     TextButton(
                //       onPressed: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => StudentpasswordReset1(),
                //         ),
                //       ),
                //       child: const Text(
                //         'RESET',
                //         style: TextStyle(
                //           color: Color(0xFF500512),
                //           decoration: TextDecoration.underline,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 70.0),
                // Row(
                //   children: [
                //     SizedBox(width: 67.0),
                //     BottomText2(text: "Don't have an account?"),
                //     TextButton(
                //       onPressed: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => StudentSignup1(),
                //         ),
                //       ),
                //       child: const Text(
                //         'SIGN UP',
                //         style: TextStyle(
                //           color: Color(0xFF500512),
                //           decoration: TextDecoration.underline,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomWaveBar(),
    );
  }
}
