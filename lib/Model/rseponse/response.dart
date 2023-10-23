// import 'AutherModel.dart';
// import 'package:http/http.dart' as http;
// Future<AutherModel> fetchAuthers() async {
//   final response = await http.get(Uri.parse('https://cms.istad.co/api/ib-authors'));
//
//   if (response.statusCode == 200) {
//     return authersFromJson(response.body);
//   } else {
//     throw Exception('Failed to load authors');
//   }
// }