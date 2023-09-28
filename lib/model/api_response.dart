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
  String? API;
  String? Description;
  String? Auth;
  bool? HTTPS;
  String? Cors;
  String? Link;
  String? Category;

  ApiEntry({
     this.API,
     this.Description,
     this.Auth,
     this.HTTPS,
     this.Cors,
     this.Link,
     this.Category,
  });

  factory ApiEntry.fromJson(Map<String, dynamic> json) =>
      _$ApiEntryFromJson(json);
}
