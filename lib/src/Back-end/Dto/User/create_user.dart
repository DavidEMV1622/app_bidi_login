import 'package:dio/dio.dart';

Future<int> createUser({
  required String username, 
  required String firstName, 
  required String lastName, 
  required String email,
  required int cel,
  required String password
}) async {
  final dio = Dio();

  Map<String, dynamic> toJson() {
    return 
    /* {"username": email,
      "password": password,}; */
    
    {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "enabled": true,
      "attributes": {
          "cel": cel,
      },
      "credentials": [
          {
              "type": "password",
              "value": password
          }
      ]
    };
  }
/* {
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "enabled": true,
      "attributes": {
            "cel": cel
      },
      "credentials": [
        {
          "type": "password",
          "value": password
        }
      ]
    }; */
  const String userCreateUrl = "http://localhost:8080/user/create/"; // URL Web
  //const String userCreateUrl = "http://localhost:8080/user/auth/";

  //const String userAuthUrl = "http://10.0.2.2:8080/user/create/"; // URL android
  
  try {
    final response = await dio.post(
      userCreateUrl,
      data: toJson(),
      // Permite agregar un header a la peticion post (si lo pide la api), 
      //se utiliza para autenticar por medio del token, las peticiones
      //a la hora de obtener los datos del usuario 
      options: Options(
      headers: {
        'Authorization': "Bearer",
      })
    );
    
    final token = response.data;
    print(token);

    return response.statusCode!; // Retorna la respuesta de la petición http

  } on DioException catch (e) { // Excepciones para manejar los errores
    return e.response!.statusCode!;
  }
}