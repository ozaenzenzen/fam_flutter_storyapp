// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_detail_story_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryGetDetail _$StoryGetDetailFromJson(Map<String, dynamic> json) {
  return _StoryGetDetail.fromJson(json);
}

/// @nodoc
mixin _$StoryGetDetail {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'createdAt', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryGetDetailCopyWith<StoryGetDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryGetDetailCopyWith<$Res> {
  factory $StoryGetDetailCopyWith(
          StoryGetDetail value, $Res Function(StoryGetDetail) then) =
      _$StoryGetDetailCopyWithImpl<$Res, StoryGetDetail>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? photoUrl,
      @JsonKey(
          name: 'createdAt', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
      DateTime? createdAt,
      double? lat,
      double? lon});
}

/// @nodoc
class _$StoryGetDetailCopyWithImpl<$Res, $Val extends StoryGetDetail>
    implements $StoryGetDetailCopyWith<$Res> {
  _$StoryGetDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
abstract class _$$StoryGetDetailImplCopyWith<$Res>
    implements $StoryGetDetailCopyWith<$Res> {
  factory _$$StoryGetDetailImplCopyWith(_$StoryGetDetailImpl value,
          $Res Function(_$StoryGetDetailImpl) then) =
      __$$StoryGetDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? description,
      String? photoUrl,
      @JsonKey(
          name: 'createdAt', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
      DateTime? createdAt,
      double? lat,
      double? lon});
}

/// @nodoc
class __$$StoryGetDetailImplCopyWithImpl<$Res>
    extends _$StoryGetDetailCopyWithImpl<$Res, _$StoryGetDetailImpl>
    implements _$$StoryGetDetailImplCopyWith<$Res> {
  __$$StoryGetDetailImplCopyWithImpl(
      _$StoryGetDetailImpl _value, $Res Function(_$StoryGetDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? photoUrl = freezed,
    Object? createdAt = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$StoryGetDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
class _$StoryGetDetailImpl implements _StoryGetDetail {
  const _$StoryGetDetailImpl(
      {this.id,
      this.name,
      this.description,
      this.photoUrl,
      @JsonKey(
          name: 'createdAt', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
      this.createdAt,
      this.lat,
      this.lon});

  factory _$StoryGetDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryGetDetailImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? photoUrl;
  @override
  @JsonKey(
      name: 'createdAt', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime? createdAt;
  @override
  final double? lat;
  @override
  final double? lon;

  @override
  String toString() {
    return 'StoryGetDetail(id: $id, name: $name, description: $description, photoUrl: $photoUrl, createdAt: $createdAt, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryGetDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, description, photoUrl, createdAt, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryGetDetailImplCopyWith<_$StoryGetDetailImpl> get copyWith =>
      __$$StoryGetDetailImplCopyWithImpl<_$StoryGetDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryGetDetailImplToJson(
      this,
    );
  }
}

abstract class _StoryGetDetail implements StoryGetDetail {
  const factory _StoryGetDetail(
      {final String? id,
      final String? name,
      final String? description,
      final String? photoUrl,
      @JsonKey(
          name: 'createdAt', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
      final DateTime? createdAt,
      final double? lat,
      final double? lon}) = _$StoryGetDetailImpl;

  factory _StoryGetDetail.fromJson(Map<String, dynamic> json) =
      _$StoryGetDetailImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get photoUrl;
  @override
  @JsonKey(
      name: 'createdAt', fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  DateTime? get createdAt;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$StoryGetDetailImplCopyWith<_$StoryGetDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
