
import 'package:data_send_mail/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {

  TextEditingController mobiletextcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isnumberValid = true;

  @override
  void dispose() {
    mobiletextcontroller.dispose();
    super.dispose();
  }

  void _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mobilenumber', mobiletextcontroller.text.toString()); // Save string data
    // You can also save other types of data like int, double, bool, etc.
    // await prefs.setInt('intKey', 123);
    // await prefs.setDouble('doubleKey', 3.14);
    // await prefs.setBool('boolKey', true);
    print('Data saved successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 100
                  ,),

                const Icon(
                  Icons.person_3_outlined,
                  size: 100,
                ),
                const Text(
                  "Device Tracker",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.lightBlue),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Enter Your Mobile Number & Well Send You a Verification Code ",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                      ]

                  ),
                ),
                const SizedBox(height: 20,),
                Form(

                  key: _formKey,
                  child: TextFormField(
                    controller: mobiletextcontroller,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      isnumberValid = true;
                    },

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          isnumberValid = false;
                        });
                        return 'Enter Mobile Number';
                      }
                      return null;
                      // Return null if the validation is successful.
                    },

                    decoration: const InputDecoration(
                      counter: Text(""),
                      prefixText: "+91",
                      // contentPadding: EdgeInsets.only(right: 10),
                      prefixStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 16
                      ),
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.black38),
                      labelStyle: TextStyle(color: Colors.lightBlue),
                      hintText: 'Mobile Number',
                      labelText: 'Mobile Number',
                    ),

                  ),

                ),
              ],
            ),
            Column(
              children: [
                SizedBox(width: double.infinity,
                  child:  TextButton(
                    style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const otp_verification()),
                        );

                      }


                    },
                    child: const Text('Send OTP',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  ),
                )

              ],
            )


          ],
        ),
      ),
    );
  }
}
