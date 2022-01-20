import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tazah_tech_sale/data/auth_repository/auth_repository.dart';
import 'package:tazah_tech_sale/models/user_model.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepoInterface authRepository;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  getListOfUsers(
      {required String userName, required String emailPassword}) async {
    emit(AuthenticationLoading());
    List<User>? users = await authRepository.fetchUsers();
    ///checking if users are loaded and response is success
    ///then we will check for email and password by comparing each and every item in the list
    ///if found, authenticate state will be emitted.
    if (users != null) {
      var data = users.where(
            (user) => (user.username == userName && user.email == emailPassword),
      );
      if (data.length >= 1) {
        emit(Authenticated());
      } else {
        emit(AuthenticationFailed());
      }
    } else {
      emit(InternalError());
    }
  }
}