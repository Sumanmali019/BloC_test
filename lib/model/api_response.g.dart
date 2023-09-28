// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


ApiEntry _$ApiEntryFromJson(Map<String, dynamic> json) => ApiEntry(
      API: json['API'] as String?,
      Description: json['Description'] as String?,
      Auth: json['Auth'] as String?,
      HTTPS: json['HTTPS'] as bool?,
      Cors: json['Cors'] as String?,
      Link: json['Link'] as String?,
      Category: json['Category'] as String?,
    );

Map<String, dynamic> _$ApiEntryToJson(ApiEntry instance) => <String, dynamic>{
      'API': instance.API,
      'Description': instance.Description,
      'Auth': instance.Auth,
      'HTTPS': instance.HTTPS,
      'Cors': instance.Cors,
      'Link': instance.Link,
      'Category': instance.Category,
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
