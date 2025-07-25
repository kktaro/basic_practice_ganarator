// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metronome_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MetronomeState {

 int get bpm; bool get isPlaying; int get currentBeat;/// 拍子の分子（例: 3/4拍子なら3）
 int get timeSignatureNumerator;/// 拍子の分母（例: 3/4拍子なら4）
 int get timeSignatureDenominator;
/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetronomeStateCopyWith<MetronomeState> get copyWith => _$MetronomeStateCopyWithImpl<MetronomeState>(this as MetronomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetronomeState&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.currentBeat, currentBeat) || other.currentBeat == currentBeat)&&(identical(other.timeSignatureNumerator, timeSignatureNumerator) || other.timeSignatureNumerator == timeSignatureNumerator)&&(identical(other.timeSignatureDenominator, timeSignatureDenominator) || other.timeSignatureDenominator == timeSignatureDenominator));
}


@override
int get hashCode => Object.hash(runtimeType,bpm,isPlaying,currentBeat,timeSignatureNumerator,timeSignatureDenominator);

@override
String toString() {
  return 'MetronomeState(bpm: $bpm, isPlaying: $isPlaying, currentBeat: $currentBeat, timeSignatureNumerator: $timeSignatureNumerator, timeSignatureDenominator: $timeSignatureDenominator)';
}


}

/// @nodoc
abstract mixin class $MetronomeStateCopyWith<$Res>  {
  factory $MetronomeStateCopyWith(MetronomeState value, $Res Function(MetronomeState) _then) = _$MetronomeStateCopyWithImpl;
@useResult
$Res call({
 int bpm, bool isPlaying, int currentBeat, int timeSignatureNumerator, int timeSignatureDenominator
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
@pragma('vm:prefer-inline') @override $Res call({Object? bpm = null,Object? isPlaying = null,Object? currentBeat = null,Object? timeSignatureNumerator = null,Object? timeSignatureDenominator = null,}) {
  return _then(_self.copyWith(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,currentBeat: null == currentBeat ? _self.currentBeat : currentBeat // ignore: cast_nullable_to_non_nullable
as int,timeSignatureNumerator: null == timeSignatureNumerator ? _self.timeSignatureNumerator : timeSignatureNumerator // ignore: cast_nullable_to_non_nullable
as int,timeSignatureDenominator: null == timeSignatureDenominator ? _self.timeSignatureDenominator : timeSignatureDenominator // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MetronomeState].
extension MetronomeStatePatterns on MetronomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetronomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetronomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetronomeState value)  $default,){
final _that = this;
switch (_that) {
case _MetronomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetronomeState value)?  $default,){
final _that = this;
switch (_that) {
case _MetronomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int bpm,  bool isPlaying,  int currentBeat,  int timeSignatureNumerator,  int timeSignatureDenominator)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetronomeState() when $default != null:
return $default(_that.bpm,_that.isPlaying,_that.currentBeat,_that.timeSignatureNumerator,_that.timeSignatureDenominator);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int bpm,  bool isPlaying,  int currentBeat,  int timeSignatureNumerator,  int timeSignatureDenominator)  $default,) {final _that = this;
switch (_that) {
case _MetronomeState():
return $default(_that.bpm,_that.isPlaying,_that.currentBeat,_that.timeSignatureNumerator,_that.timeSignatureDenominator);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int bpm,  bool isPlaying,  int currentBeat,  int timeSignatureNumerator,  int timeSignatureDenominator)?  $default,) {final _that = this;
switch (_that) {
case _MetronomeState() when $default != null:
return $default(_that.bpm,_that.isPlaying,_that.currentBeat,_that.timeSignatureNumerator,_that.timeSignatureDenominator);case _:
  return null;

}
}

}

/// @nodoc


class _MetronomeState extends MetronomeState {
  const _MetronomeState({this.bpm = 120, this.isPlaying = false, this.currentBeat = 1, this.timeSignatureNumerator = 4, this.timeSignatureDenominator = 4}): super._();
  

@override@JsonKey() final  int bpm;
@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  int currentBeat;
/// 拍子の分子（例: 3/4拍子なら3）
@override@JsonKey() final  int timeSignatureNumerator;
/// 拍子の分母（例: 3/4拍子なら4）
@override@JsonKey() final  int timeSignatureDenominator;

/// Create a copy of MetronomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetronomeStateCopyWith<_MetronomeState> get copyWith => __$MetronomeStateCopyWithImpl<_MetronomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetronomeState&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.currentBeat, currentBeat) || other.currentBeat == currentBeat)&&(identical(other.timeSignatureNumerator, timeSignatureNumerator) || other.timeSignatureNumerator == timeSignatureNumerator)&&(identical(other.timeSignatureDenominator, timeSignatureDenominator) || other.timeSignatureDenominator == timeSignatureDenominator));
}


@override
int get hashCode => Object.hash(runtimeType,bpm,isPlaying,currentBeat,timeSignatureNumerator,timeSignatureDenominator);

@override
String toString() {
  return 'MetronomeState(bpm: $bpm, isPlaying: $isPlaying, currentBeat: $currentBeat, timeSignatureNumerator: $timeSignatureNumerator, timeSignatureDenominator: $timeSignatureDenominator)';
}


}

/// @nodoc
abstract mixin class _$MetronomeStateCopyWith<$Res> implements $MetronomeStateCopyWith<$Res> {
  factory _$MetronomeStateCopyWith(_MetronomeState value, $Res Function(_MetronomeState) _then) = __$MetronomeStateCopyWithImpl;
@override @useResult
$Res call({
 int bpm, bool isPlaying, int currentBeat, int timeSignatureNumerator, int timeSignatureDenominator
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
@override @pragma('vm:prefer-inline') $Res call({Object? bpm = null,Object? isPlaying = null,Object? currentBeat = null,Object? timeSignatureNumerator = null,Object? timeSignatureDenominator = null,}) {
  return _then(_MetronomeState(
bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,currentBeat: null == currentBeat ? _self.currentBeat : currentBeat // ignore: cast_nullable_to_non_nullable
as int,timeSignatureNumerator: null == timeSignatureNumerator ? _self.timeSignatureNumerator : timeSignatureNumerator // ignore: cast_nullable_to_non_nullable
as int,timeSignatureDenominator: null == timeSignatureDenominator ? _self.timeSignatureDenominator : timeSignatureDenominator // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
