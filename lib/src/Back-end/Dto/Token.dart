import 'package:dio/dio.dart';


class User {
  String username;
  String password;

  User({required this.username, required this.password});

  // Metodo para convertir el objeto User a formato json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}


Future<Response> pruebaAccesoToken(User user) async {
  final dio = Dio();

  const String userAuthUrl = "http://localhost:8080/user/auth/";

  try {

    dio.options.headers["Access-Control-Allow-Origin"] = "*";
    dio.options.headers["Access-Control-Allow-Credentials"] = true;
    dio.options.headers["Access-Control-Allow-Headers"] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    dio.options.headers["Access-Control-Allow-Methods"] =
        "GET, HEAD, POST, OPTIONS";
    final response = await dio.post(
      userAuthUrl,
      data: user.toJson(),
    );

    print(response.data);

    return response;
  } on DioException catch (e) {
    print("Error: $e");
    // Maneja el error de manera adecuada según tus necesidades.
    throw Exception("Error al realizar la solicitud: $e");
  }
}
