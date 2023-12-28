import 'package:flutter/material.dart';
import 'package:flutter_getx_sample/mvvm/models/user_data_entity.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../view_models/controller/home_view_models.dart';
import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());

  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeController.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {
                  homeController.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeController.refreshApi();
              });
            }
          case Status.COMPLETED:
            if (homeController.userList.value.data!.isEmpty) {
              return const Center(child: Text("No data Found!"));
            } else {
              return buildListView();
            }
        }
      }),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: homeController.userList.value.data!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                openBottomSheet(homeController.userList.value.data![index]);
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(homeController
                    .userList.value.data![index].avatar
                    .toString()),
              ),
              title: Text(homeController.userList.value.data![index].firstName
                  .toString()),
              subtitle: Text(
                  homeController.userList.value.data![index].email.toString()),
            ),
          );
        });
  }

  void openBottomSheet(UserDataData userDataData) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //color: Colors.grey,
                    decoration: const BoxDecoration(
                      //color:Colors.grey ,
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(3))
                    ),
                    height: 2.5,
                    width: 55.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      userDataData.avatar.toString(),
                    ),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    userDataData.firstName.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.deepPurple),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(userDataData.email.toString()),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "The bottom navigation bar consists of multiple items in the form of text labels, icons, or both, laid out on top of a piece of material. It provides quick navigation between the top-level views of an app. For larger screens, side navigation may be a better fit. \n The bottom navigation bar consists of multiple items in the form of text labels, icons, or both, laid out on top of a piece of material. It provides quick navigation between the top-level views of an app. For larger screens, side navigation may be a better fit.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
