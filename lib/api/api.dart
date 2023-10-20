import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mai_jo/model/usermodel.dart';

// Future<Map<String, dynamic>> registerAPI(UserModel user) async {
//   final url = Uri.parse('https://mai-jo.com/App/APIS/Check_Phone_Number.php');

//   final response = await http.post(url, body: {
//     'u_id': user.u_id,
//     'phone_number': user.phone_number,
//     // باقي البيانات إذا كنت ترغب في إرسالها...
//   });
//   final responseData = json.decode(response.body);
//   print('user id : ${user.u_id}');
//   print('user phone number ${user.phone_number}');
//   print("Response Data For regestration $responseData");
//   if (response.statusCode != 200) {
//     throw Exception('Failed to register user.');
//   }

//   return json.decode(response.body);
// }

Future<Map<String, dynamic>> registerAPI(UserModel user) async {
  final url =
      Uri.parse('https://mai-jo.com/App/Customers_APIS/Check_Phone_Number.php');

  Map<String, String> dataToSend = {
    'u_id': user.u_id ?? "",
    'phone_number': user.phone_number ?? "",
    // باقي البيانات إذا كنت ترغب في إرسالها...
  };

  print("Data being sent to the server: $dataToSend");

  final response = await http.post(url, body: dataToSend);
  final responseData = json.decode(response.body);
  print('user id : ${user.u_id}');
  print('user phone number ${user.phone_number}');
  print("Response Data For registration $responseData");
  if (response.statusCode != 200) {
    throw Exception('Failed to register user.');
  }

  return json.decode(response.body);
}
