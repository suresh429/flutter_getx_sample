

import 'dart:ui';

import 'package:flutter_getx_sample/mvvm/models/user_data_entity.dart';
import '../data/network/network_api_services.dart';
import '../res/app_url/app_url.dart';



class HomeRepository {

  final _apiService  = NetworkApiServices() ;

  Future<UserDataEntity> userListApi() async{
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserDataEntity.fromJson(response) ;
  }


}