// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


ApiEntry _$ApiEntryFromJson(Map<String, dynamic> json) => ApiEntry(
      api: json['API'] as String?,
      description: json['Description'] as String?,
      auth: json['Auth'] as String?,
      hTTPS: json['HTTPS'] as bool?,
      cors: json['Cors'] as String?,
      link: json['Link'] as String?,
      category: json['Category'] as String?,
    );

Map<String, dynamic> _$ApiEntryToJson(ApiEntry instance) => <String, dynamic>{
      'API': instance.api,
      'Description': instance.description,
      'Auth': instance.auth,
      'HTTPS': instance.hTTPS,
      'Cors': instance.cors,
      'Link': instance.link,
      'Category': instance.category,
    };

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      count: json['count'] as int,
      entries: (json['entries'] as List<dynamic>)
          .map((e) => ApiEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'entries': instance.entries,
    };
