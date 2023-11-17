// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_detail_story_detail_story.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetDetailStoryResponseModel _$GetDetailStoryResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetDetailStoryResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetDetailStoryResponseModel {
  bool? get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'story')
  StoryGetDetail? get story => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetDetailStoryResponseModelCopyWith<GetDetailStoryResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetDetailStoryResponseModelCopyWith<$Res> {
  factory $GetDetailStoryResponseModelCopyWith(
          GetDetailStoryResponseModel value,
          $Res Function(GetDetailStoryResponseModel) then) =
      _$GetDetailStoryResponseModelCopyWithImpl<$Res,
          GetDetailStoryResponseModel>;
  @useResult
  $Res call(
      {bool? error,
      String? message,
      @JsonKey(name: 'story') StoryGetDetail? story});

  $StoryGetDetailCopyWith<$Res>? get story;
}

/// @nodoc
class _$GetDetailStoryResponseModelCopyWithImpl<$Res,
        $Val extends GetDetailStoryResponseModel>
    implements $GetDetailStoryResponseModelCopyWith<$Res> {
  _$GetDetailStoryResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? story = freezed,
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
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryGetDetail?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StoryGetDetailCopyWith<$Res>? get story {
    if (_value.story == null) {
      return null;
    }

    return $StoryGetDetailCopyWith<$Res>(_value.story!, (value) {
      return _then(_value.copyWith(story: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetDetailStoryResponseModelImplCopyWith<$Res>
    implements $GetDetailStoryResponseModelCopyWith<$Res> {
  factory _$$GetDetailStoryResponseModelImplCopyWith(
          _$GetDetailStoryResponseModelImpl value,
          $Res Function(_$GetDetailStoryResponseModelImpl) then) =
      __$$GetDetailStoryResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? error,
      String? message,
      @JsonKey(name: 'story') StoryGetDetail? story});

  @override
  $StoryGetDetailCopyWith<$Res>? get story;
}

/// @nodoc
class __$$GetDetailStoryResponseModelImplCopyWithImpl<$Res>
    extends _$GetDetailStoryResponseModelCopyWithImpl<$Res,
        _$GetDetailStoryResponseModelImpl>
    implements _$$GetDetailStoryResponseModelImplCopyWith<$Res> {
  __$$GetDetailStoryResponseModelImplCopyWithImpl(
      _$GetDetailStoryResponseModelImpl _value,
      $Res Function(_$GetDetailStoryResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? message = freezed,
    Object? story = freezed,
  }) {
    return _then(_$GetDetailStoryResponseModelImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      story: freezed == story
          ? _value.story
          : story // ignore: cast_nullable_to_non_nullable
              as StoryGetDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetDetailStoryResponseModelImpl
    implements _GetDetailStoryResponseModel {
  const _$GetDetailStoryResponseModelImpl(
      {this.error, this.message, @JsonKey(name: 'story') this.story});

  factory _$GetDetailStoryResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetDetailStoryResponseModelImplFromJson(json);

  @override
  final bool? error;
  @override
  final String? message;
  @override
  @JsonKey(name: 'story')
  final StoryGetDetail? story;

  @override
  String toString() {
    return 'GetDetailStoryResponseModel(error: $error, message: $message, story: $story)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailStoryResponseModelImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.story, story) || other.story == story));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, story);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailStoryResponseModelImplCopyWith<_$GetDetailStoryResponseModelImpl>
      get copyWith => __$$GetDetailStoryResponseModelImplCopyWithImpl<
          _$GetDetailStoryResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetDetailStoryResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GetDetailStoryResponseModel
    implements GetDetailStoryResponseModel {
  const factory _GetDetailStoryResponseModel(
          {final bool? error,
          final String? message,
          @JsonKey(name: 'story') final StoryGetDetail? story}) =
      _$GetDetailStoryResponseModelImpl;

  factory _GetDetailStoryResponseModel.fromJson(Map<String, dynamic> json) =
      _$GetDetailStoryResponseModelImpl.fromJson;

  @override
  bool? get error;
  @override
  String? get message;
  @override
  @JsonKey(name: 'story')
  StoryGetDetail? get story;
  @override
  @JsonKey(ignore: true)
  _$$GetDetailStoryResponseModelImplCopyWith<_$GetDetailStoryResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
