import 'package:data_send_mail/CustomAutocomplete.dart';
import 'package:data_send_mail/CustomTextView.dart';
import 'package:data_send_mail/SplashScreen.dart';
import 'package:data_send_mail/login.dart';
import 'package:data_send_mail/otp_verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'content_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      debugShowCheckedModeBanner: false,
      // initialRoute: "splash",
      routes: {
        'splash': (context) => splashScreen(),
        '/login': (context) => loginpage(),
        '/mainepage': (context) => MyHomePage(title: 'home page',),
        '/otppage': (context) => otp_verification(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Form Registration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

String? _selectedVehicleType;
String? _selectedDeviceModel;
String? _selectedUserType;
String? _selectedCountry;
String? _selectedState;
String? _selectedCity;

TextEditingController _nameController = TextEditingController();
TextEditingController _mobileNumberController = TextEditingController();
TextEditingController _pincodeController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _addressController = TextEditingController();
TextEditingController _userNameController = TextEditingController();

void registerUser() {
  // Perform registration logic here
  String name = _nameController.text;
  String mobileNumber = _mobileNumberController.text;
  String pincode = _pincodeController.text;
  String email = _emailController.text;
  String address = _addressController.text;
  String userName = _userNameController.text;
  String vehicleType = _selectedVehicleType ?? '';
  String deviceModel = _selectedDeviceModel ?? '';
  String userType = _selectedUserType ?? '';
  String country = _selectedCountry ?? '';
  String state = _selectedState ?? '';
  String city = _selectedCity ?? '';

  // Perform registration logic with the collected data
  // For example, you can show a toast message
  Fluttertoast.showToast(
    msg: "User Registered: $name, $mobileNumber, $email",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.black,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

@override
void dispose() {
  // Dispose controllers
  _nameController.dispose();
  _mobileNumberController.dispose();
  _pincodeController.dispose();
  _emailController.dispose();
  _addressController.dispose();
  _userNameController.dispose();
  // super.dispose();
}




class _MyHomePageState extends State<MyHomePage> {

  bool isNewUser = true;

  //worked normal gsmtp account
  Future<void> sendEmailOTP() async {
    // Replace these with your actual Gmail credentials
    final username = 'test@braj.tbvcsoft.com'; // Your Gmail username
    final password = 'Ankit@123\$#'; // Your Gmail password

    // Recipient email address
    final destinationMail = 'guddulawaniya123@gmail.com';

    // Create SMTP server configuration
    final smtpServer = gmail(username, password);

    // Create email message
    final message = Message()
      ..from = Address(username, 'Testing mail')
      ..recipients.add(destinationMail)
      ..subject = 'Testing purpose'
      ..text = 'guddulawaniya sending the sms for testing purpose';

    try {
      // Send email
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent: ${e.toString()}');
      // Handle specific problems
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    } catch (e) {
      // Handle other exceptions
      print('Unexpected error: $e');
    }
  }


  // use hosted mail account on server
  Future<void> sendEmailOTPssl() async {
    // Replace these with your actual Gmail credentials
    final username = 'test@braj.tbvcsoft.com'; // Your Gmail username
    final password = 'Ankit@123\$#'; // Your Gmail password

    // Recipient email address
    final destinationMail = 'guddulawaniya123@gmail.com';

    // Specify the SMTP server details including port for SSL
    final smtpServer = SmtpServer(
      'smtp.hostinger.com',
      username: username,
      password: password,
      port: 465,
      ssl: true,
    );

    // Create email message
    final message = Message()
      ..from = Address(username, 'Testing mail')
      ..recipients.add(username)
      ..subject = 'Testing purpose'
      ..text = 'guddulawaniya sending the sms for testing purpose';

    try {
      // Send email
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent: ${e.toString()}');
      // Handle specific problems
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    } catch (e) {
      // Handle other exceptions
      print('Unexpected error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextView(
                          text: "Dealer Code ",
                          hinttext: 'Dealer Code',
                          // controller: _nameController,
                        ),
                        CustomTextView(
                          text: "IMEI Number ",
                          hinttext: 'IMEI Number',
                        ),
                        CustomTextView(
                          text: "Sim Number ",
                          hinttext: 'Sim Number',
                        ),
                        CustomAutocomplete(
                          text: "Vechicle Types ",
                          hinttext: 'Enter like bus',
                          items: vehiclelist,
                        ),

                        CustomAutocomplete(
                          text: "Select Device Model",
                          hinttext: 'Pl06',
                          items: ['P106', 'P1062',],

                        ),
                        CustomAutocomplete(
                          text: "New user ",
                          hinttext: 'Enter new User',
                          items: userlist,
                          onChanged: (String value){
                            // isNewUser = (value == 'New User');
                            setState(() {
                              isNewUser = (value != 'Already Have Account');
                            });
                          },
                        ),

                        Visibility(
                          visible: isNewUser,
                          child: CustomTextView(
                            text: "Name ",
                            hinttext: 'Your name',
                            // controller: _nameController,
                          ),
                        ),
                        Visibility(
                          visible: isNewUser,
                          child: CustomTextView(
                            text: "Mobile Number ",
                            hinttext: 'Phone Number to contact you',
                            // controller: _mobileNumberController,
                          ),
                        ),
                        Visibility(
                          visible: isNewUser,
                          child: CustomAutocomplete(
                            text: "Country ",
                            hinttext: 'Select Country',
                            items: countrylist,
                            onChanged: (value) {
                              _selectedCountry = value;
                            },
                          ),
                        ),
                        Visibility(
                          visible: isNewUser,
                          child: CustomAutocomplete(
                            text: "State ",
                            hinttext: 'Select State',
                            items: statelist,
                            onChanged: (value) {

                            },
                          ),
                        ),


                        Visibility(
                          visible: isNewUser,
                          child: CustomTextView(
                            text: "City ",
                            hinttext: 'Select City',
                            // controller: _pincodeController,
                          ),
                        ), Visibility(
                          visible: isNewUser,
                          child: CustomTextView(
                            text: "Pincode ",
                            hinttext: 'Enter Pincode',
                            // controller: _pincodeController,
                          ),
                        ),
                        Visibility(
                          visible: isNewUser,
                          child: CustomTextView(
                            text: "Email ",
                            hinttext: 'Enter Email',
                            // controller: _emailController,
                          ),
                        ),
                        Visibility(
                          visible: isNewUser,
                          child: CustomTextView(
                            text: "Address ",
                            hinttext: 'Enter you address',
                            // controller: _addressController,
                          ),
                        ),
                        CustomTextView(
                          text: "User Name ",
                          hinttext: 'User Name',
                          // controller: _userNameController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {
                            sendEmailOTPssl();
                            // Fluttertoast.showToast(
                            //   msg: "Button Click",
                            //   toastLength: Toast.LENGTH_SHORT,
                            //   // Duration for which the toast is visible
                            //   gravity: ToastGravity.BOTTOM,
                            //   // Position of the toast on the screen
                            //   backgroundColor: Colors.black,
                            //   // Background color of the toast
                            //   textColor: Colors.white,
                            //   // Text color of the toast message
                            //   fontSize: 16.0,
                            // );

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const uploaddata()),
                            // );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

