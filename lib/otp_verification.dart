
import 'package:data_send_mail/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lottie/lottie.dart';

class otp_verification extends StatefulWidget {
  const otp_verification({super.key});

  @override
  State<otp_verification> createState() => _otp_verificationState();
}

class _otp_verificationState extends State<otp_verification> {
  bool isvlaid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                Lottie.network(
                  'https://lottie.host/aa10aa7c-f18d-48c2-9ecc-ff411ed792c9/6MWae1tM9h.json',
                  repeat: false,
                  height: 200,
                  width: 200,
                ),

                const Text("OTP Verification" , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20
                ),),
                const Text("We will send you am One Time Password",style: TextStyle(
                  fontSize: 13,
                  color: Colors.black45
                ),),
                const SizedBox(height: 20,),

                OtpTextField(
                  numberOfFields: 4,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    if(code.length==4)
                      {

                        isvlaid = true;
                      }
                    else{
                      isvlaid = false;
                    }
                    //handle validation or checks here
                  },

                  //runs when every textfield is filled
                  // onSubmit: (String verificationCode){
                  //   showDialog(
                  //       context: context,
                  //       builder: (context){
                  //         return AlertDialog(
                  //           title: const Text("Verification Code"),
                  //           content: Text('Code entered is $verificationCode'),
                  //         );
                  //       }
                  //   );
                  // }, // end onSubmit
                ),


              ],
            ),

            Container(
              margin: const EdgeInsets.all(16),
              child:Column(
              children: [
                SizedBox(width: double.infinity,
                  
                  child:  TextButton(
                    style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      // if(isvlaid)
                      //   {
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>  MyHomePage(title: "Form Registration")),
                        );

                        // }


                    },
                    child: const Text('Verify',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  ),
                )

              ],
            )


            ) ,

          ],
        ),
      ),
    );
  }
}
