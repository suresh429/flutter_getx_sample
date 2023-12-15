import 'package:flutter_getx_sample/data/models/post_entity.dart';
import 'package:flutter_getx_sample/data/models/user_entity.dart';
import 'package:get/get.dart';

import '../data/repositories/user_repository.dart';

class UserViewModel extends GetxController {
  final Repository _userRepository =
      Get.find(); // Use GetX's Get.find() to get the UserRepository instance.

  final RxList<UserEntity> _users =
      <UserEntity>[].obs; // List to store user data fetched from the API.
  final RxList<PostEntity> _posts =
      <PostEntity>[].obs; // List to store user data fetched from the API.
  bool _loading =
      false; // Boolean flag to track if data is currently being fetched.
  String _errorMessage =
      ''; // String to store any error message that occurs during data fetching.

  List<UserEntity> get users =>
      _users; // Getter method to access the list of users.
  List<PostEntity> get posts =>
      _posts; // Getter method to access the list of users.
  bool get loading => _loading; // Getter method to access the loading flag.
  String get errorMessage =>
      _errorMessage; // Getter method to access the error message.

  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    fetchPosts();
  }

  // get users
  Future<void> fetchUsers() async {
    _loading = true;
    _errorMessage = '';

    try {
      _users.value = await _userRepository.getUsers();
    } catch (e) {
      _errorMessage = 'Failed to fetch users';
    } finally {
      _loading = false;
      update(); // Use GetX's update() to notify listeners of data change.
    }
  }

  // get posts
  Future<void> fetchPosts() async {
    _loading = true;
    _errorMessage = '';

    try {
      _posts.value = await _userRepository.getPosts();
    } catch (e) {
      _errorMessage = 'Failed to fetch users';
    } finally {
      _loading = false;
      update(); // Use GetX's update() to notify listeners of data change.
    }
  }

// Function to make a post request
  Future<void> postData(String title,String description) async {
    _loading = true;

    try {
      final response = await _userRepository.postData({
        // Your data for the POST request
        "userId": 1,
        "id": 1,
        "title": title,
        "body": description
      });

      isLoggedIn.value = true;
      // Handle the response as needed
    } catch (error) {
      // Handle the error
    } finally {
      _loading = false;
      update();
    }
  }
}
