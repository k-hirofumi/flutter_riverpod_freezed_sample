// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_list_state_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostListStateResponse _$$_PostListStateResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PostListStateResponse(
      id: json['id'] as int,
      userId: json['userId'] as int,
      post: json['post'] as String,
    );

Map<String, dynamic> _$$_PostListStateResponseToJson(
        _$_PostListStateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'post': instance.post,
    };
