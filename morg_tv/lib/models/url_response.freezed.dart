// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'url_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

URLResponse _$URLResponseFromJson(Map<String, dynamic> json) {
  return _URLResponse.fromJson(json);
}

/// @nodoc
mixin _$URLResponse {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $URLResponseCopyWith<URLResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $URLResponseCopyWith<$Res> {
  factory $URLResponseCopyWith(
          URLResponse value, $Res Function(URLResponse) then) =
      _$URLResponseCopyWithImpl<$Res, URLResponse>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$URLResponseCopyWithImpl<$Res, $Val extends URLResponse>
    implements $URLResponseCopyWith<$Res> {
  _$URLResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_URLResponseCopyWith<$Res>
    implements $URLResponseCopyWith<$Res> {
  factory _$$_URLResponseCopyWith(
          _$_URLResponse value, $Res Function(_$_URLResponse) then) =
      __$$_URLResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_URLResponseCopyWithImpl<$Res>
    extends _$URLResponseCopyWithImpl<$Res, _$_URLResponse>
    implements _$$_URLResponseCopyWith<$Res> {
  __$$_URLResponseCopyWithImpl(
      _$_URLResponse _value, $Res Function(_$_URLResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_URLResponse(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_URLResponse implements _URLResponse {
  const _$_URLResponse({required this.url});

  factory _$_URLResponse.fromJson(Map<String, dynamic> json) =>
      _$$_URLResponseFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'URLResponse(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_URLResponse &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_URLResponseCopyWith<_$_URLResponse> get copyWith =>
      __$$_URLResponseCopyWithImpl<_$_URLResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_URLResponseToJson(
      this,
    );
  }
}

abstract class _URLResponse implements URLResponse {
  const factory _URLResponse({required final String url}) = _$_URLResponse;

  factory _URLResponse.fromJson(Map<String, dynamic> json) =
      _$_URLResponse.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_URLResponseCopyWith<_$_URLResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
