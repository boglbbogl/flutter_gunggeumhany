import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gunggeumhany/repository/core/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_service.freezed.dart';
part 'customer_service.g.dart';

@freezed
class CustomerService with _$CustomerService {
  const factory CustomerService({
    required String category,
    required String docKey,
    required String userKey,
    required String content,
    required String email,
    @TimestampConverter() required DateTime createdAt,
    required bool isComment,
    required String comment,
    @TimestampConverter() required DateTime commentCreatedAt,
  }) = _CustomerService;
  factory CustomerService.fromJson(Map<String, dynamic> json) =>
      _$CustomerServiceFromJson(json);
}
