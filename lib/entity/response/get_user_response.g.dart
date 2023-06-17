// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetUserResponse _$$_GetUserResponseFromJson(Map<String, dynamic> json) =>
    _$_GetUserResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      userItems: (json['userItems'] as List<dynamic>?)
              ?.map((e) => UserItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      email: json['email'] as String? ?? "",
    );

Map<String, dynamic> _$$_GetUserResponseToJson(_$_GetUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userItems': instance.userItems,
      'email': instance.email,
    };

_$_UserItem _$$_UserItemFromJson(Map<String, dynamic> json) => _$_UserItem(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      startAt: json['startAt'] as String?,
      endAt: json['endAt'] as String?,
    );

Map<String, dynamic> _$$_UserItemToJson(_$_UserItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
    };
