import 'package:freezed_annotation/freezed_annotation.dart';

part 'beat.freezed.dart';
part 'beat.g.dart';

@freezed
class Beat with _$Beat {
  const factory Beat({
    required String beat,
  }) = _Beat;

  factory Beat.fromJson(Map<String, Object?> json) => _$BeatFromJson(json);
}
