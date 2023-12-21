import 'package:flutter_getx_sample/generated/json/base/json_convert_content.dart';
import 'package:flutter_getx_sample/mvvm/models/home/user_data_entity.dart';

UserDataEntity $UserDataEntityFromJson(Map<String, dynamic> json) {
  final UserDataEntity userDataEntity = UserDataEntity();
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    userDataEntity.page = page;
  }
  final int? perPage = jsonConvert.convert<int>(json['per_page']);
  if (perPage != null) {
    userDataEntity.perPage = perPage;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    userDataEntity.total = total;
  }
  final int? totalPages = jsonConvert.convert<int>(json['total_pages']);
  if (totalPages != null) {
    userDataEntity.totalPages = totalPages;
  }
  final List<UserDataData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<UserDataData>(e) as UserDataData).toList();
  if (data != null) {
    userDataEntity.data = data;
  }
  final UserDataSupport? support = jsonConvert.convert<UserDataSupport>(
      json['support']);
  if (support != null) {
    userDataEntity.support = support;
  }
  return userDataEntity;
}

Map<String, dynamic> $UserDataEntityToJson(UserDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['page'] = entity.page;
  data['per_page'] = entity.perPage;
  data['total'] = entity.total;
  data['total_pages'] = entity.totalPages;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['support'] = entity.support?.toJson();
  return data;
}

extension UserDataEntityExtension on UserDataEntity {
  UserDataEntity copyWith({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserDataData>? data,
    UserDataSupport? support,
  }) {
    return UserDataEntity()
      ..page = page ?? this.page
      ..perPage = perPage ?? this.perPage
      ..total = total ?? this.total
      ..totalPages = totalPages ?? this.totalPages
      ..data = data ?? this.data
      ..support = support ?? this.support;
  }
}

UserDataData $UserDataDataFromJson(Map<String, dynamic> json) {
  final UserDataData userDataData = UserDataData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userDataData.id = id;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userDataData.email = email;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    userDataData.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    userDataData.lastName = lastName;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userDataData.avatar = avatar;
  }
  return userDataData;
}

Map<String, dynamic> $UserDataDataToJson(UserDataData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['email'] = entity.email;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['avatar'] = entity.avatar;
  return data;
}

extension UserDataDataExtension on UserDataData {
  UserDataData copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return UserDataData()
      ..id = id ?? this.id
      ..email = email ?? this.email
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..avatar = avatar ?? this.avatar;
  }
}

UserDataSupport $UserDataSupportFromJson(Map<String, dynamic> json) {
  final UserDataSupport userDataSupport = UserDataSupport();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    userDataSupport.url = url;
  }
  final String? text = jsonConvert.convert<String>(json['text']);
  if (text != null) {
    userDataSupport.text = text;
  }
  return userDataSupport;
}

Map<String, dynamic> $UserDataSupportToJson(UserDataSupport entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['text'] = entity.text;
  return data;
}

extension UserDataSupportExtension on UserDataSupport {
  UserDataSupport copyWith({
    String? url,
    String? text,
  }) {
    return UserDataSupport()
      ..url = url ?? this.url
      ..text = text ?? this.text;
  }
}