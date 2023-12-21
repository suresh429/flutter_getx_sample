import 'package:flutter_getx_sample/generated/json/base/json_field.dart';
import 'package:flutter_getx_sample/generated/json/user_data_entity.g.dart';
import 'dart:convert';
export 'package:flutter_getx_sample/generated/json/user_data_entity.g.dart';

@JsonSerializable()
class UserDataEntity {
	int? page = 0;
	@JSONField(name: "per_page")
	int? perPage = 0;
	int? total = 0;
	@JSONField(name: "total_pages")
	int? totalPages = 0;
	List<UserDataData>? data = [];
	UserDataSupport? support;

	UserDataEntity();

	factory UserDataEntity.fromJson(Map<String, dynamic> json) => $UserDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDataData {
	int? id = 0;
	String? email = '';
	@JSONField(name: "first_name")
	String? firstName = '';
	@JSONField(name: "last_name")
	String? lastName = '';
	String? avatar = '';

	UserDataData();

	factory UserDataData.fromJson(Map<String, dynamic> json) => $UserDataDataFromJson(json);

	Map<String, dynamic> toJson() => $UserDataDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class UserDataSupport {
	String? url = '';
	String? text = '';

	UserDataSupport();

	factory UserDataSupport.fromJson(Map<String, dynamic> json) => $UserDataSupportFromJson(json);

	Map<String, dynamic> toJson() => $UserDataSupportToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}