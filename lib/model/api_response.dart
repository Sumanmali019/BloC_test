import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_response.freezed.dart';
part 'api_response.g.dart';

@JsonSerializable()
@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required int count,
    required List<ApiEntry> entries,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

@JsonSerializable()
class ApiEntry {
  String? api;
  String? description;
  String? auth;
  bool? hTTPS;
  String? cors;
  String? link;
  String? category;

  ApiEntry({
     this.api,
     this.description,
     this.auth,
     this.hTTPS,
     this.cors,
     this.link,
     this.category,
  });

  factory ApiEntry.fromJson(Map<String, dynamic> json) =>
      _$ApiEntryFromJson(json);
}
