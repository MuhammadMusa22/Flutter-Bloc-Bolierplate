
import 'package:tazah_tech_sale/data/example_repository/example_repository.dart';

class MockExampleRepo implements ExampleRepositoryAbstract {

  @override
  Future<List<String>?> getExampleValues(bool throwError) async {
    List<String> exampleValues=[];
    if(!throwError){
      await Future.delayed(const Duration(seconds: 2),(){
        exampleValues.add('example 1');
      });
      return exampleValues;
    }else{
      return null;
    }
  }
}