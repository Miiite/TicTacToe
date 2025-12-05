// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ResultState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultState()';
}


}

/// @nodoc
class $ResultStateCopyWith<$Res>  {
$ResultStateCopyWith(ResultState _, $Res Function(ResultState) __);
}


/// Adds pattern-matching-related methods to [ResultState].
extension ResultStatePatterns on ResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Result value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Result() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Result value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Result():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Result value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Result() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( GameResult? result,  GameScore score)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Result() when success != null:
return success(_that.result,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( GameResult? result,  GameScore score)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Result():
return success(_that.result,_that.score);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( GameResult? result,  GameScore score)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Result() when success != null:
return success(_that.result,_that.score);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ResultState {
   _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ResultState.initial()';
}


}




/// @nodoc


class _Result implements ResultState {
   _Result({this.result, required this.score});
  

 final  GameResult? result;
 final  GameScore score;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultCopyWith<_Result> get copyWith => __$ResultCopyWithImpl<_Result>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Result&&(identical(other.result, result) || other.result == result)&&(identical(other.score, score) || other.score == score));
}


@override
int get hashCode => Object.hash(runtimeType,result,score);

@override
String toString() {
  return 'ResultState.success(result: $result, score: $score)';
}


}

/// @nodoc
abstract mixin class _$ResultCopyWith<$Res> implements $ResultStateCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) _then) = __$ResultCopyWithImpl;
@useResult
$Res call({
 GameResult? result, GameScore score
});


$GameResultCopyWith<$Res>? get result;$GameScoreCopyWith<$Res> get score;

}
/// @nodoc
class __$ResultCopyWithImpl<$Res>
    implements _$ResultCopyWith<$Res> {
  __$ResultCopyWithImpl(this._self, this._then);

  final _Result _self;
  final $Res Function(_Result) _then;

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = freezed,Object? score = null,}) {
  return _then(_Result(
result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as GameResult?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as GameScore,
  ));
}

/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $GameResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of ResultState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameScoreCopyWith<$Res> get score {
  
  return $GameScoreCopyWith<$Res>(_self.score, (value) {
    return _then(_self.copyWith(score: value));
  });
}
}

// dart format on
