import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:tazah_tech_sale/cubits/sale_exmple_cubit/example_cubit.dart';
import 'package:tazah_tech_sale/cubits/sale_exmple_cubit/example_cubit_state.dart';

import '../mock_repositories/example_mock_repo.dart';

void main() {
  late ExampleCubit? exampleCubit;
  MockExampleRepo mockExampleRepo;

  setUp(() {
    EquatableConfig.stringify = true;
    mockExampleRepo = MockExampleRepo();
    exampleCubit = ExampleCubit(exampleRepository: mockExampleRepo);
  });

  tearDown(() {
    exampleCubit!.close();
  });

  blocTest<ExampleCubit, ExampleCubitState>(
      'This cubit will get example values, if error occur, error case will be generated.',
      build: () => exampleCubit!,
      act: (cubit) => cubit.getExampleValues(true),
      expect: () => [
            ExampleCubitLoadingState(),
            //const ExampleCubitLoadedState(exampleValues: ['example 1']),
            ExampleCubitErrorState()
          ]);
}
