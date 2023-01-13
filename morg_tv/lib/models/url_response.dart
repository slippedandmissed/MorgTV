import 'package:freezed_annotation/freezed_annotation.dart';

part 'url_response.freezed.dart';
part 'url_response.g.dart';

@freezed
class URLResponse with _$URLResponse {
  const factory URLResponse({
    required String url,
  }) = _URLResponse;

  factory URLResponse.fromJson(Map<String, Object?> json) =>
      _$URLResponseFromJson(json);
}
