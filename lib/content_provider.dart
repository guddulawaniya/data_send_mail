
//worked normal gsmtp account
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import 'main.dart';


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
Future<void> sendEmailOTPssls(BuildContext context) async {
  // Replace these with your actual Gmail credentials
  // final username = 'test@braj.tbvcsoft.com'; // Your Gmail username
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

  final recipients = ['test@braj.tbvcsoft.com'];



  // Create email message
  final message = Message()
    ..from = Address(username, 'Testing mail')
    ..recipients.add(email)
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
            title: Text('Registered User Data'),
            content: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text('Message sent to $recipient: $sendReport'),
                // Text('Name: $name'),
                // Text('Mobile Number: $mobileNumber'),
                // Text('Pincode: $pincode'),
                // Text('Email: $email'),
                // Text('Address: $address'),
                // Text('User Name: $userName'),
                // Text('Vehicle Type: $vehicleType'),
                // Text('Device Model: $deviceModel'),
                // Text('User Type: $userType'),
                // Text('Country: $country'),
                // Text('State: $state'),
                // Text('City: $city'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); // Close the dialog
                },
                child: Text('Close'),
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

String generateHtmlEmail() {
  return '''
<!DOCTYPE html>
<html>
<head>
  <title>Email Template</title>
</head>
<body>
  <div style="font-family: Arial, sans-serif;">
    <h2 style="color: #007bff;">Testing Email </h2>
       <table border="1">
                                              <tr>
                                                <th>Field</th>
                                                <th>Value</th>
                                              </tr>
                                              <tr>
                                                <td>Name</td>
                                                <td>$name</td>
                                              </tr>
                                              <tr>
                                                <td>DealerCode</td>
                                                <td>$dealer</td>
                                              </tr>
                                              <tr>
                                                <td>IMEI</td>
                                                <td>$imei</td>
                                              </tr>
                                              <tr>
                                                <td>SIM</td>
                                                <td>$sim</td>
                                              </tr>
                                              <tr>
                                                <td>Mobile Number</td>
                                                <td>$mobileNumber</td>
                                              </tr>
                                              <tr>
                                                <td>Pincode</td>
                                                <td>$pincode</td>
                                              </tr>
                                              <tr>
                                                <td>Email</td>
                                                <td>$email</td>
                                              </tr>
                                              <tr>
                                                <td>Address</td>
                                                <td>$address</td>
                                              </tr>
                                              <tr>
                                                <td>User Name</td>
                                                <td>$userName</td>
                                              </tr>
                                              <tr>
                                                <td>Vehicle Type</td>
                                                <td>$vehicleType</td>
                                              </tr>
                                              <tr>
                                                <td>Device Model</td>
                                                <td>$deviceModel</td>
                                              </tr>
                                              <tr>
                                                <td>User Type</td>
                                                <td>$userType</td>
                                              </tr>
                                              <tr>
                                                <td>Country</td>
                                                <td>$country</td>
                                              </tr>
                                              <tr>
                                                <td>State</td>
                                                <td>$state</td>
                                              </tr>
                                              <tr>
                                                <td>City</td>
                                                <td>$city</td>
                                              </tr>
                                            </table>
  </div>
</body>
</html>
  ''';
}


List<String> vehiclelist = [
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
  'TRAIN',
];


List<String> userlist = ['New User', 'Already Have Account'];
List<String> devicelist =['P106', 'P1062',];
List<String> countrylist = [
  'INDIA',
  'NEPAL',
  'AFGHANISTHAN',
  'SWEDEN',
  'CHINA',
  'OTHER'
];

List<String> statelist =  [
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
  'West Bengal',
  'OTHER',
];

