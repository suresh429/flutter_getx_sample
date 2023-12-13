import 'package:dio/dio.dart';

import '../../utils/constants.dart';

class ApiService {

  final Dio _dio; // Dio instance to perform HTTP requests.

  ApiService({required Dio dio}) : _dio = dio;


  // get request
  Future<List<dynamic>> genericGetApi(String query) async {
    try {
      // Make a GET request to the API endpoint to fetch user data.
      final response = await _dio.get('$baseUrl$query');

      // Check if the response status code is 200 (OK).
      if (response.statusCode == 200) {
        return response
            .data; // If successful, return the response data (List of dynamic).
      } else {
        // If the response status code is not 200, throw an exception with an error message.
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      // If any exception occurs during the API call, throw an exception with the error message.
      throw Exception('An error occurred: $e');
    }
  }



  // post request
  Future<Response> postData(Map<String, dynamic> data,String query) async {
    try {
      final response = await _dio.post('$baseUrl$query', data: data);
      print("post data : ${response.statusCode}  $response");
      //return response;
      if (response.statusCode == 201) {
        return response; // If successful, return the response data (List of dynamic).
      } else {
        // If the response status code is not 200, throw an exception with an error message.
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make the request: $error');
    }
  }



}
