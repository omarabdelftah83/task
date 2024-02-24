import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  void getRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //باختصار، هذا السطر يقوم بجلب قيمة "تذكرني" المُخزنة في المفضلات، وإذا لم يتم العثور على قيمة مُخزنة، فإنه يعين قيمة افتراضية هي false.
    rememberMe = prefs.getBool('remember_me') ?? false;
    if (rememberMe==true) {
      usernameController.text = prefs.getString('email') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
    }
    emit(LoginLoaded(rememberMe));
  }

  Future<void> saveToSharedPreferences(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', rememberMe);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }
}
