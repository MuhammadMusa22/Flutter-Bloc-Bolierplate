import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:tazah_tech_sale/cubits/auth_example_cubit/auth_cubit.dart';

import '../mock_repositories/user_mockup_repo.dart';


void main() {
  group('Authentication cubit test', () {
    late AuthCubit? authCubit;
    MockAuthRepository authMockupRepo;

    setUp(() {
      EquatableConfig.stringify = true;
      authMockupRepo = MockAuthRepository();
      authCubit = AuthCubit(authRepository: authMockupRepo);
    });

    tearDown(() {
      authCubit!.close();
    });

    blocTest<AuthCubit, AuthState>(
        'This cubit will emit authenticated state if provided credentails are present in mockup repo data,vice versa unauthenticated',
        build: () => authCubit!,
        act: (cubit) => cubit.getListOfUsers(
            userName: 'musa223', emailPassword: 'musa22@gmail.com'),
        expect: () => [
          AuthenticationLoading(),
          AuthenticationFailed(),
        ]);
  });
}