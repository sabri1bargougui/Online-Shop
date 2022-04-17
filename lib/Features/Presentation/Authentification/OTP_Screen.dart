import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Authentification/User_Data_Screen.dart';
import 'package:happy_shop/Features/Presentation/Main/Main_Screen.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: new AppBar(
        title: Row(
          children: [
            SizedBox(width: 60),
            Center(
              child: new Text(
                "Create Account",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.black12,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black,
              ),
              value: 0.4,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Verify your phone number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: Stack(
                      children: [
                        Text(
                          'a code has been sent to your phone number :  ',
                          style: TextStyle(fontSize: width > 320 ? 17 : 13),
                        ),
                        Positioned(
                          top: 8,
                          left: 90,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              children: [
                                Text(
                                  '${widget.phoneNumber.toString()}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Enter code',
                  style: headline6,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: PinFieldAutoFill(
                keyboardType: TextInputType.number,
                cursor: Cursor(
                  width: 1,
                  height: 20,
                  color: Colors.black,
                  radius: Radius.circular(1),
                  enabled: true,
                ),
                codeLength: 6,
                autoFocus: true,
                onCodeChanged: (code) {
                  smsOTP = code;
                },
                onCodeSubmitted: (String code) {},
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 70, top: 5, bottom: 5),
              child: ArgonTimerButton(
                height: 40,
                width: 300,
                minWidth: 300,
                highlightColor: Colors.transparent,
                highlightElevation: 0,
                roundLoadingShape: false,
                splashColor: Colors.transparent,
                initialTimer: 30,
                onTap: (startTimer, btnState) {
                  if (btnState == ButtonState.Idle) {
                    startTimer(30);
                    generateOtp(widget.phoneNumber);
                  }
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Resend the code",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
                loader: (timeLeft) {
                  return Container(
                    width: 400,
                    child: Text(
                      "Renvoyer le code $timeLeft",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
                borderRadius: 5.0,
                color: Colors.transparent,
                elevation: 0,
              ),
            ),
            SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextButton(
                onPressed: () {
                  verifyOtp();
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 60,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? smsOTP;
  String? verificationId;
  String errorMessage = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    generateOtp(widget.phoneNumber);
  }

  @override
  void initState() {
    super.initState();
    _listnerOtp();
  }

  //dispose controllers
  @override
  void dispose() {
    super.dispose();
  }

  //Method for generate otp from firebase
  Future<void> generateOtp(String phonenumber) async {
    final PhoneCodeSent smsOTPSent = (String verId, [int? forceCodeResend]) {
      verificationId = verId;
    };
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phonenumber,
          codeAutoRetrievalTimeout: (String verId) {
            verificationId = verId;
          },
          codeSent: smsOTPSent,
          verificationCompleted: (AuthCredential phoneAuthCredential) {},
          verificationFailed: (FirebaseAuthException exception) {});
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  // auto fill listner ///
  Future _listnerOtp() async {
    // ignore: unnecessary_statements
    SmsAutoFill().listenForCode;
  }

  //Method for verify otp entered by user
  Future<void> verifyOtp() async {
    if (smsOTP == '') {
      showAlertDialog(context, 'please enter 6 digit otp');
      return;
    }
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId.toString(),
        smsCode: smsOTP.toString(),
      );

      final UserCredential user = await _auth.signInWithCredential(credential);
      if (user.additionalUserInfo!.isNewUser) {
        Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
            builder: (BuildContext context) {
              return UserDataScreen(
                phoneNumber: widget.phoneNumber,
              );
            },
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return MainScreen();
          },
        ));
      }
    } on FirebaseAuthException catch (e) {
      _showerror(e.message.toString());
    }
  }

  //Method for handle the errors
  void _showerror(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Erreur !'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Ok'),
          )
        ],
      ),
    );
  }

  //Basic alert dialogue for alert errors and confirmations
  void showAlertDialog(BuildContext context, String message) {
    // set up the AlertDialog
    final CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text('\n$message'),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
