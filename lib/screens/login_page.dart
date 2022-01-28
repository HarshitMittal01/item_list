import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:dsc/screens/home_page.dart';
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var passWord = TextEditingController();
  var id = 'test@admin.com';
  var password = '12345678';
  bool a = false;
  bool b = false;
  bool validateId(String emailid)
  {
    if(emailid == id)
      return true;

    return false;
  }
  bool validatePassword(String Password)
  {
    if(Password == password)
      return true;

    return false;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Padding(
          padding: EdgeInsets.all(0.0),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                //color: Colors.indigo,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return InstructionPopup();
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 23.0,right:20),
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              ]
            )
          ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 30, right: 15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))

                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Email Address: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      TextField(
                          controller: email,
                          decoration: InputDecoration(),
                          onSubmitted: (text) {
                            bool a = validateId(email.text);
                            if(a==false)
                            {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      content: Text(
                                          'Invalid Email Id\nEnter ID = test@admin.com')
                                  );
                                },
                              );
                            }
                          }
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 30, right: 15),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Password: ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      TextField(
                          controller: passWord,
                          decoration: InputDecoration(),

                          onSubmitted: (text) {
                            bool b = validatePassword(passWord.text);
                            if(b == false)
                            {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      content: Text(
                                          'Invalid Password\nEnter PASSWORD = 12345678')
                                  );
                                },
                              );
                            }
                          }
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  bool a = validateId(email.text);
                  bool b = validatePassword(passWord.text);

                  if(a==false)
                  {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text(
                                'Invalid Email Id\nEnter ID = test@admin.com')
                        );
                      },
                    );
                  }

                  if(a==true && b == false)
                  {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            content: Text(
                                'Invalid Password\nEnter PASSWORD = 12345678')
                        );
                      },
                    );
                  }

                  if(a==true && b==true)
                    {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder:
                                  (context) =>
                              HomePage()));
                      email.value = TextEditingValue.empty;
                      passWord.value = TextEditingValue.empty;

                    }
                },
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  margin: EdgeInsets.only(
                      top: 20, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)),
                  ),
                  width: MediaQuery.of(context)
                      .size
                      .width *
                      0.7,
                  child: Center(
                    child: AutoSizeText(
                      'Sign In',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 0, right: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))),
                alignment: Alignment.center,
                width: MediaQuery.of(context)
                    .size
                    .width *
                    0.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: <Widget>[
                      AutoSizeText(
                        "Sign up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      ),
    );
  }
}

class InstructionPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 0.0, top: 0.0, right: 0.0, bottom: 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            // height: MediaQuery.of(context).size.height*0.7,
            child: Column(
              children: [
                Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
                AutoSizeText(
                  'Login Details',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                AutoSizeText(
                'Email Id: test@admin.com\nPassword: 12345678',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                AutoSizeText(
                  '\nDeveloper Details',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                AutoSizeText(
                  'Name: Harshit Mittal\nRoll No.:2020UCD2133\nBranch: CSDS',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}