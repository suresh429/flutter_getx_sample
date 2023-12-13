import 'package:flutter_getx_sample/generated/json/base/json_convert_content.dart';
import 'package:flutter_getx_sample/data/models/user_entity.dart';

UserEntity $UserEntityFromJson(Map<String, dynamic> json) {
  final UserEntity userEntity = UserEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    userEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userEntity.name = name;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userEntity.username = username;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userEntity.email = email;
  }
  final UserAddress? address = jsonConvert.convert<UserAddress>(
      json['address']);
  if (address != null) {
    userEntity.address = address;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    userEntity.phone = phone;
  }
  final String? website = jsonConvert.convert<String>(json['website']);
  if (website != null) {
    userEntity.website = website;
  }
  final UserCompany? company = jsonConvert.convert<UserCompany>(
      json['company']);
  if (company != null) {
    userEntity.company = company;
  }
  return userEntity;
}

Map<String, dynamic> $UserEntityToJson(UserEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['username'] = entity.username;
  data['email'] = entity.email;
  data['address'] = entity.address?.toJson();
  data['phone'] = entity.phone;
  data['website'] = entity.website;
  data['company'] = entity.company?.toJson();
  return data;
}

extension UserEntityExtension on UserEntity {
  UserEntity copyWith({
    double? id,
    String? name,
    String? username,
    String? email,
    UserAddress? address,
    String? phone,
    String? website,
    UserCompany? company,
  }) {
    return UserEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..username = username ?? this.username
      ..email = email ?? this.email
      ..address = address ?? this.address
      ..phone = phone ?? this.phone
      ..website = website ?? this.website
      ..company = company ?? this.company;
  }
}

UserAddress $UserAddressFromJson(Map<String, dynamic> json) {
  final UserAddress userAddress = UserAddress();
  final String? street = jsonConvert.convert<String>(json['street']);
  if (street != null) {
    userAddress.street = street;
  }
  final String? suite = jsonConvert.convert<String>(json['suite']);
  if (suite != null) {
    userAddress.suite = suite;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    userAddress.city = city;
  }
  final String? zipcode = jsonConvert.convert<String>(json['zipcode']);
  if (zipcode != null) {
    userAddress.zipcode = zipcode;
  }
  final UserAddressGeo? geo = jsonConvert.convert<UserAddressGeo>(json['geo']);
  if (geo != null) {
    userAddress.geo = geo;
  }
  return userAddress;
}

Map<String, dynamic> $UserAddressToJson(UserAddress entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['street'] = entity.street;
  data['suite'] = entity.suite;
  data['city'] = entity.city;
  data['zipcode'] = entity.zipcode;
  data['geo'] = entity.geo?.toJson();
  return data;
}

extension UserAddressExtension on UserAddress {
  UserAddress copyWith({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    UserAddressGeo? geo,
  }) {
    return UserAddress()
      ..street = street ?? this.street
      ..suite = suite ?? this.suite
      ..city = city ?? this.city
      ..zipcode = zipcode ?? this.zipcode
      ..geo = geo ?? this.geo;
  }
}

UserAddressGeo $UserAddressGeoFromJson(Map<String, dynamic> json) {
  final UserAddressGeo userAddressGeo = UserAddressGeo();
  final String? lat = jsonConvert.convert<String>(json['lat']);
  if (lat != null) {
    userAddressGeo.lat = lat;
  }
  final String? lng = jsonConvert.convert<String>(json['lng']);
  if (lng != null) {
    userAddressGeo.lng = lng;
  }
  return userAddressGeo;
}

Map<String, dynamic> $UserAddressGeoToJson(UserAddressGeo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['lat'] = entity.lat;
  data['lng'] = entity.lng;
  return data;
}

extension UserAddressGeoExtension on UserAddressGeo {
  UserAddressGeo copyWith({
    String? lat,
    String? lng,
  }) {
    return UserAddressGeo()
      ..lat = lat ?? this.lat
      ..lng = lng ?? this.lng;
  }
}

UserCompany $UserCompanyFromJson(Map<String, dynamic> json) {
  final UserCompany userCompany = UserCompany();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    userCompany.name = name;
  }
  final String? catchPhrase = jsonConvert.convert<String>(json['catchPhrase']);
  if (catchPhrase != null) {
    userCompany.catchPhrase = catchPhrase;
  }
  final String? bs = jsonConvert.convert<String>(json['bs']);
  if (bs != null) {
    userCompany.bs = bs;
  }
  return userCompany;
}

Map<String, dynamic> $UserCompanyToJson(UserCompany entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['catchPhrase'] = entity.catchPhrase;
  data['bs'] = entity.bs;
  return data;
}

extension UserCompanyExtension on UserCompany {
  UserCompany copyWith({
    String? name,
    String? catchPhrase,
    String? bs,
  }) {
    return UserCompany()
      ..name = name ?? this.name
      ..catchPhrase = catchPhrase ?? this.catchPhrase
      ..bs = bs ?? this.bs;
  }
}