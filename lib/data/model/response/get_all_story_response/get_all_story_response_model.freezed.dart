// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_story_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetAllStoryResponseModel _$GetAllStoryResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetAllStoryResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetAllStoryResponseModel {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'listStory')
  List<ListStory>? get listStory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAllStoryResponseModelCopyWith<GetAllStoryResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllStoryResponseModelCopyWith<$Res> {
  factory $GetAllStoryResponseModelCopyWith(GetAllStoryResponseModel value,
          $Res Function(GetAllStoryResponseModel) then) =
      _$GetAllStoryResponseModelCopyWithImpl<$Res, GetAllStoryResponseModel>;
  @useResult
  $Res call(
      {bool? error,
      String? message,
      @JsonKey(name: 'listStory') List<ListStory>? listStory});
}

/// @nodoc
class _$GetAllStoryResponseModelCopyWithImpl<$Res,
        $Val extends GetAllStoryResponseModel>
    implements $GetAllStoryResponseModelCopyWith<$Res> {
  _$GetAllStoryResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? listStory = freezed,
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
      listStory: freezed == listStory
          ? _value.listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<ListStory>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAllStoryResponseModelImplCopyWith<$Res>
    implements $GetAllStoryResponseModelCopyWith<$Res> {
  factory _$$GetAllStoryResponseModelImplCopyWith(
          _$GetAllStoryResponseModelImpl value,
          $Res Function(_$GetAllStoryResponseModelImpl) then) =
      __$$GetAllStoryResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? error,
      String? message,
      @JsonKey(name: 'listStory') List<ListStory>? listStory});
}

/// @nodoc
class __$$GetAllStoryResponseModelImplCopyWithImpl<$Res>
    extends _$GetAllStoryResponseModelCopyWithImpl<$Res,
        _$GetAllStoryResponseModelImpl>
    implements _$$GetAllStoryResponseModelImplCopyWith<$Res> {
  __$$GetAllStoryResponseModelImplCopyWithImpl(
      _$GetAllStoryResponseModelImpl _value,
      $Res Function(_$GetAllStoryResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? listStory = freezed,
  }) {
    return _then(_$GetAllStoryResponseModelImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      listStory: freezed == listStory
          ? _value._listStory
          : listStory // ignore: cast_nullable_to_non_nullable
              as List<ListStory>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAllStoryResponseModelImpl implements _GetAllStoryResponseModel {
  const _$GetAllStoryResponseModelImpl(
      {this.error,
      this.message,
      @JsonKey(name: 'listStory') final List<ListStory>? listStory})
      : _listStory = listStory;

  factory _$GetAllStoryResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAllStoryResponseModelImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;
  final List<ListStory>? _listStory;
  @override
  @JsonKey(name: 'listStory')
  List<ListStory>? get listStory {
    final value = _listStory;
    if (value == null) return null;
    if (_listStory is EqualUnmodifiableListView) return _listStory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetAllStoryResponseModel(error: $error, message: $message, listStory: $listStory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllStoryResponseModelImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listStory, _listStory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message,
      const DeepCollectionEquality().hash(_listStory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllStoryResponseModelImplCopyWith<_$GetAllStoryResponseModelImpl>
      get copyWith => __$$GetAllStoryResponseModelImplCopyWithImpl<
          _$GetAllStoryResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAllStoryResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GetAllStoryResponseModel implements GetAllStoryResponseModel {
  const factory _GetAllStoryResponseModel(
          {final bool? error,
          final String? message,
          @JsonKey(name: 'listStory') final List<ListStory>? listStory}) =
      _$GetAllStoryResponseModelImpl;

  factory _GetAllStoryResponseModel.fromJson(Map<String, dynamic> json) =
      _$GetAllStoryResponseModelImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  @JsonKey(name: 'listStory')
  List<ListStory>? get listStory;
  @override
  @JsonKey(ignore: true)
  _$$GetAllStoryResponseModelImplCopyWith<_$GetAllStoryResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
