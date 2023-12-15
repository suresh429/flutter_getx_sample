import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/view/post_api_screen.dart';
import 'package:flutter_getx_sample/view/post_list_screen.dart';
import 'package:flutter_getx_sample/view_models/user_view_model.dart';
import 'package:get/get.dart'; // Import the getx package.

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: GetBuilder<UserViewModel>(
        // Use GetBuilder to access the UserViewModel.
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
                      itemCount: userViewModel.users.length,
                      itemBuilder: (context, index) {
                        final user = userViewModel.users[index];

                        return ListTile(
                          onTap: (){
                            Get.to(() => const PostList());
                          },
                          title: Text(user.name!),
                          subtitle: Text(user.email!),
                          leading: CircleAvatar(
                            child: Text(user.id.toString()),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios),
                        );
                      },
                    );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const PostApi());
        },
      ),
    );
  }
}
