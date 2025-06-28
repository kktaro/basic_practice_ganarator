// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../src/entities/metronome_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MetronomeSettings {
  int get defaultBpm => throw _privateConstructorUsedError;
  double get defaultVolume => throw _privateConstructorUsedError;
  int get defaultBeatsPerMeasure => throw _privateConstructorUsedError;
  bool get defaultAccentFirstBeat => throw _privateConstructorUsedError;

  /// Create a copy of MetronomeSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MetronomeSettingsCopyWith<MetronomeSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetronomeSettingsCopyWith<$Res> {
  factory $MetronomeSettingsCopyWith(
    MetronomeSettings value,
    $Res Function(MetronomeSettings) then,
  ) = _$MetronomeSettingsCopyWithImpl<$Res, MetronomeSettings>;
  @useResult
  $Res call({
    int defaultBpm,
    double defaultVolume,
    int defaultBeatsPerMeasure,
    bool defaultAccentFirstBeat,
  });
}

/// @nodoc
class _$MetronomeSettingsCopyWithImpl<$Res, $Val extends MetronomeSettings>
    implements $MetronomeSettingsCopyWith<$Res> {
  _$MetronomeSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MetronomeSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultBpm = null,
    Object? defaultVolume = null,
    Object? defaultBeatsPerMeasure = null,
    Object? defaultAccentFirstBeat = null,
  }) {
    return _then(
      _value.copyWith(
            defaultBpm: null == defaultBpm
                ? _value.defaultBpm
                : defaultBpm // ignore: cast_nullable_to_non_nullable
                      as int,
            defaultVolume: null == defaultVolume
                ? _value.defaultVolume
                : defaultVolume // ignore: cast_nullable_to_non_nullable
                      as double,
            defaultBeatsPerMeasure: null == defaultBeatsPerMeasure
                ? _value.defaultBeatsPerMeasure
                : defaultBeatsPerMeasure // ignore: cast_nullable_to_non_nullable
                      as int,
            defaultAccentFirstBeat: null == defaultAccentFirstBeat
                ? _value.defaultAccentFirstBeat
                : defaultAccentFirstBeat // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MetronomeSettingsImplCopyWith<$Res>
    implements $MetronomeSettingsCopyWith<$Res> {
  factory _$$MetronomeSettingsImplCopyWith(
    _$MetronomeSettingsImpl value,
    $Res Function(_$MetronomeSettingsImpl) then,
  ) = __$$MetronomeSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int defaultBpm,
    double defaultVolume,
    int defaultBeatsPerMeasure,
    bool defaultAccentFirstBeat,
  });
}

/// @nodoc
class __$$MetronomeSettingsImplCopyWithImpl<$Res>
    extends _$MetronomeSettingsCopyWithImpl<$Res, _$MetronomeSettingsImpl>
    implements _$$MetronomeSettingsImplCopyWith<$Res> {
  __$$MetronomeSettingsImplCopyWithImpl(
    _$MetronomeSettingsImpl _value,
    $Res Function(_$MetronomeSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MetronomeSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? defaultBpm = null,
    Object? defaultVolume = null,
    Object? defaultBeatsPerMeasure = null,
    Object? defaultAccentFirstBeat = null,
  }) {
    return _then(
      _$MetronomeSettingsImpl(
        defaultBpm: null == defaultBpm
            ? _value.defaultBpm
            : defaultBpm // ignore: cast_nullable_to_non_nullable
                  as int,
        defaultVolume: null == defaultVolume
            ? _value.defaultVolume
            : defaultVolume // ignore: cast_nullable_to_non_nullable
                  as double,
        defaultBeatsPerMeasure: null == defaultBeatsPerMeasure
            ? _value.defaultBeatsPerMeasure
            : defaultBeatsPerMeasure // ignore: cast_nullable_to_non_nullable
                  as int,
        defaultAccentFirstBeat: null == defaultAccentFirstBeat
            ? _value.defaultAccentFirstBeat
            : defaultAccentFirstBeat // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$MetronomeSettingsImpl extends _MetronomeSettings {
  const _$MetronomeSettingsImpl({
    this.defaultBpm = 120,
    this.defaultVolume = 1.0,
    this.defaultBeatsPerMeasure = 4,
    this.defaultAccentFirstBeat = true,
  }) : super._();

  @override
  @JsonKey()
  final int defaultBpm;
  @override
  @JsonKey()
  final double defaultVolume;
  @override
  @JsonKey()
  final int defaultBeatsPerMeasure;
  @override
  @JsonKey()
  final bool defaultAccentFirstBeat;

  @override
  String toString() {
    return 'MetronomeSettings(defaultBpm: $defaultBpm, defaultVolume: $defaultVolume, defaultBeatsPerMeasure: $defaultBeatsPerMeasure, defaultAccentFirstBeat: $defaultAccentFirstBeat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetronomeSettingsImpl &&
            (identical(other.defaultBpm, defaultBpm) ||
                other.defaultBpm == defaultBpm) &&
            (identical(other.defaultVolume, defaultVolume) ||
                other.defaultVolume == defaultVolume) &&
            (identical(other.defaultBeatsPerMeasure, defaultBeatsPerMeasure) ||
                other.defaultBeatsPerMeasure == defaultBeatsPerMeasure) &&
            (identical(other.defaultAccentFirstBeat, defaultAccentFirstBeat) ||
                other.defaultAccentFirstBeat == defaultAccentFirstBeat));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    defaultBpm,
    defaultVolume,
    defaultBeatsPerMeasure,
    defaultAccentFirstBeat,
  );

  /// Create a copy of MetronomeSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MetronomeSettingsImplCopyWith<_$MetronomeSettingsImpl> get copyWith =>
      __$$MetronomeSettingsImplCopyWithImpl<_$MetronomeSettingsImpl>(
        this,
        _$identity,
      );
}

abstract class _MetronomeSettings extends MetronomeSettings {
  const factory _MetronomeSettings({
    final int defaultBpm,
    final double defaultVolume,
    final int defaultBeatsPerMeasure,
    final bool defaultAccentFirstBeat,
  }) = _$MetronomeSettingsImpl;
  const _MetronomeSettings._() : super._();

  @override
  int get defaultBpm;
  @override
  double get defaultVolume;
  @override
  int get defaultBeatsPerMeasure;
  @override
  bool get defaultAccentFirstBeat;

  /// Create a copy of MetronomeSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MetronomeSettingsImplCopyWith<_$MetronomeSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
