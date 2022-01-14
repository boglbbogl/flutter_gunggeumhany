// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kakao_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KakaoBook _$$_KakaoBookFromJson(Map<String, dynamic> json) => _$_KakaoBook(
      meta: KakaoBookMeta.fromJson(json['meta'] as Map<String, dynamic>),
      documents: (json['documents'] as List<dynamic>)
          .map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_KakaoBookToJson(_$_KakaoBook instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'documents': instance.documents,
    };

_$_KakaoBookMeta _$$_KakaoBookMetaFromJson(Map<String, dynamic> json) =>
    _$_KakaoBookMeta(
      isEnd: json['is_end'] as bool,
      pageableCount: json['pageable_count'] as int,
      totalCount: json['total_count'] as int,
    );

Map<String, dynamic> _$$_KakaoBookMetaToJson(_$_KakaoBookMeta instance) =>
    <String, dynamic>{
      'is_end': instance.isEnd,
      'pageable_count': instance.pageableCount,
      'total_count': instance.totalCount,
    };
