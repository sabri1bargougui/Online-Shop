import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:happy_shop/Core/Design/constant.dart';
import 'package:happy_shop/Features/Presentation/Authentification/OTP_Screen.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'TN';
  PhoneNumber number = PhoneNumber(isoCode: 'TN');
  bool _isPhoneEntred = false;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 90),
            Text(
              "Happy Shop",
              style: TextStyle(
                fontFamily: 'Sarina',
                fontSize: 46,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              child: Form(
                child: Column(
                  children: [
                    SizedBox(height: (height > 600) ? 150 : 70),
                    Padding(
                      padding: EdgeInsets.only(left: width > 320 ? 25.0 : 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Phone Number",
                          style: headline8,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 366,
                      height: 60,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14, right: 16),
                          child: Container(
                            color: Colors.transparent,
                            child: InternationalPhoneNumberInput(
                              cursorColor: Colors.black,
                              inputDecoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: Colors.white,
                                filled: true,
                              ),
                              spaceBetweenSelectorAndTextField: 9,
                              onInputChanged: (PhoneNumber number) {
                                if (number.phoneNumber!.length != 12) {
                                  setState(() {
                                    _isPhoneEntred = false;
                                  });
                                } else {
                                  setState(() {
                                    _isPhoneEntred = true;
                                    phoneNumber = number.phoneNumber!;
                                  });
                                }
                              },
                              onInputValidated: (bool value) {},
                              selectorConfig: SelectorConfig(
                                selectorType: PhoneInputSelectorType.DIALOG,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle: TextStyle(color: Colors.black),
                              initialValue: number,
                              textFieldController: controller,
                              formatInput: true,
                              keyboardType: TextInputType.numberWithOptions(
                                signed: true,
                                decimal: true,
                              ),
                              inputBorder: OutlineInputBorder(),
                              onSaved: (PhoneNumber number) {
                                setState(() {});
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _isPhoneEntred
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width: 360,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                  ),
                                  onPressed: () async {
                                    // ignore: unused_local_variable
                                    final siginicode =
                                        await SmsAutoFill().getAppSignature;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OtpScreen(
                                          phoneNumber: phoneNumber!,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width: 360,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey[300],
                                  ),
                                  onPressed: () {
                                    formKey.currentState?.validate();
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height > 800 ? 250 : 180),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                text: "By logging in, you have accepted the ",
                                style: headline14,
                                children: [
                                  TextSpan(
                                    text: "Terms of use ",
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  TextSpan(text: 'and ', style: headline14),
                                  TextSpan(
                                    text: 'privacy policy ',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  TextSpan(
                                    style: headline14,
                                    text: 'of Buy ',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
