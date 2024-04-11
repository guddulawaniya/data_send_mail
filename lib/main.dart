import 'package:data_send_mail/CustomAutocomplete.dart';
import 'package:data_send_mail/CustomTextView.dart';
import 'package:data_send_mail/SendEmailOTP.dart';
import 'package:data_send_mail/SplashScreen.dart';
import 'package:data_send_mail/login.dart';
import 'package:data_send_mail/otp_verification.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

// final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
// String? _selectedVehicleType;
// String? _selectedDeviceModel;
// String? _selectedUserType;
// String? _selectedCountry;
// String? _selectedState;
// String? _selectedCity;
//
// TextEditingController _nameController = TextEditingController();
// TextEditingController _mobileNumberController = TextEditingController();
// TextEditingController _pincodeController = TextEditingController();
// TextEditingController _emailController = TextEditingController();
// TextEditingController _addressController = TextEditingController();
// TextEditingController _userNameController = TextEditingController();

// void registerUser() {
//   // Perform registration logic here
//   String name = _nameController.text;
//   String mobileNumber = _mobileNumberController.text;
//   String pincode = _pincodeController.text;
//   String email = _emailController.text;
//   String address = _addressController.text;
//   String userName = _userNameController.text;
//   String vehicleType = _selectedVehicleType ?? '';
//   String deviceModel = _selectedDeviceModel ?? '';
//   String userType = _selectedUserType ?? '';
//   String country = _selectedCountry ?? '';
//   String state = _selectedState ?? '';
//   String city = _selectedCity ?? '';
//
//   // Perform registration logic with the collected data
//   // For example, you can show a toast message
//   Fluttertoast.showToast(
//     msg: "User Registered: $name, $mobileNumber, $email",
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     backgroundColor: Colors.black,
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }

// @override
// void dispose() {
//   // Dispose controllers
//   _nameController.dispose();
//   _mobileNumberController.dispose();
//   _pincodeController.dispose();
//   _emailController.dispose();
//   _addressController.dispose();
//   _userNameController.dispose();
//   super.dispose();
// }

class _MyHomePageState extends State<MyHomePage> {
  List<String> generateItems() {
    // You can generate your dynamic list of items here
    return ['Option 1', 'Option 2', 'Option 3', 'Option 4', 'Option 5'];
  }

