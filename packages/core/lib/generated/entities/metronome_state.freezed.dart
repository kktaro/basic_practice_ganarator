// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../src/entities/metronome_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MetronomeState {

 BPM get bpm; bool get isPlaying; double get volume; int get beatsPerMeasure; bool get accentFirstBeat;
/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetronomeStateCopyWith<MetronomeState> get copyWith => _$MetronomeStateCopyWithImpl<MetronomeState>(this as MetronomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetronomeState&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.beatsPerMeasure, beatsPerMeasure) || other.beatsPerMeasure == beatsPerMeasure)&&(identical(other.accentFirstBeat, accentFirstBeat) || other.accentFirstBeat == accentFirstBeat));
}


@override
int get hashCode => Object.hash(runtimeType,bpm,isPlaying,volume,beatsPerMeasure,accentFirstBeat);

@override
String toString() {
  return 'MetronomeState(bpm: $bpm, isPlaying: $isPlaying, volume: $volume, beatsPerMeasure: $beatsPerMeasure, accentFirstBeat: $accentFirstBeat)';
}


}

/// @nodoc
abstract mixin class $MetronomeStateCopyWith<$Res>  {
  factory $MetronomeStateCopyWith(MetronomeState value, $Res Function(MetronomeState) _then) = _$MetronomeStateCopyWithImpl;
@useResult
$Res call({
 BPM bpm, bool isPlaying, double volume, int beatsPerMeasure, bool accentFirstBeat
});




}
/// @nodoc
class _$MetronomeStateCopyWithImpl<$Res>
    implements $MetronomeStateCopyWith<$Res> {
  _$MetronomeStateCopyWithImpl(this._self, this._then);

  final MetronomeState _self;
  final $Res Function(MetronomeState) _then;

/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bpm = null,Object? isPlaying = null,Object? volume = null,Object? beatsPerMeasure = null,Object? accentFirstBeat = null,}) {
  return _then(_self.copyWith(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as BPM,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,beatsPerMeasure: null == beatsPerMeasure ? _self.beatsPerMeasure : beatsPerMeasure // ignore: cast_nullable_to_non_nullable
as int,accentFirstBeat: null == accentFirstBeat ? _self.accentFirstBeat : accentFirstBeat // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _MetronomeState extends MetronomeState {
   _MetronomeState({required this.bpm, required this.isPlaying, this.volume = 1.0, this.beatsPerMeasure = 4, this.accentFirstBeat = false}): super._();
  

@override final  BPM bpm;
@override final  bool isPlaying;
@override@JsonKey() final  double volume;
@override@JsonKey() final  int beatsPerMeasure;
@override@JsonKey() final  bool accentFirstBeat;

/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetronomeStateCopyWith<_MetronomeState> get copyWith => __$MetronomeStateCopyWithImpl<_MetronomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetronomeState&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.beatsPerMeasure, beatsPerMeasure) || other.beatsPerMeasure == beatsPerMeasure)&&(identical(other.accentFirstBeat, accentFirstBeat) || other.accentFirstBeat == accentFirstBeat));
}


@override
int get hashCode => Object.hash(runtimeType,bpm,isPlaying,volume,beatsPerMeasure,accentFirstBeat);

@override
String toString() {
  return 'MetronomeState(bpm: $bpm, isPlaying: $isPlaying, volume: $volume, beatsPerMeasure: $beatsPerMeasure, accentFirstBeat: $accentFirstBeat)';
}


}

/// @nodoc
abstract mixin class _$MetronomeStateCopyWith<$Res> implements $MetronomeStateCopyWith<$Res> {
  factory _$MetronomeStateCopyWith(_MetronomeState value, $Res Function(_MetronomeState) _then) = __$MetronomeStateCopyWithImpl;
@override @useResult
$Res call({
 BPM bpm, bool isPlaying, double volume, int beatsPerMeasure, bool accentFirstBeat
});




}
/// @nodoc
class __$MetronomeStateCopyWithImpl<$Res>
    implements _$MetronomeStateCopyWith<$Res> {
  __$MetronomeStateCopyWithImpl(this._self, this._then);

  final _MetronomeState _self;
  final $Res Function(_MetronomeState) _then;

/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bpm = null,Object? isPlaying = null,Object? volume = null,Object? beatsPerMeasure = null,Object? accentFirstBeat = null,}) {
  return _then(_MetronomeState(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as BPM,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,beatsPerMeasure: null == beatsPerMeasure ? _self.beatsPerMeasure : beatsPerMeasure // ignore: cast_nullable_to_non_nullable
as int,accentFirstBeat: null == accentFirstBeat ? _self.accentFirstBeat : accentFirstBeat // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
