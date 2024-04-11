// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:mailer/mailer.dart';
// import 'package:path_provider/path_provider.dart';
//
// class SendEmailOTP {
//   final BuildContext context;
//   final String email;
//   final String sendotp;
//
//   SendEmailOTP(this.context, this.email, this.sendotp);
//
//   Future<void> sendEmail() async {
//     try {
//       final Email email = Email(
//         body: 'Your data: $sendotp', // You can customize this body
//         subject: 'Device Tracker',
//         recipients: [this.email],
//         isHTML: true,
//       );
//
//       final List<Attachment> attachments = [];
//
//       // Adding data as an attachment
//       final Uint8List data = Uint8List.fromList(sendotp.codeUnits);
//       attachments.add(Attachment(
//           data: data,
//           filename: 'data.txt'
//       ));
//
//       email.attachments = attachments;
//
//       await FlutterEmailSender.send(email);
//       print('Email sent successfully');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Email sent successfully')),
//       );
//     } catch (error) {
//       print('Error sending email: $error');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to send email')),
//       );
//     }
//   }
// }
