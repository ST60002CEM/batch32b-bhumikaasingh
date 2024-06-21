// class ApiEndpoints {
//   ApiEndpoints._();

//   static const Duration connectionTimeout = Duration(seconds: 1000);
//   static const Duration receiveTimeout = Duration(seconds: 1000);
//   static const String baseUrl = "http://10.0.2.2:3000/api/v1/";
//   //static const String baseUrl = "http://localhost:3000/api/v1/";
//   //static const String baseUrl = "http://192.168.4.4:3000/api/v1/";

//   // ====================== Auth Routes ======================
//   static const String login = "auth/login";
//   static const String register = "auth/register";

// }

class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = "http://10.0.2.2:3000/api/v1/"; emuletor
  static const String baseUrl = "http://10.1.16.113:5500/api/user/";

  // ====================== Auth Routes ======================
  static const String login = "login";
  static const String register = "create";
  // static const String imageUrl = "http://10.0.2.2:3000/uploads/";
  // static const String uploadImage = "auth/uploadImage";
}