import 'package:bloc/bloc.dart';
import 'package:tazah_tech_sale/cubits/sale_exmple_cubit/example_cubit_state.dart';
import 'package:tazah_tech_sale/data/repositories/example_repository.dart';

class ExampleCubit extends Cubit<ExampleCubitState> {
  final ExampleRepositoryAbstract exampleRepository;

  ExampleCubit({required this.exampleRepository})
      : super(ExampleCubitInitialState());

  void getExampleValues(bool throwError) async {
    try {
      emit(ExampleCubitLoadingState());
      final List<String>? exampleValues =
          await exampleRepository.getExampleValues(throwError);
      if (exampleValues != null) {
        emit(ExampleCubitLoadedState(exampleValues: exampleValues));
      } else {
        emit(ExampleCubitErrorState());
      }
    } catch (e) {
      emit(ExampleCubitErrorState());
    }
  }
}
