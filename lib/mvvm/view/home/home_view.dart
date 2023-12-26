import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../res/routes/routes_name.dart';
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
      appBar: AppBar(
        title: const Text("Home"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then((value) {
                  Get.offAllNamed(RouteName.loginView);
                  Get.delete<HomeController>();
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.toNamed(RouteName.scrollView);
          Get.snackbar("title", "message");
          Get.defaultDialog(title: "Alert", middleText: "middle text");
          Get.bottomSheet(
            Container(
                height: 250,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Hi 1', textScaleFactor: 2),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Hi 2', textScaleFactor: 2),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Hi 3', textScaleFactor: 2),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Hi 4', textScaleFactor: 2),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.back(closeOverlays: true);
                        },
                        child: const Text('Submit'),
                      )
                    ],
                  ),
                )),
          );
        },
        child: const Icon(Icons.add),
      ),
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
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                    ),
                  );
                });
  }
}
