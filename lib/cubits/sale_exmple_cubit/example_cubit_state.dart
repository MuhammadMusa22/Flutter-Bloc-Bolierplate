import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

abstract class ExampleCubitState extends Equatable {
  const ExampleCubitState();
}

class ExampleCubitInitialState extends ExampleCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => ['initial'];
}

class ExampleCubitLoadingState extends ExampleCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => ['loading'];
}

class ExampleCubitLoadedState extends ExampleCubitState {
  final List<String> exampleValues;

  const ExampleCubitLoadedState({required this.exampleValues});

  @override
  // TODO: implement props
  List<Object?> get props => [exampleValues];
}

class ExampleCubitErrorState extends ExampleCubitState {
  @override
  // TODO: implement props
  List<Object?> get props => ['error'];
}
