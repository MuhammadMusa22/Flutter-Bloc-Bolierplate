abstract class ExampleRepositoryAbstract {
  Future<List<String>?> getExampleValues(bool throwError);
}

class ExampleRepository extends ExampleRepositoryAbstract {
  @override
  Future<List<String>?> getExampleValues(bool throwError) async {
    List<String> exampleValues = [];
    if (!throwError) {
      await Future.delayed(const Duration(seconds: 2), () {
        exampleValues.add('example 1');
        exampleValues.add('example 2');
        exampleValues.add('example 3');
      });
      return exampleValues;
    } else {
      return null;
    }
  }
}
