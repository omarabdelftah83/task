import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/presention/screen/home.dart';
import 'package:task/utils/route.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfaild.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _rememberMe = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getRememberMeStatus();
  }

  Future<void> _getRememberMeStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('remember_me') ?? false;
      if (_rememberMe) {
        _usernameController.text = prefs.getString('email') ?? '';
        _passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 150),
              CustomTextField(
                controller: _usernameController,
                hintText: 'Enter your Email',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 15),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Enter your pass',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  const Text('Remember Me'),
                ],
              ),
              /// sign in button
              MyButton(
                color: Colors.blueGrey,
                title: 'Sign in',
                onPressed: () async {
                  if (_passwordController.text.isNotEmpty &&
                      _usernameController.text.isNotEmpty) {
                    // Check if remember me is checked
                    if (_rememberMe) {
                      // Save email and password to SharedPreferences
                      await _saveCredentialsToSharedPreferences(
                          _usernameController.text,
                          _passwordController.text);
                    }
                    // Navigate to home page
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Please enter your email and password",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
  //save...///
  Future<void> _saveCredentialsToSharedPreferences(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', _rememberMe);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }
}