import 'package:flutter_getx_sample/generated/json/base/json_field.dart';
import 'package:flutter_getx_sample/generated/json/post_entity.g.dart';
import 'dart:convert';
export 'package:flutter_getx_sample/generated/json/post_entity.g.dart';

@JsonSerializable()
class PostEntity {
	double? userId;
	double? id;
	String? title = '';
	String? body = '';

	PostEntity();

	factory PostEntity.fromJson(Map<String, dynamic> json) => $PostEntityFromJson(json);

	Map<String, dynamic> toJson() => $PostEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}