List<String> states = _alldatalist.keys.toList();
List<String>? selectedCityList = _alldatalist[states];

   Map<String, List<String>> _alldatalist = {
  'Andaman and Nicobar Islands': ['Port Blair', 'Car Nicobar', 'Mayabunder', 'Bamboo Flat', 'Garacharma'],
  'Andhra Pradesh': ['Visakhapatnam', 'Vijayawada', 'Guntur', 'Nellore', 'Kurnool', 'Rajahmundry', 'Tirupati', 'Kadapa', 'Kakinada', 'Anantapur'],
  'Arunachal Pradesh': ['Itanagar', 'Naharlagun', 'Pasighat', 'Roing', 'Tawang', 'Ziro', 'Bomdila', 'Aalo', 'Along', 'Tezu'],
  'Assam': ['Guwahati', 'Silchar', 'Dibrugarh', 'Jorhat', 'Nagaon', 'Tinsukia', 'Bongaigaon', 'Dhubri', 'Diphu', 'North Lakhimpur'],
  'Bihar': ['Patna', 'Gaya', 'Bhagalpur', 'Muzaffarpur', 'Darbhanga', 'Arrah', 'Begusarai', 'Katihar', 'Chhapra', 'Purnia'],
  'Chandigarh': ['Chandigarh'],
  'Chhattisgarh': ['Raipur', 'Bhilai', 'Bilaspur', 'Korba', 'Rajnandgaon', 'Raigarh', 'Jagdalpur', 'Ambikapur', 'Dhamtari', 'Durg'],
  'Dadra and Nagar Haveli and Daman and Diu': ['Daman', 'Silvassa'],
  'Delhi': ['New Delhi', 'Nangloi Jat', 'Sultanpur Majra', 'Sangam Vihar', 'Puth Khurd', 'Karol Bagh', 'Sultanpur', 'Burari', 'Najafgarh', 'Okhla'],
  'Goa': ['Panaji', 'Mormugao', 'Margao', 'Mapusa', 'Curchorem', 'Sancoale', 'Bicholim', 'Cuncolim', 'Valpoi', 'Canacona'],
  'Gujarat': ['Ahmedabad', 'Surat', 'Vadodara', 'Rajkot', 'Bhavnagar', 'Jamnagar', 'Junagadh', 'Gandhinagar', 'Gandhidham', 'Anand'],
  'Haryana': ['Faridabad', 'Gurgaon', 'Panipat', 'Yamunanagar', 'Rohtak', 'Hisar', 'Karnal', 'Sonipat', 'Panchkula', 'Ambala'],
  'Himachal Pradesh': ['Shimla', 'Solan', 'Dharamshala', 'Mandi', 'Sundarnagar', 'Palampur', 'Una', 'Baddi', 'Nahan', 'Hamirpur'],
  'Jammu and Kashmir': ['Srinagar', 'Jammu', 'Anantnag', 'Baramula', 'Sopore', 'Kathua', 'Rajauri', 'Punch', 'Udhampur', 'Jammu Cantonment'],
  'Jharkhand': ['Ranchi', 'Jamshedpur', 'Dhanbad', 'Bokaro Steel City', 'Deoghar', 'Phusro', 'Hazaribagh', 'Giridih', 'Ramgarh', 'Medininagar'],
  'Karnataka': ['Bangalore', 'Hubli', 'Mysore', 'Gulbarga', 'Mangalore', 'Belgaum', 'Davanagere', 'Bellary', 'Bijapur', 'Shimoga'],
  'Kerala': ['Thiruvananthapuram', 'Kochi', 'Kozhikode', 'Kollam', 'Thrissur', 'Alappuzha', 'Palakkad', 'Malappuram', 'Kannur', 'Kottayam'],
  'Ladakh': ['Leh', 'Kargil'],
  'Lakshadweep': ['Kavaratti', 'Andrott', 'Kalpeni', 'Amini', 'Agatti'],
  'Madhya Pradesh': ['Indore', 'Bhopal', 'Jabalpur', 'Gwalior', 'Ujjain', 'Sagar', 'Dewas', 'Satna', 'Ratlam', 'Rewa'],
  'Maharashtra': ['Mumbai', 'Pune', 'Nagpur', 'Nashik', 'Aurangabad', 'Solapur', 'Amravati', 'Nanded', 'Kolhapur', 'Sangli'],
  'Manipur': ['Imphal', 'Thoubal', 'Lilong', 'Kakching', 'Mayang Imphal', 'Churachandpur', 'Bishnupur', 'Kumbi', 'Chandel', 'Kangpokpi'],
  'Meghalaya': ['Shillong', 'Tura', 'Jowai', 'Nongstoin', 'Baghmara', 'Williamnagar', 'Mairang', 'Resubelpara', 'Nongpoh', 'Khliehriat'],
  'Mizoram': ['Aizawl', 'Lunglei', 'Saiha', 'Champhai', 'Serchhip', 'Kolasib', 'Khawhai', 'Biate', 'Darlawn', 'N.Vanlaiphai'],
  'Nagaland': ['Kohima', 'Dimapur', 'Tuensang', 'Wokha', 'Zunheboto', 'Mokokchung', 'Phek', 'Mon', 'Longleng', 'Chumukedima'],
  'Odisha': ['Bhubaneswar', 'Cuttack', 'Rourkela', 'Brahmapur', 'Sambalpur', 'Puri', 'Balasore', 'Bhadrak', 'Baripada', 'Jharsuguda'],
  'Puducherry': ['Puducherry', 'Karaikal', 'Mahe', 'Yanam'],
  'Punjab': ['Ludhiana', 'Amritsar', 'Jalandhar', 'Patiala', 'Bathinda', 'Hoshiarpur', 'Mohali', 'Batala', 'Pathankot', 'Moga'],
  'Rajasthan': ['Jaipur', 'Jodhpur', 'Kota', 'Bikaner', 'Ajmer', 'Udaipur', 'Bhilwara', 'Alwar', 'Bharatpur', 'Sikar'],
  'Sikkim': ['Gangtok', 'Rangpo', 'Namchi', 'Mangan', 'Gyalshing', 'Singtam', 'Naya Bazar', 'Jorethang', 'Rhenock', 'Ravangla'],
  'Tamil Nadu': ['Chennai', 'Coimbatore', 'Madurai', 'Tiruchirappalli', 'Salem', 'Tirunelveli', 'Tiruppur', 'Ambattur', 'Avadi', 'Tiruvottiyur'],
  'Telangana': ['Hyderabad', 'Warangal', 'Nizamabad', 'Khammam', 'Ramagundam', 'Mahbubnagar', 'Nalgonda', 'Adilabad', 'Suryapet', 'Miryalaguda'],
  'Tripura': ['Agartala', 'Udaipur', 'Dharmanagar', 'Kailasahar', 'Belonia', 'Teliamura', 'Sonamura', 'Khowai', 'Ambassa', 'Sabroom'],
  'Uttar Pradesh': ['Lucknow', 'Kanpur', 'Ghaziabad', 'Agra', 'Meerut', 'Varanasi', 'Allahabad', 'Bareilly', 'Aligarh', 'Moradabad'],
  'Uttarakhand': ['Dehradun', 'Haridwar', 'Roorkee', 'Haldwani', 'Rudrapur', 'Kashipur', 'Rishikesh', 'Pithoragarh', 'Ramnagar', 'Ranikhet'],
  'West Bengal': ['Kolkata', 'Howrah', 'Asansol', 'Siliguri', 'Durgapur', 'Bardhaman', 'Malda', 'Baharampur', 'Habra', 'Kharagpur']
};
