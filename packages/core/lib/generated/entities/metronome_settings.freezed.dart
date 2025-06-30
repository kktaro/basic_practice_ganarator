// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../src/entities/metronome_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MetronomeSettings {

 int get defaultBpm; double get defaultVolume; int get defaultBeatsPerMeasure; bool get defaultAccentFirstBeat;
/// Create a copy of MetronomeSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetronomeSettingsCopyWith<MetronomeSettings> get copyWith => _$MetronomeSettingsCopyWithImpl<MetronomeSettings>(this as MetronomeSettings, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetronomeSettings&&(identical(other.defaultBpm, defaultBpm) || other.defaultBpm == defaultBpm)&&(identical(other.defaultVolume, defaultVolume) || other.defaultVolume == defaultVolume)&&(identical(other.defaultBeatsPerMeasure, defaultBeatsPerMeasure) || other.defaultBeatsPerMeasure == defaultBeatsPerMeasure)&&(identical(other.defaultAccentFirstBeat, defaultAccentFirstBeat) || other.defaultAccentFirstBeat == defaultAccentFirstBeat));
}


@override
int get hashCode => Object.hash(runtimeType,defaultBpm,defaultVolume,defaultBeatsPerMeasure,defaultAccentFirstBeat);

@override
String toString() {
  return 'MetronomeSettings(defaultBpm: $defaultBpm, defaultVolume: $defaultVolume, defaultBeatsPerMeasure: $defaultBeatsPerMeasure, defaultAccentFirstBeat: $defaultAccentFirstBeat)';
}


}

/// @nodoc
abstract mixin class $MetronomeSettingsCopyWith<$Res>  {
  factory $MetronomeSettingsCopyWith(MetronomeSettings value, $Res Function(MetronomeSettings) _then) = _$MetronomeSettingsCopyWithImpl;
@useResult
$Res call({
 int defaultBpm, double defaultVolume, int defaultBeatsPerMeasure, bool defaultAccentFirstBeat
});




}
/// @nodoc
class _$MetronomeSettingsCopyWithImpl<$Res>
    implements $MetronomeSettingsCopyWith<$Res> {
  _$MetronomeSettingsCopyWithImpl(this._self, this._then);

  final MetronomeSettings _self;
  final $Res Function(MetronomeSettings) _then;

/// Create a copy of MetronomeSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? defaultBpm = null,Object? defaultVolume = null,Object? defaultBeatsPerMeasure = null,Object? defaultAccentFirstBeat = null,}) {
  return _then(_self.copyWith(
defaultBpm: null == defaultBpm ? _self.defaultBpm : defaultBpm // ignore: cast_nullable_to_non_nullable
as int,defaultVolume: null == defaultVolume ? _self.defaultVolume : defaultVolume // ignore: cast_nullable_to_non_nullable
as double,defaultBeatsPerMeasure: null == defaultBeatsPerMeasure ? _self.defaultBeatsPerMeasure : defaultBeatsPerMeasure // ignore: cast_nullable_to_non_nullable
as int,defaultAccentFirstBeat: null == defaultAccentFirstBeat ? _self.defaultAccentFirstBeat : defaultAccentFirstBeat // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _MetronomeSettings extends MetronomeSettings {
   _MetronomeSettings({this.defaultBpm = 120, this.defaultVolume = 1.0, this.defaultBeatsPerMeasure = 4, this.defaultAccentFirstBeat = true}): super._();
  

@override@JsonKey() final  int defaultBpm;
@override@JsonKey() final  double defaultVolume;
@override@JsonKey() final  int defaultBeatsPerMeasure;
@override@JsonKey() final  bool defaultAccentFirstBeat;

/// Create a copy of MetronomeSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetronomeSettingsCopyWith<_MetronomeSettings> get copyWith => __$MetronomeSettingsCopyWithImpl<_MetronomeSettings>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetronomeSettings&&(identical(other.defaultBpm, defaultBpm) || other.defaultBpm == defaultBpm)&&(identical(other.defaultVolume, defaultVolume) || other.defaultVolume == defaultVolume)&&(identical(other.defaultBeatsPerMeasure, defaultBeatsPerMeasure) || other.defaultBeatsPerMeasure == defaultBeatsPerMeasure)&&(identical(other.defaultAccentFirstBeat, defaultAccentFirstBeat) || other.defaultAccentFirstBeat == defaultAccentFirstBeat));
}


@override
int get hashCode => Object.hash(runtimeType,defaultBpm,defaultVolume,defaultBeatsPerMeasure,defaultAccentFirstBeat);

@override
String toString() {
  return 'MetronomeSettings(defaultBpm: $defaultBpm, defaultVolume: $defaultVolume, defaultBeatsPerMeasure: $defaultBeatsPerMeasure, defaultAccentFirstBeat: $defaultAccentFirstBeat)';
}


}

/// @nodoc
abstract mixin class _$MetronomeSettingsCopyWith<$Res> implements $MetronomeSettingsCopyWith<$Res> {
  factory _$MetronomeSettingsCopyWith(_MetronomeSettings value, $Res Function(_MetronomeSettings) _then) = __$MetronomeSettingsCopyWithImpl;
@override @useResult
$Res call({
 int defaultBpm, double defaultVolume, int defaultBeatsPerMeasure, bool defaultAccentFirstBeat
});




}
/// @nodoc
class __$MetronomeSettingsCopyWithImpl<$Res>
    implements _$MetronomeSettingsCopyWith<$Res> {
  __$MetronomeSettingsCopyWithImpl(this._self, this._then);

  final _MetronomeSettings _self;
  final $Res Function(_MetronomeSettings) _then;

/// Create a copy of MetronomeSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? defaultBpm = null,Object? defaultVolume = null,Object? defaultBeatsPerMeasure = null,Object? defaultAccentFirstBeat = null,}) {
  return _then(_MetronomeSettings(
defaultBpm: null == defaultBpm ? _self.defaultBpm : defaultBpm // ignore: cast_nullable_to_non_nullable
as int,defaultVolume: null == defaultVolume ? _self.defaultVolume : defaultVolume // ignore: cast_nullable_to_non_nullable
as double,defaultBeatsPerMeasure: null == defaultBeatsPerMeasure ? _self.defaultBeatsPerMeasure : defaultBeatsPerMeasure // ignore: cast_nullable_to_non_nullable
as int,defaultAccentFirstBeat: null == defaultAccentFirstBeat ? _self.defaultAccentFirstBeat : defaultAccentFirstBeat // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
