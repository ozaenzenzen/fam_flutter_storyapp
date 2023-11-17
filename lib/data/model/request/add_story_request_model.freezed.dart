// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddStoryRequestModel _$AddStoryRequestModelFromJson(Map<String, dynamic> json) {
  return _AddStoryRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AddStoryRequestModel {
// @JsonKey(name: 'description') required String description,
// @JsonKey(name: 'photo') required File photo,
// @JsonKey(name: 'lat') double? lat,
// @JsonKey(name: 'lon') double? lon,
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo', fromJson: fileFromJson, toJson: fileToJson)
  File get photo => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddStoryRequestModelCopyWith<AddStoryRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryRequestModelCopyWith<$Res> {
  factory $AddStoryRequestModelCopyWith(AddStoryRequestModel value,
          $Res Function(AddStoryRequestModel) then) =
      _$AddStoryRequestModelCopyWithImpl<$Res, AddStoryRequestModel>;
  @useResult
  $Res call(
      {String description,
      @JsonKey(name: 'photo', fromJson: fileFromJson, toJson: fileToJson)
      File photo,
      double? lat,
      double? lon});
}

/// @nodoc
class _$AddStoryRequestModelCopyWithImpl<$Res,
        $Val extends AddStoryRequestModel>
    implements $AddStoryRequestModelCopyWith<$Res> {
  _$AddStoryRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? photo = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStoryRequestModelImplCopyWith<$Res>
    implements $AddStoryRequestModelCopyWith<$Res> {
  factory _$$AddStoryRequestModelImplCopyWith(_$AddStoryRequestModelImpl value,
          $Res Function(_$AddStoryRequestModelImpl) then) =
      __$$AddStoryRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      @JsonKey(name: 'photo', fromJson: fileFromJson, toJson: fileToJson)
      File photo,
      double? lat,
      double? lon});
}

/// @nodoc
class __$$AddStoryRequestModelImplCopyWithImpl<$Res>
    extends _$AddStoryRequestModelCopyWithImpl<$Res, _$AddStoryRequestModelImpl>
    implements _$$AddStoryRequestModelImplCopyWith<$Res> {
  __$$AddStoryRequestModelImplCopyWithImpl(_$AddStoryRequestModelImpl _value,
      $Res Function(_$AddStoryRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? photo = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$AddStoryRequestModelImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddStoryRequestModelImpl implements _AddStoryRequestModel {
  const _$AddStoryRequestModelImpl(
      {required this.description,
      @JsonKey(name: 'photo', fromJson: fileFromJson, toJson: fileToJson)
      required this.photo,
      this.lat,
      this.lon});

  factory _$AddStoryRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddStoryRequestModelImplFromJson(json);

// @JsonKey(name: 'description') required String description,
// @JsonKey(name: 'photo') required File photo,
// @JsonKey(name: 'lat') double? lat,
// @JsonKey(name: 'lon') double? lon,
  @override
  final String description;
  @override
  @JsonKey(name: 'photo', fromJson: fileFromJson, toJson: fileToJson)
  final File photo;
  @override
  final double? lat;
  @override
  final double? lon;

  @override
  String toString() {
    return 'AddStoryRequestModel(description: $description, photo: $photo, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoryRequestModelImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, description, photo, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoryRequestModelImplCopyWith<_$AddStoryRequestModelImpl>
      get copyWith =>
          __$$AddStoryRequestModelImplCopyWithImpl<_$AddStoryRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddStoryRequestModelImplToJson(
      this,
    );
  }
}

abstract class _AddStoryRequestModel implements AddStoryRequestModel {
  const factory _AddStoryRequestModel(
      {required final String description,
      @JsonKey(name: 'photo', fromJson: fileFromJson, toJson: fileToJson)
      required final File photo,
      final double? lat,
      final double? lon}) = _$AddStoryRequestModelImpl;

  factory _AddStoryRequestModel.fromJson(Map<String, dynamic> json) =
      _$AddStoryRequestModelImpl.fromJson;

  @override // @JsonKey(name: 'description') required String description,
// @JsonKey(name: 'photo') required File photo,
// @JsonKey(name: 'lat') double? lat,
// @JsonKey(name: 'lon') double? lon,
  String get description;
  @override
  @JsonKey(name: 'photo', fromJson: fileFromJson, toJson: fileToJson)
  File get photo;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$AddStoryRequestModelImplCopyWith<_$AddStoryRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
