// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddStoryResponseModel _$AddStoryResponseModelFromJson(
    Map<String, dynamic> json) {
  return _AddStoryResponseModel.fromJson(json);
}

/// @nodoc
mixin _$AddStoryResponseModel {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddStoryResponseModelCopyWith<AddStoryResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryResponseModelCopyWith<$Res> {
  factory $AddStoryResponseModelCopyWith(AddStoryResponseModel value,
          $Res Function(AddStoryResponseModel) then) =
      _$AddStoryResponseModelCopyWithImpl<$Res, AddStoryResponseModel>;
  @useResult
  $Res call({bool? error, String? message});
}

/// @nodoc
class _$AddStoryResponseModelCopyWithImpl<$Res,
        $Val extends AddStoryResponseModel>
    implements $AddStoryResponseModelCopyWith<$Res> {
  _$AddStoryResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStoryResponseModelImplCopyWith<$Res>
    implements $AddStoryResponseModelCopyWith<$Res> {
  factory _$$AddStoryResponseModelImplCopyWith(
          _$AddStoryResponseModelImpl value,
          $Res Function(_$AddStoryResponseModelImpl) then) =
      __$$AddStoryResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? error, String? message});
}

/// @nodoc
class __$$AddStoryResponseModelImplCopyWithImpl<$Res>
    extends _$AddStoryResponseModelCopyWithImpl<$Res,
        _$AddStoryResponseModelImpl>
    implements _$$AddStoryResponseModelImplCopyWith<$Res> {
  __$$AddStoryResponseModelImplCopyWithImpl(_$AddStoryResponseModelImpl _value,
      $Res Function(_$AddStoryResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_$AddStoryResponseModelImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddStoryResponseModelImpl implements _AddStoryResponseModel {
  const _$AddStoryResponseModelImpl({this.error, this.message});

  factory _$AddStoryResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddStoryResponseModelImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;

  @override
  String toString() {
    return 'AddStoryResponseModel(error: $error, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoryResponseModelImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoryResponseModelImplCopyWith<_$AddStoryResponseModelImpl>
      get copyWith => __$$AddStoryResponseModelImplCopyWithImpl<
          _$AddStoryResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddStoryResponseModelImplToJson(
      this,
    );
  }
}

abstract class _AddStoryResponseModel implements AddStoryResponseModel {
  const factory _AddStoryResponseModel(
      {final bool? error, final String? message}) = _$AddStoryResponseModelImpl;

  factory _AddStoryResponseModel.fromJson(Map<String, dynamic> json) =
      _$AddStoryResponseModelImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$AddStoryResponseModelImplCopyWith<_$AddStoryResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