  // void sendEmailOTP(BuildContext context, String email, String otp) {
  //   final sendEmailOTP = SendEmailOTP(context, email, otp);
  //   sendEmailOTP.sendEmail();
  // }

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
          // key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: const Column(
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
                          items: [
                            'BUS',
                            'CAR',
                            'TRUCK',
                            'BIKE',
                            'SCOOTY',
                            'SCHOOL BUS',
                            'AMBULANCE',
                            'TEMPO',
                            'TRACTOR',
                            'STUDENT',
                            'EMPLOYEE',
                            'JBB',
                            'BAG',
                            'DOG',
                            'JEEP',
                            'TRAIN'
                          ],
                        ),
                        CustomAutocomplete(
                          text: "Select Device Model",
                          hinttext: 'Pl06',
                          items: ['P106', 'P106',],

                        ),
                        CustomAutocomplete(
                          text: "New user ",
                          hinttext: 'Enter new User',
                          items: ['New User', 'Already Have Account'],
                        ),
                        CustomTextView(
                          text: "Name ",
                          hinttext: 'Your name',
                          // controller: _nameController,
                        ),
                        CustomTextView(
                          text: "Mobile Number ",
                          hinttext: 'Phone Number to contact you',
                          // controller: _mobileNumberController,
                        ),
                        CustomAutocomplete(
                          text: "Country ",
                          hinttext: 'Select Country',
                          items: [
                            'INDIA',
                            'NEPAL',
                            'AFGHANISTHAN',
                            'SWEDEN',
                            'CHINA',
                            'OTHER'
                          ],
                          // onChanged: (value) {
                          //   _selectedCountry = value;
                          // },
                        ),
                        CustomAutocomplete(
                          text: "State ",
                          hinttext: 'Select State',
                          items: [
                            'OTHER',
                            'Andhra Pradesh',
                            'Arunachal Pradesh',
                            'Assam',
                            'Bihar',
                            'Chhattisgarh',
                            'Goa',
                            'Gujarat',
                            'Haryana',
                            'Himachal Pradesh',
                            'Jammu and Kashmir',
                            'Jharkhand',
                            'Karnataka',
                            'Kerala',
                            'Madhya Pradesh',
                            'Maharashtra',
                            'Manipur',
                            'Meghalaya',
                            'Mizoram',
                            'Nagaland',
                            'Odisha',
                            'Punjab',
                            'Rajasthan',
                            'Sikkim',
                            'Tamil Nadu',
                            'Telangana',
                            'Tripura',
                            'Uttar Pradesh',
                            'Uttarakhand',
                            'West Bengal'
                          ],
                          // onChanged: (value) {
                          //
                          //   _selectedState = value;
                          //
                          // },
                        ),

                        CustomAutocomplete(
                          text: "City",
                          hinttext: 'Select City',
                          items: [
                            'Mumbai',
                            'Delhi',
                            'Bangalore',
                            'Kolkata',
                            'Chennai',
                            'Hyderabad',
                            'Ahmedabad',
                            'Pune',
                            'Surat',
                            'Jaipur',
                            'Lucknow',
                            'Kanpur',
                            'Nagpur',
                            'Indore',
                            'Thane',
                            'Bhopal',
                            'Visakhapatnam',
                            'Pimpri-Chinchwad',
                            'Patna',
                            'Vadodara',
                            'Ghaziabad',
                            'Ludhiana',
                            'Agra',
                            'Nashik',
                            'Faridabad',
                            'Meerut',
                            'Rajkot',
                            'Kalyan-Dombivli',
                            'Vasai-Virar',
                            'Varanasi',
                            'Srinagar',
                            'Aurangabad',
                            'Dhanbad',
                            'Amritsar',
                            'Navi Mumbai',
                            'Allahabad',
                            'Ranchi',
                            'Howrah',
                            'Jabalpur',
                            'Gwalior',
                            'Vijayawada',
                            'Jodhpur',
                            'Madurai',
                            'Raipur',
                            'Kota',
                            'Guwahati',
                            'Chandigarh',
                            'Solapur',
                            'Hubli-Dharwad',
                            'Bareilly',
                            'Moradabad',
                            'Mysore',
                            'Gurgaon',
                            'Aligarh',
                            'Jalandhar',
                            'Tiruchirappalli',
                            'Bhubaneswar',
                            'Salem',
                            'Mira-Bhayandar',
                            'Warangal',
                            'Guntur',
                            'Bhiwandi',
                            'Saharanpur',
                            'Gorakhpur',
                            'Bikaner',
                            'Amravati',
                            'Noida',
                            'Jamshedpur',
                            'Bhilai',
                            'Cuttack',
                            'Firozabad',
                            'Kochi',
                            'Nellore',
                            'Bhavnagar',
                            'Dehradun',
                            'Durgapur',
                            'Asansol',
                            'Rourkela',
                            'Nanded',
                            'Kolhapur',
                            'Ajmer',
                            'Akola',
                            'Gulbarga',
                            'Jamnagar',
                            'Ujjain',
                            'Loni',
                            'Siliguri',
                            'Jhansi',
                            'Ulhasnagar',
                            'Nellore',
                            'Jammu',
                            'Sangli-Miraj & Kupwad',
                            'Belgaum',
                            'Mangalore',
                            'Ambattur',
                            'Tirunelveli',
                            'Malegaon',
                            'Gaya',
                            'Jalgaon',
                            'Udaipur',
                            'Maheshtala',
                            'Tirupur',
                            'Davanagere',
                            'Kozhikode',
                            'Akola',
                            'Kurnool',
                            'Rajpur Sonarpur',
                            'Bokaro Steel City',
                            'South Dumdum',
                            'Bellary',
                            'Patiala',
                            'Gopalpur',
                            'Agartala',
                            'Bhagalpur',
                            'Muzaffarnagar',
                            'Bhatpara',
                            'Panihati',
                            'Latur',
                            'Dhule',
                            'Tirupati',
                            'Rohtak',
                            'Korba',
                            'Bhilwara',
                            'Berhampur',
                            'Muzaffarpur',
                            'Ahmednagar',
                            'Mathura',
                            'Kollam',
                            'Avadi',
                            'Kadapa',
                            'Kamarhati',
                            'Bilaspur',
                            'Shahjahanpur',
                            'Satara',
                            'Bijapur',
                            'Kakinada',
                            'Rampur',
                            'Shimoga',
                            'Chandrapur',
                            'Junagadh',
                            'Thrissur',
                            'Alwar',
                            'Bardhaman',
                            'Kulti',
                            'Nizamabad',
                            'Parbhani',
                            'Tumkur',
                            'Khammam',
                            'Ozhukarai',
                            'Bihar Sharif',
                            'Panipat',
                            'Darbhanga',
                            'Bally',
                            'Aizawl',
                            'Dewas',
                            'Ichalkaranji',
                            'Karnal',
                            'Bathinda',
                            'Jalna',
                            'Eluru',
                            'Barasat',
                            'Kirari Suleman Nagar',
                            'Purnia',
                            'Satna',
                            'Mau',
                            'Sonipat',
                            'Farrukhabad',
                            'Sagar',
                            'Rourkela',
                            'Durg',
                            'Imphal',
                            'Ratlam',
                            'Hapur',
                            'Arrah',
                            'Anantapur',
                            'Karimnagar',
                            'Etawah',
                            'Ambarnath',
                            'North Dumdum',
                            'Bharatpur',
                            'Begusarai',
                            'New Delhi',
                            'Gandhidham',
                            'Baranagar',
                            'Tiruvottiyur',
                            'Pondicherry',
                            'Sikar',
                            'Thoothukudi',
                            'Rewa',
                            'Mirzapur',
                            'Raichur',
                            'Pali',
                            'Ramagundam',
                            'Silchar',
                            'Haridwar',
                            'Vijayanagaram',
                            'Tenali',
                            'Nagercoil',
                            'Sri Ganganagar',
                            'Karawal Nagar',
                            'Mango',
                            'Thanjavur',
                            'Bulandshahr',
                            'Uluberia',
                            'Katni',
                            'Sambhal',
                            'Singrauli',
                            'Nadiad',
                            'Secunderabad',
                            'Naihati',
                            'Yamunanagar',
                            'Bidhannagar',
                            'Pallavaram',
                            'Bidar',
                            'Munger',
                            'Panchkula',
                            'Burhanpur',
                            'Raurkela Industrial Township',
                            'Kharagpur',
                            'Dindigul',
                            'Gandhinagar',
                            'Hospet',
                            'Nangloi Jat',
                            'Malda',
                            'Ongole',
                            'Deoghar',
                            'Chapra',
                            'Haldia',
                            'Khandwa',
                            'Nandyal',
                            'Morena',
                            'Amroha',
                            'Anand',
                            'Bhind',
                          ],
                          // onChanged: (value) {
                          //   _selectedCity = value;
                          // },
                        ),
                        CustomTextView(
                          text: "Pincode ",
                          hinttext: 'Enter Pincode',
                          // controller: _pincodeController,
                        ),
                        CustomTextView(
                          text: "Email ",
                          hinttext: 'Enter Email',
                          // controller: _emailController,
                        ),
                        CustomTextView(
                          text: "Address ",
                          hinttext: 'Enter you address',
                          // controller: _addressController,
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
                            Fluttertoast.showToast(
                              msg: "Button Click",
                              toastLength: Toast.LENGTH_SHORT,
                              // Duration for which the toast is visible
                              gravity: ToastGravity.BOTTOM,
                              // Position of the toast on the screen
                              backgroundColor: Colors.black,
                              // Background color of the toast
                              textColor: Colors.white,
                              // Text color of the toast message
                              fontSize: 16.0,
                            );

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
