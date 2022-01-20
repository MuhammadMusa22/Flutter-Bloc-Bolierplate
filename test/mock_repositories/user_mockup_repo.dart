
import 'package:tazah_tech_sale/data/auth_repository/auth_repository.dart';
import 'package:tazah_tech_sale/models/user_model.dart';

final usersList = <User>[
  User(
    id: 1,
    name: 'musa',
    username: 'musa22',
    email: 'musa22@gmail.com',
    address: Address(
        suite: '',
        street: '',
        city: '',
        zipcode: '',
        geo: Geo(lat: '', lng: '')),
    phone: 'phone',
    website: 'website',
    company: Company(name: '', catchPhrase: '', bs: ''),
  ),
];

class MockAuthRepository implements AuthRepoInterface {
  @override
  Future<List<User>?> fetchUsers() async =>
      Future.delayed(Duration(seconds: 2), () => [...usersList]);
}