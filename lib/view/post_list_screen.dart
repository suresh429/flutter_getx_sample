

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../view_models/user_view_model.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: GetBuilder<UserViewModel>( // Use GetBuilder to access the UserViewModel.
        init: UserViewModel(), // Initialize the UserViewModel instance.
        builder: (userViewModel) {
          // Use the userViewModel to access the state data.
          return userViewModel.loading
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : userViewModel.errorMessage.isNotEmpty
              ? Center(
            child: Text(userViewModel.errorMessage),
          )
              : ListView.builder(
            itemCount: userViewModel.posts.length,
            itemBuilder: (context, index) {
              final user = userViewModel.posts[index];

              return ListTile(
                title: Text(user.title!),
                subtitle: Text(user.body!),
                leading: CircleAvatar(
                  child: Text(user.id.toString()),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

