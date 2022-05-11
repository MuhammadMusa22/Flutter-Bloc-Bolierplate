import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazah_tech_sale/config/app_colors.dart';
import 'package:tazah_tech_sale/config/app_constants.dart';
import 'package:tazah_tech_sale/cubits/auth_example_cubit/auth_cubit.dart';

class CircularButton extends StatelessWidget {
  final String buttonTitle;
  final Color buttonColor;
  const CircularButton(
      {Key? key, required this.buttonTitle, required this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthenticationLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            }
            return Text(
              buttonTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white),
            );
          },
        ),
      ),
    );
  }
}
