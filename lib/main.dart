import 'package:data_send_mail/CustomAutocomplete.dart';
import 'package:data_send_mail/CustomTextView.dart';
import 'package:data_send_mail/SplashScreen.dart';
import 'package:data_send_mail/login.dart';
import 'package:data_send_mail/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

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
      initialRoute: "splash",
      routes: {
        'splash': (context) => splashScreen(),
        '/login': (context) => loginpage(),
        '/mainepage': (context) => MyHomePage(
              title: 'home page',
            ),
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

TextEditingController _dealerController = TextEditingController();
TextEditingController _nameController = TextEditingController();
TextEditingController _mobileNumberController = TextEditingController();
TextEditingController _pincodeController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _addressController = TextEditingController();
TextEditingController _userNameController = TextEditingController();
TextEditingController _simnumberController = TextEditingController();
TextEditingController _imeinumberController = TextEditingController();
TextEditingController _cityController = TextEditingController();
// TextEditingController _imeinumberController = TextEditingController();

// Collect user data
String dealer = _dealerController.text;
String name = _nameController.text;
String mobileNumber = _mobileNumberController.text;
String pincode = _pincodeController.text;
String email = _emailController.text;
String address = _addressController.text;
String userName = _userNameController.text;
String city = _cityController.text;
String imei = _imeinumberController.text;
String sim = _simnumberController.text;

String vehicleType = _selectedVehicleType ?? '';
String deviceModel = _selectedDeviceModel ?? '';
String userType = _selectedUserType ?? '';
String country = _selectedCountry ?? '';
String state = _selectedState ?? '';



void registerUser(BuildContext context) {
  // Validate all form fields
  final bool isValid = _formKey.currentState!.validate();

  if (!isValid) {
    return;
  }

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

  @override
  void initState() {
    super.initState();
  }

  // Validation function for the Dealer Code field
  String? _validateDealerCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the Dealer Code';
    }
    return null; // Return null if validation passes
  }

// Validation function for the IMEI Number field
  String? _validateIMEINumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the IMEI Number';
    }
    return null; // Return null if validation passes
  }

// Validation function for the Sim Number field
  String? _validateSimNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the Sim Number';
    }
    return null; // Return null if validation passes
  }

// Validation function for the City field
  String? _validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select the City';
    }
    return null; // Return null if validation passes
  }

// Validation function for the Pincode field
  String? _validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the Pincode';
    }
    return null; // Return null if validation passes
  }

// Validation function for the Email field
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the Email';
    }
    // You can add more specific email validation logic here if needed
    return null; // Return null if validation passes
  }

// Validation function for the Address field
  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the Address';
    }
    return null; // Return null if validation passes
  }

