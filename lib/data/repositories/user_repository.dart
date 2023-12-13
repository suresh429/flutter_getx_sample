import 'package:flutter_getx_sample/data/models/post_entity.dart';
import 'package:flutter_getx_sample/data/models/user_entity.dart';
import 'package:flutter_getx_sample/utils/constants.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';

class Repository {
  final ApiService _apiService =
  Get.find(); // Use GetX's Get.find() to get the ApiService instance.

  Future<List<UserEntity>> getUsers() async {
    try {
      final data = await _apiService.genericGetApi(users);

      // Map the API response data to a List of User objects using the User.fromJson() constructor.
      return data.map((json) => UserEntity.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch users');
    }
  }


  Future<List<PostEntity>> getPosts() async {
    try {
      final data = await _apiService.genericGetApi(posts);

      // Map the API response data to a List of User objects using the User.fromJson() constructor.
      return data.map((json) => PostEntity.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }


  Future<void> postData(Map<String, dynamic> data) async {
    try {
      await _apiService.postData(data,posts);
    } catch (e) {
      throw Exception('Failed to post data: $e');
    }
  }
}