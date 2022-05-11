import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tazah_tech_sale/config/app_colors.dart';
import 'package:tazah_tech_sale/config/app_screen_names.dart';
import 'package:tazah_tech_sale/cubits/auth_example_cubit/auth_cubit.dart';
import 'package:tazah_tech_sale/views/widgets/circular_button.dart';
import 'package:tazah_tech_sale/views/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();

  ///form key for validating textfields states.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              ScreenNames.homeScreen,
              (Route<dynamic> route) => false,
            );
            userEmailController.clear();
            userNameController.clear();
          }
          if (state is AuthenticationFailed) {
            ///user login failed , show snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Login Failed'),
              ),
            );
          }
          if (state is InternalError) {
            ///some other error occur and show snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Some error occured'),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                height: 400,
                child: Column(
                  children: [
                    ///login label
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: AppColors.white),
                      ),
                    ),

                    ///email textfield
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                          controller: userNameController,
                          isPasswordField: false,
                          hintText: 'User Name',
                          keyboardType: TextInputType.emailAddress,
                          validator: (userName) {
                            if (userName!.isEmpty) {
                              return 'Please enter username';
                            }
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///password textfield
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        controller: userEmailController,
                        isPasswordField: true,
                        hintText: 'Email',
                        keyboardType: TextInputType.visiblePassword,
                        validator: (email) {
                          if (email!.isEmpty) {
                            return 'Please enter email';
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email)) {
                            return 'Please enter valild email';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    ///login button
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthCubit>().getListOfUsers(
                                userName: userNameController.text,
                                emailPassword: userEmailController.text);
                          }
                        },
                        child: CircularButton(
                          buttonTitle: 'LOGIN',
                          buttonColor: AppColors.secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    ///registration label
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
