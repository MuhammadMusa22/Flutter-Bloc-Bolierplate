import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazah_tech_sale/constants/constants.dart';
import 'package:tazah_tech_sale/cubits/auth_example_cubit/auth_cubit.dart';
import 'package:tazah_tech_sale/cubits/sale_exmple_cubit/example_cubit.dart';
import 'package:tazah_tech_sale/data/auth_repository/auth_repository.dart';
import 'package:tazah_tech_sale/data/example_repository/example_repository.dart';
import 'package:tazah_tech_sale/routes/app_routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(authRepository: AuthRepository())),
        BlocProvider<ExampleCubit>(
            create: (context) =>
                ExampleCubit(exampleRepository: ExampleRepository())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRoutes().generateRoute,
        initialRoute: ScreenNames.loginScreen,
      ),
    );
  }
}