// Validation function for the User Name field
  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the User Name';
    }
    return null; // Return null if validation passes
  }

  // Validation function for the country field
  String? _validateCountryselect(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Select Country';
    }
    return null; // Return null if validation passes
  }

  String? _validateStateselect(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Select State';
    }
    return null; // Return null if validation passes
  }

  String? _validateMobilenumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the Mobile Number';
    }
    return null; // Return null if validation passes
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter Your Name';
    }
    return null; // Return null if validation passes
  }

  bool isLoading = false;

  Future<void> sendEmailOTPssl(BuildContext context) async {
    setState(() {
      isLoading = true; // Show loader
    });

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

    final recipients = ['test@braj.tbvcsoft.com','guddulawaniya123@gmail.com'];


    // Create email message
    final message = Message()
      ..from = Address(username, 'Testing mail')
      // ..recipients.add(destinationMail)
      ..subject = 'Testing purpose'
      ..html = generateHtmlEmail();

    for (final recipient in recipients) {
      // Set the recipient email address
      message.recipients.add(recipient);

      try {
        // Send email
        final sendReport = await send(message, smtpServer);
        print('Message sent to $recipient: $sendReport');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Email Send Successfully'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Message sent to $recipient: $sendReport'),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _dealerController.text= "";
                    _nameController.text = "";
                    _mobileNumberController.text="";
                    _pincodeController.text='';
                    _emailController.text='';
                    _addressController.text='';
                    _userNameController.text='';
                    _cityController.text='';
                    _imeinumberController.text='';
                    _emailController.text= '';
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      } catch (e) {
        print('Failed to send message to $recipient: $e');
        // Handle error for individual recipient
      }
      // Clear recipients list for the next iteration
      message.recipients.clear();
    }

    setState(() {
      isLoading = false; // Hide loader
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
        Container(
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
                              controller: _dealerController,
                              validator: _validateDealerCode,
                              onChanged: (String value) {
                                  registerUser(context);
                              },
                              inputType: TextInputType.number,
                            ),
                            CustomTextView(
                              text: "IMEI Number ",
                              hinttext: 'IMEI Number',
                              controller: _imeinumberController,
                              validator: _validateIMEINumber,
                              onChanged: (String value) {
                                registerUser(context);
                              },
                              inputType: TextInputType.number,
                            ),
                            CustomTextView(
                              text: "Sim Number ",
                              hinttext: 'Sim Number',
                              controller: _simnumberController,
                              validator: _validateSimNumber,
                              onChanged: (String value) {
                                registerUser(context);
                              },
                              inputType: TextInputType.number,
                            ),
                            CustomAutocomplete(
                              text: "Vechicle Types ",
                              hinttext: 'Enter like bus',
                              items: vehiclelist,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a vehicle type';
                                }
                                // Add more validation logic if needed
                                return null; // Return null if validation passes
                              },
                              onChanged: (value) {
                                _selectedVehicleType = value;
                              },
                            ),
                            CustomAutocomplete(
                              text: "Select Device Model",
                              hinttext: 'Pl06',
                              items: devicelist,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a vehicle type';
                                }
                                // Add more validation logic if needed
                                return null; // Return null if validation passes
                              },
                              onChanged: (value) {
                                _selectedDeviceModel = value;
                              },
                            ),
                            CustomAutocomplete(
                              text: "New user ",
                              hinttext: 'Enter new User',
                              items: userlist,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a vehicle type';
                                }
                                // Add more validation logic if needed
                                return null; // Return null if validation passes
                              },
                              onChanged: (value) {
                                _selectedUserType = value;
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
                                controller: _nameController,
                                validator: _validateName,
                                onChanged: (String value) {
                                  registerUser(context);
                                },
                                inputType: TextInputType.text,
                              ),
                            ),
                            Visibility(
                              visible: isNewUser,
                              child: CustomTextView(
                                text: "Mobile Number ",
                                hinttext: 'Phone Number to contact you',
                                maxlenght: 10,
                                controller: _mobileNumberController,
                                validator: _validateMobilenumber,
                                onChanged: (String value) {
                                  registerUser(context);
                                },
                                inputType: TextInputType.number,
                              ),
                            ),
                            Visibility(
                              visible: isNewUser,
                              child: CustomAutocomplete(
                                text: "Country ",
                                hinttext: 'Select Country',
                                items: countrylist,
                                validator: _validateCountryselect,
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
                                validator: _validateStateselect,
                                onChanged: (value) {
                                  _selectedState = value;
                                },
                              ),
                            ),
                            Visibility(
                              visible: isNewUser,
                              child: CustomTextView(
                                text: "City ",
                                hinttext: 'Select City',
                                controller: _cityController,
                                validator: _validateCity,
                                onChanged: (String value) {
                                  registerUser(context);
                                },
                                inputType: TextInputType.streetAddress,
                              ),
                            ),
                            Visibility(
                              visible: isNewUser,
                              child: CustomTextView(
                                text: "Pincode ",
                                hinttext: 'Enter Pincode',
                                controller: _pincodeController,
                                validator: _validatePincode,
                                onChanged: (String value) {
                                  registerUser(context);
                                },
                                maxlenght: 6,
                                inputType: TextInputType.number,
                              ),
                            ),
                            Visibility(
                              visible: isNewUser,
                              child: CustomTextView(
                                text: "Email ",
                                hinttext: 'Enter Email',
                                controller: _emailController,
                                validator: _validateEmail,
                                onChanged: (String value) {
                                  registerUser(context);
                                },inputType: TextInputType.emailAddress,
                              ),
                            ),
                            Visibility(
                              visible: isNewUser,
                              child: CustomTextView(
                                text: "Address ",
                                hinttext: 'Enter you address',
                                controller: _addressController,
                                validator: _validateAddress,
                                onChanged: (String value) {
                                  registerUser(context);
                                }, inputType: TextInputType.streetAddress,
                              ),
                            ),
                            CustomTextView(
                              text: "User Name ",
                              hinttext: 'User Name',
                              controller: _userNameController,
                              validator: _validateUserName,
                              onChanged: (String value) {
                                registerUser(context);
                              },
                              inputType: TextInputType.text,
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
                                // _isValidallfields = false;
                                final bool isValid = _formKey.currentState!.validate();
                                if (isValid)
                                  {
                                    sendEmailOTPssl(context);
                                  }

                                // Show alert dialog with user data
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
          if (isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
