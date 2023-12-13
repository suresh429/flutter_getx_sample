import 'package:flutter_getx_sample/generated/json/base/json_convert_content.dart';
import 'package:flutter_getx_sample/data/models/post_entity.dart';

PostEntity $PostEntityFromJson(Map<String, dynamic> json) {
  final PostEntity postEntity = PostEntity();
  final double? userId = jsonConvert.convert<double>(json['userId']);
  if (userId != null) {
    postEntity.userId = userId;
  }
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    postEntity.id = id;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    postEntity.title = title;
  }
  final String? body = jsonConvert.convert<String>(json['body']);
  if (body != null) {
    postEntity.body = body;
  }
  return postEntity;
}

Map<String, dynamic> $PostEntityToJson(PostEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['userId'] = entity.userId;
  data['id'] = entity.id;
  data['title'] = entity.title;
  data['body'] = entity.body;
  return data;
}

extension PostEntityExtension on PostEntity {
  PostEntity copyWith({
    double? userId,
    double? id,
    String? title,
    String? body,
  }) {
    return PostEntity()
      ..userId = userId ?? this.userId
      ..id = id ?? this.id
      ..title = title ?? this.title
      ..body = body ?? this.body;
  }
}