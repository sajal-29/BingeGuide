import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? errorMessage = '';
  bool isLogin = true;
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createuserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : ' $errorMessage',
      style:
          TextStyle(fontFamily: 'Montserrat', fontSize: 15, color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).buttonColor,
            Theme.of(context).accentColor,
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColor
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          padding: EdgeInsets.only(top: 40),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Binge',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Container(
                  height: 45,
                  width: 110,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    'Guide',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Welcome!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            Container(
              height: 200,
              width: 250,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/camera.jpg'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.2,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.85,
              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).accentColor.withOpacity(0.34),
              ),
              child: TextField(
                controller: _emailTextController,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontSize: 20),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                    prefixIcon: Icon(Icons.email),
                    prefixIconColor: Colors.black,
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.2,
              height: 50,
              width: MediaQuery.of(context).size.width * 0.85,
              // color: Colors.amber,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Theme.of(context).accentColor.withOpacity(0.34),
              ),
              child: TextField(
                controller: _passwordTextController,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                obscureText: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        fontSize: 20),
                    prefixIcon: Icon(Icons.password_sharp),
                    prefixIconColor: Colors.black,
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                shadowColor: MaterialStatePropertyAll(Colors.transparent),
              ),
              onPressed: isLogin
                  ? signInWithEmailAndPassword
                  : createuserWithEmailAndPassword,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Text(
                  isLogin ? 'Login' : 'Sign Up',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(child: Center(child: _errorMessage())),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLogin ? 'Not a user?' : 'Already a user?',
                    style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = !isLogin;
                        });
                      },
                      child: Text(
                        isLogin ? 'Register' : 'Login Instead',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 20),
                      )),
                ],
              ),
            )
          ]),
        ),
      ),
    ));
  }
}
