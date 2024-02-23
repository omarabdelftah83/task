import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/presention/screen/home.dart';
import 'package:task/utils/string_manager.dart';
import '../controller/login/login_cubit.dart';
import '../controller/login/login_state.dart';
import '../widget/custom_button.dart';
import '../widget/custom_check_box.dart';
import '../widget/custom_flutter_toast.dart';
import '../widget/custom_row.dart';
import '../widget/custom_text.dart';
import '../widget/custom_textfaild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..getRememberMe(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if (state is LoginLoaded) {
          final cubit = BlocProvider.of<LoginCubit>(context);
          return Scaffold(
            appBar: AppBar(),
            backgroundColor: Colors.white,
            body: LayoutBuilder(
              builder: (context, size) {
                return SizedBox(
                  width: size.maxWidth > 500 ? 400 : 400,
                  height: size.maxHeight > 700 ? 600 : 500,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 50),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 150),

                          ///custom textFailed//
                          CustomTextField(
                            controller: cubit.usernameController,
                            hintText: AppString.enterYourEmail,
                            keyboardType: TextInputType.emailAddress,
                          ),

                          const SizedBox(height: 15),

                          ///custom textFailed//
                          CustomTextField(
                            controller: cubit.passwordController,
                            hintText: AppString.password,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),

                          ///custom customRow//
                          CustomRow(
                            children: <Widget>[
                              CustomCheckbox(
                                value: cubit.rememberMe,
                                onChanged: (value) {
                                  cubit.rememberMe = value ?? false;
                                  cubit.emit(LoginLoaded(cubit.rememberMe));
                                },
                              ),
                              const CustomText(AppString.rememberMe),
                            ],
                          ),

                          /// sign in button///
                          MyButton(
                            color: Colors.blueGrey,
                            title: AppString.signIn,
                            onPressed: () async {
                              if (cubit.passwordController.text.isNotEmpty &&
                                  cubit.usernameController.text.isNotEmpty) {
                                // Check if remember me is checked
                                if (cubit.rememberMe) {
                                  // Save email and password to SharedPreferences
                                  await cubit.saveToSharedPreferences(
                                      cubit.usernameController.text,
                                      cubit.passwordController.text);
                                }
                                // Navigate to home page
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              } else {
                                CustomFlutterToast.showToast(
                                  message: AppString.toast,
                                  gravity: ToastGravity.CENTER,
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
