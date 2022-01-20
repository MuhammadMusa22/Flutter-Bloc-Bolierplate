import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tazah_tech_sale/constants/constants.dart';
import 'package:tazah_tech_sale/cubits/sale_exmple_cubit/example_cubit.dart';
import 'package:tazah_tech_sale/cubits/sale_exmple_cubit/example_cubit_state.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<ExampleCubit, ExampleCubitState>(
              builder: (context, state) {
                if(state is ExampleCubitLoadingState){
                  return const CircularProgressIndicator();
                }else if(state is ExampleCubitLoadedState){
                  return  Text(
                    'Example values are: ${state.exampleValues.toString()}',style: TextStyle(color: AppColors.white),
                  );
                }else{
                  return const Text(
                    'Example values:',
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                context.read<ExampleCubit>().getExampleValues(false);
              },
              child:  Text('GET VALUES',style: TextStyle(),),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}