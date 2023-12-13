import 'package:flutter_getx_sample/generated/json/base/json_field.dart';
import 'package:flutter_getx_sample/generated/json/user_entity.g.dart';
import 'dart:convert';
export 'package:flutter_getx_sample/generated/json/user_entity.g.dart';

@JsonSerializable()
class UserEntity {
	double? id;
	String? name = '';
	String? username = '';
	String? email = '';
	UserAddress? address;
	String? phone = '';
	String? website = '';
	UserCompany? company;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => $UserEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserAddress {
	String? street = '';
	String? suite = '';
	String? city = '';
	String? zipcode = '';
	UserAddressGeo? geo;

	UserAddress();

	factory UserAddress.fromJson(Map<String, dynamic> json) => $UserAddressFromJson(json);

	Map<String, dynamic> toJson() => $UserAddressToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserAddressGeo {
	String? lat = '';
	String? lng = '';

	UserAddressGeo();

	factory UserAddressGeo.fromJson(Map<String, dynamic> json) => $UserAddressGeoFromJson(json);

	Map<String, dynamic> toJson() => $UserAddressGeoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserCompany {
	String? name = '';
	String? catchPhrase = '';
	String? bs = '';

	UserCompany();

	factory UserCompany.fromJson(Map<String, dynamic> json) => $UserCompanyFromJson(json);

	Map<String, dynamic> toJson() => $UserCompanyToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}