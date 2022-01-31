// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerService _$$_CustomerServiceFromJson(Map<String, dynamic> json) =>
    _$_CustomerService(
      category: json['category'] as String,
      docKey: json['docKey'] as String,
      userKey: json['userKey'] as String,
      content: json['content'] as String,
      email: json['email'] as String,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      isComment: json['isComment'] as bool,
      comment: json['comment'] as String,
      commentCreatedAt: const TimestampConverter()
          .fromJson(json['commentCreatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$_CustomerServiceToJson(_$_CustomerService instance) =>
    <String, dynamic>{
      'category': instance.category,
      'docKey': instance.docKey,
      'userKey': instance.userKey,
      'content': instance.content,
      'email': instance.email,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'isComment': instance.isComment,
      'comment': instance.comment,
      'commentCreatedAt':
          const TimestampConverter().toJson(instance.commentCreatedAt),
    };
