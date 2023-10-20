import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mai_jo/api/api.dart';
import 'package:mai_jo/http_repo/make_request.dart';
import 'package:mai_jo/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  // Future<void> registerUser(UserModel newUser) async {
  //   // افترض أن الواجهة ترجع قاموسًا يحتوي على القيمة
  //   Map<String, dynamic> response = await registerAPI(newUser);

  //   if (response.containsKey('Verification_Code')) {
  //     // حفظ القيمة في SharedPreferences
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString(
  //         'Verification_Code', response['Verification_Code'].toString());

  //     // حفظ القيمة في نموذج المستخدم
  //     _user = UserModel(
  //       // ... القيم الأخرى للنموذج ...
  //       verificationCode: response['Verification_Code'],
  //     );
  //     print('verification code :${user.verificationCode}');
  //   }

  //   notifyListeners();
  // }
  Future<Map<String, dynamic>> registerUser(UserModel newUser) async {
    // استدعاء الواجهة البرمجية وتخزين الرد
    Map<String, dynamic> response = await registerAPI(newUser);

    if (response.containsKey('Verification_Code')) {
      // حفظ القيمة في SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'Verification_Code', response['Verification_Code'].toString());

      // حفظ القيمة في نموذج المستخدم
      // _user = UserModel(
      //   // ... القيم الأخرى للنموذج ...
      //   // verificationCode: response['Verification_Code'],
      // );
      print('verification code :${_user.verificationCode}');
    }

    notifyListeners();
    return response; // إعادة الرد في نهاية الدالة
  }

  // late String _token;
  // String get token => _token;
  // Future<void> loginUser(String phone_number, String password) async {
  //   final Uuid _uuid = Uuid();
  //   final u_id = _uuid.v4();
  //   // هذه البيانات التي سيتم إرسالها
  //   final bodyData = {
  //     'phone_number': phone_number,
  //     'password': password,
  //     'u_id': u_id, // <-- Send the generated UUID as part of the request
  //   };
  //   // طباعة البيانات
  //   print(
  //       '----------------------------------------------------------------------------Sending data: $bodyData');

  //   try {
  //     var request = await HttpRepository().makeRequest(
  //         bodyMap: bodyData,
  //         path: 'Login.php',
  //         requestType: HttpRequest.postAuth);
  //     print('api Request $request');
  //   } catch (error) {
  //     print("Login Error: $error");
  //     rethrow;
  //   }
  // }

  //------------------------------------------------------------------

  late String _token;
  String get token => _token;
  Future<void> loginUser(String phone_number, String password) async {
    final url = Uri.parse('https://mai-jo.com/App/Customers_APIS/Login.php');

    // Create an instance of Uuid
    final Uuid _uuid = Uuid();

    // Generate a UUID
    final u_id = _uuid.v4();

    // هذه البيانات التي سيتم إرسالها
    final bodyData = {
      'phone_number': phone_number,
      'password': password,
      'u_id': u_id, // <-- Send the generated UUID as part of the request
    };

    // طباعة البيانات
    print('Sending data: $bodyData');

    try {
      final response = await http.post(url, body: bodyData);
      final responseData = json.decode(response.body);
      print('Full server response: $responseData');
      if (response.statusCode == 1) {
        final successData = responseData;
        print('*************$successData**************');

        _token = successData['api_token'];
        notifyListeners();
      } else {
        print('error ');
        // throw Exception(responseData.containsKey('message')
        //     ? responseData['message']
        //     : 'Unknown error');
      }
    } catch (error) {
      print("Login Error: $error");
      rethrow;
    }
  }
  // Future<void> loginUser(
  //     String phone_number, String password, BuildContext context) async {
  //   final Uuid _uuid = Uuid();
  //   final u_id = _uuid.v4();

  //   final bodyData = {
  //     'phone_number': phone_number,
  //     'password': password,
  //     'u_id': u_id,
  //   };

  //   print(
  //       '----------------------------------------------------------------------------Sending data: $bodyData');

  //   try {
  //     var response = await HttpRepository().makeRequest(
  //         bodyMap: bodyData,
  //         path: 'Login.php',
  //         requestType: HttpRequest.postAuth);

  //     print('API Response $response');

  //     // استخدام التحقق من الاستجابة
  //     if (response['status'] == "0") {
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (context) => const HomePageScreen()),
  //           (Route<dynamic> route) => false);
  //     } else if (response['status'] == "1") {
  //       showDialog(
  //         context: context,
  //         builder: (ctx) => AlertDialog(
  //           title: const Text('An error occurred'),
  //           content: Text(response['error']),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(ctx).pop();
  //               },
  //               child: const Text('Okay'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } catch (error) {
  //     print("Login Error: $error");
  //     rethrow;
  //   }
  // }

  // Future<void> sendOTPToAPI(UserModel user) async {
  //   final url = Uri.parse('رابط الواجهة البرمجية الخاص بك');

  //   final response = await http.post(url, body: {
  //     'otpCode': user.otpCode,
  //     'phone_number': user.phone_number,
  //     'u_id': user.u_id,
  //     'Verification_Code': user.otpCode,
  //     // ... أي بيانات إضافية ترغب في إرسالها
  //   });

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to send OTP.');
  //   }

  //   // ... أي أكواد إضافية ترغب في تنفيذها بعد الإرسال
  // }
  Future<void> saveVerificationCode(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('verificationCode', code);
  }

  Future<void> sendDataToAPI({
    required String u_id,
    required String phone_number,
    required String verificationCode,
    required String otpByUser,
  }) async {
    final url = Uri.parse(
        'https://mai-jo.com/App/APIS/OTP_Check.php'); // <-- ضع الرابط الخاص بك هنا

    // هذه البيانات التي سيتم إرسالها
    final bodyData = {
      'u_id': u_id,
      'phone_number': phone_number,
      'verificationCode': verificationCode,
      'otp': otpByUser,
    };

    try {
      final response = await http.post(url, body: bodyData);
      final responseData = json.decode(response.body);
      print('Server Response: $responseData');

      if (response.statusCode != 200) {
        // أو أي رمز حالة يعبر عن النجاح
        throw Exception('Failed to send data to API');
      }
    } catch (error) {
      print("Error sending data to API: $error");
      rethrow;
    }
  }

  Future<void> sendAnotherCodeAPI({
    required String u_id,
    required String phone_number,
  }) async {
    final url = Uri.parse(
        'https://mai-jo.com/App/APIS/OTP_Check_2.php'); // <-- ضع الرابط الخاص بواجهة البرمجية هنا

    // هذه البيانات التي سيتم إرسالها
    final bodyData = {
      'u_id': u_id,
      'phone_number': phone_number,
    };

    try {
      final response = await http.post(url, body: bodyData);
      final responseData = json.decode(response.body);
      print('Server Response: $responseData');
      print('status code : ${response.statusCode}');
      print('status 0 or 1 : ${responseData['Status']}');

      if (response.statusCode == 200) {
        print("sucess");
      } else {
        throw Exception(responseData['message'] ?? 'Error sending code again');
      }
    } catch (error) {
      print("Error sending another code to API: $error");
      rethrow;
    }
  }

  Future<void> sendPasswordData({
    required String u_id,
    required String phone_number,
    required String password,
    required String confirm_password,
  }) async {
    final url = Uri.parse(
        'https://mai-jo.com/App/APIS/Get_Password.php'); // <-- ضع الرابط الخاص بك هنا

    // هذه البيانات التي سيتم إرسالها
    final bodyData = {
      'u_id': u_id,
      'phone_number': phone_number,
      'password': password,
      'confirm_password': confirm_password,
    };
    try {
      final response = await http.post(url, body: bodyData);
      final responseData = json.decode(response.body);
      print('Server Response: $responseData');
      print('status code : ${response.statusCode}');
      print('status 0 or 1 : ${responseData['Status']}');

      if (response.statusCode == 200) {
        print("sucess");
      } else {
        throw Exception(responseData['message'] ?? 'Error sending code again');
      }
    } catch (error) {
      print("Error sending another code to API: $error");
      rethrow;
    }
  }

  Future<void> sendUserData({
    required String u_id,
    required String phone_number,
    required String password,
    required String first_name,
    required String last_name,
  }) async {
    final url = Uri.parse(
        'https://mai-jo.com/App/APIS/Get_Name.php'); // <-- ضع الرابط الخاص بك هنا

    // هذه البيانات التي سيتم إرسالها
    final bodyData = {
      'u_id': u_id,
      'phone_number': phone_number,
      'password': password,
      'first_name': first_name,
      'last_name': last_name,
    };
    try {
      final response = await http.post(url, body: bodyData);
      final responseData = json.decode(response.body);
      print('Server Response: $responseData');
      print('status code : ${response.statusCode}');
      print('status 0 or 1 : ${responseData['Status']}');

      if (response.statusCode == 200) {
        print("sucess");
      } else {
        throw Exception(responseData['message'] ?? 'Error sending code again');
      }
    } catch (error) {
      print("Error sending another code to API: $error");
      rethrow;
    }
  }

  // final AuthService _authService = AuthService();

  // Future<bool> checkPhoneNumber(String phonenumber) async {
  //   try {
  //     // استدعاء الوظيفة من auth_services.dart
  //     final response = await _authService.checkPhoneNumber(phonenumber);

  //     if (response) {
  //       // الرقم موجود
  //       return true;
  //     } else {
  //       // الرقم غير موجود
  //       return false;
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //     throw e;
  //   }
  // }

  // Future<void> resetPassword(String phonenumber, String password) async {
  //   try {
  //     await _authService.resetPassword(phonenumber, password);
  //     // تحديث الواجهة الرسومية إذا لزم الأمر
  //     notifyListeners();
  //   } catch (error) {
  //     // التعامل مع الأخطاء
  //   }
  // }
}
