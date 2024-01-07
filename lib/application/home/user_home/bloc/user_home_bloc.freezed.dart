// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserHomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BaseModel> radars) getAllMarkers,
    required TResult Function(BaseModel radar) readMarker,
    required TResult Function(BaseModel radar) createMarker,
    required TResult Function(BaseModel radar) updateMarker,
    required TResult Function(String id) deleteMarker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BaseModel> radars)? getAllMarkers,
    TResult? Function(BaseModel radar)? readMarker,
    TResult? Function(BaseModel radar)? createMarker,
    TResult? Function(BaseModel radar)? updateMarker,
    TResult? Function(String id)? deleteMarker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BaseModel> radars)? getAllMarkers,
    TResult Function(BaseModel radar)? readMarker,
    TResult Function(BaseModel radar)? createMarker,
    TResult Function(BaseModel radar)? updateMarker,
    TResult Function(String id)? deleteMarker,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllMarkers value) getAllMarkers,
    required TResult Function(_AddMarker value) readMarker,
    required TResult Function(_RemoveMarker value) createMarker,
    required TResult Function(_UpdateMarker value) updateMarker,
    required TResult Function(_DeleteMarker value) deleteMarker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllMarkers value)? getAllMarkers,
    TResult? Function(_AddMarker value)? readMarker,
    TResult? Function(_RemoveMarker value)? createMarker,
    TResult? Function(_UpdateMarker value)? updateMarker,
    TResult? Function(_DeleteMarker value)? deleteMarker,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllMarkers value)? getAllMarkers,
    TResult Function(_AddMarker value)? readMarker,
    TResult Function(_RemoveMarker value)? createMarker,
    TResult Function(_UpdateMarker value)? updateMarker,
    TResult Function(_DeleteMarker value)? deleteMarker,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserHomeEventCopyWith<$Res> {
  factory $UserHomeEventCopyWith(
          UserHomeEvent value, $Res Function(UserHomeEvent) then) =
      _$UserHomeEventCopyWithImpl<$Res, UserHomeEvent>;
}

/// @nodoc
class _$UserHomeEventCopyWithImpl<$Res, $Val extends UserHomeEvent>
    implements $UserHomeEventCopyWith<$Res> {
  _$UserHomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllMarkersImplCopyWith<$Res> {
  factory _$$GetAllMarkersImplCopyWith(
          _$GetAllMarkersImpl value, $Res Function(_$GetAllMarkersImpl) then) =
      __$$GetAllMarkersImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<BaseModel> radars});
}

/// @nodoc
class __$$GetAllMarkersImplCopyWithImpl<$Res>
    extends _$UserHomeEventCopyWithImpl<$Res, _$GetAllMarkersImpl>
    implements _$$GetAllMarkersImplCopyWith<$Res> {
  __$$GetAllMarkersImplCopyWithImpl(
      _$GetAllMarkersImpl _value, $Res Function(_$GetAllMarkersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radars = null,
  }) {
    return _then(_$GetAllMarkersImpl(
      radars: null == radars
          ? _value._radars
          : radars // ignore: cast_nullable_to_non_nullable
              as List<BaseModel>,
    ));
  }
}

/// @nodoc

class _$GetAllMarkersImpl implements _GetAllMarkers {
  const _$GetAllMarkersImpl({required final List<BaseModel> radars})
      : _radars = radars;

  final List<BaseModel> _radars;
  @override
  List<BaseModel> get radars {
    if (_radars is EqualUnmodifiableListView) return _radars;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_radars);
  }

  @override
  String toString() {
    return 'UserHomeEvent.getAllMarkers(radars: $radars)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllMarkersImpl &&
            const DeepCollectionEquality().equals(other._radars, _radars));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_radars));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllMarkersImplCopyWith<_$GetAllMarkersImpl> get copyWith =>
      __$$GetAllMarkersImplCopyWithImpl<_$GetAllMarkersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BaseModel> radars) getAllMarkers,
    required TResult Function(BaseModel radar) readMarker,
    required TResult Function(BaseModel radar) createMarker,
    required TResult Function(BaseModel radar) updateMarker,
    required TResult Function(String id) deleteMarker,
  }) {
    return getAllMarkers(radars);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BaseModel> radars)? getAllMarkers,
    TResult? Function(BaseModel radar)? readMarker,
    TResult? Function(BaseModel radar)? createMarker,
    TResult? Function(BaseModel radar)? updateMarker,
    TResult? Function(String id)? deleteMarker,
  }) {
    return getAllMarkers?.call(radars);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BaseModel> radars)? getAllMarkers,
    TResult Function(BaseModel radar)? readMarker,
    TResult Function(BaseModel radar)? createMarker,
    TResult Function(BaseModel radar)? updateMarker,
    TResult Function(String id)? deleteMarker,
    required TResult orElse(),
  }) {
    if (getAllMarkers != null) {
      return getAllMarkers(radars);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllMarkers value) getAllMarkers,
    required TResult Function(_AddMarker value) readMarker,
    required TResult Function(_RemoveMarker value) createMarker,
    required TResult Function(_UpdateMarker value) updateMarker,
    required TResult Function(_DeleteMarker value) deleteMarker,
  }) {
    return getAllMarkers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllMarkers value)? getAllMarkers,
    TResult? Function(_AddMarker value)? readMarker,
    TResult? Function(_RemoveMarker value)? createMarker,
    TResult? Function(_UpdateMarker value)? updateMarker,
    TResult? Function(_DeleteMarker value)? deleteMarker,
  }) {
    return getAllMarkers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllMarkers value)? getAllMarkers,
    TResult Function(_AddMarker value)? readMarker,
    TResult Function(_RemoveMarker value)? createMarker,
    TResult Function(_UpdateMarker value)? updateMarker,
    TResult Function(_DeleteMarker value)? deleteMarker,
    required TResult orElse(),
  }) {
    if (getAllMarkers != null) {
      return getAllMarkers(this);
    }
    return orElse();
  }
}

abstract class _GetAllMarkers implements UserHomeEvent {
  const factory _GetAllMarkers({required final List<BaseModel> radars}) =
      _$GetAllMarkersImpl;

  List<BaseModel> get radars;
  @JsonKey(ignore: true)
  _$$GetAllMarkersImplCopyWith<_$GetAllMarkersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddMarkerImplCopyWith<$Res> {
  factory _$$AddMarkerImplCopyWith(
          _$AddMarkerImpl value, $Res Function(_$AddMarkerImpl) then) =
      __$$AddMarkerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseModel radar});
}

/// @nodoc
class __$$AddMarkerImplCopyWithImpl<$Res>
    extends _$UserHomeEventCopyWithImpl<$Res, _$AddMarkerImpl>
    implements _$$AddMarkerImplCopyWith<$Res> {
  __$$AddMarkerImplCopyWithImpl(
      _$AddMarkerImpl _value, $Res Function(_$AddMarkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radar = null,
  }) {
    return _then(_$AddMarkerImpl(
      radar: null == radar
          ? _value.radar
          : radar // ignore: cast_nullable_to_non_nullable
              as BaseModel,
    ));
  }
}

/// @nodoc

class _$AddMarkerImpl implements _AddMarker {
  const _$AddMarkerImpl({required this.radar});

  @override
  final BaseModel radar;

  @override
  String toString() {
    return 'UserHomeEvent.readMarker(radar: $radar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMarkerImpl &&
            (identical(other.radar, radar) || other.radar == radar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMarkerImplCopyWith<_$AddMarkerImpl> get copyWith =>
      __$$AddMarkerImplCopyWithImpl<_$AddMarkerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BaseModel> radars) getAllMarkers,
    required TResult Function(BaseModel radar) readMarker,
    required TResult Function(BaseModel radar) createMarker,
    required TResult Function(BaseModel radar) updateMarker,
    required TResult Function(String id) deleteMarker,
  }) {
    return readMarker(radar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BaseModel> radars)? getAllMarkers,
    TResult? Function(BaseModel radar)? readMarker,
    TResult? Function(BaseModel radar)? createMarker,
    TResult? Function(BaseModel radar)? updateMarker,
    TResult? Function(String id)? deleteMarker,
  }) {
    return readMarker?.call(radar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BaseModel> radars)? getAllMarkers,
    TResult Function(BaseModel radar)? readMarker,
    TResult Function(BaseModel radar)? createMarker,
    TResult Function(BaseModel radar)? updateMarker,
    TResult Function(String id)? deleteMarker,
    required TResult orElse(),
  }) {
    if (readMarker != null) {
      return readMarker(radar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllMarkers value) getAllMarkers,
    required TResult Function(_AddMarker value) readMarker,
    required TResult Function(_RemoveMarker value) createMarker,
    required TResult Function(_UpdateMarker value) updateMarker,
    required TResult Function(_DeleteMarker value) deleteMarker,
  }) {
    return readMarker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllMarkers value)? getAllMarkers,
    TResult? Function(_AddMarker value)? readMarker,
    TResult? Function(_RemoveMarker value)? createMarker,
    TResult? Function(_UpdateMarker value)? updateMarker,
    TResult? Function(_DeleteMarker value)? deleteMarker,
  }) {
    return readMarker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllMarkers value)? getAllMarkers,
    TResult Function(_AddMarker value)? readMarker,
    TResult Function(_RemoveMarker value)? createMarker,
    TResult Function(_UpdateMarker value)? updateMarker,
    TResult Function(_DeleteMarker value)? deleteMarker,
    required TResult orElse(),
  }) {
    if (readMarker != null) {
      return readMarker(this);
    }
    return orElse();
  }
}

abstract class _AddMarker implements UserHomeEvent {
  const factory _AddMarker({required final BaseModel radar}) = _$AddMarkerImpl;

  BaseModel get radar;
  @JsonKey(ignore: true)
  _$$AddMarkerImplCopyWith<_$AddMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveMarkerImplCopyWith<$Res> {
  factory _$$RemoveMarkerImplCopyWith(
          _$RemoveMarkerImpl value, $Res Function(_$RemoveMarkerImpl) then) =
      __$$RemoveMarkerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseModel radar});
}

/// @nodoc
class __$$RemoveMarkerImplCopyWithImpl<$Res>
    extends _$UserHomeEventCopyWithImpl<$Res, _$RemoveMarkerImpl>
    implements _$$RemoveMarkerImplCopyWith<$Res> {
  __$$RemoveMarkerImplCopyWithImpl(
      _$RemoveMarkerImpl _value, $Res Function(_$RemoveMarkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radar = null,
  }) {
    return _then(_$RemoveMarkerImpl(
      radar: null == radar
          ? _value.radar
          : radar // ignore: cast_nullable_to_non_nullable
              as BaseModel,
    ));
  }
}

/// @nodoc

class _$RemoveMarkerImpl implements _RemoveMarker {
  const _$RemoveMarkerImpl({required this.radar});

  @override
  final BaseModel radar;

  @override
  String toString() {
    return 'UserHomeEvent.createMarker(radar: $radar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveMarkerImpl &&
            (identical(other.radar, radar) || other.radar == radar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveMarkerImplCopyWith<_$RemoveMarkerImpl> get copyWith =>
      __$$RemoveMarkerImplCopyWithImpl<_$RemoveMarkerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BaseModel> radars) getAllMarkers,
    required TResult Function(BaseModel radar) readMarker,
    required TResult Function(BaseModel radar) createMarker,
    required TResult Function(BaseModel radar) updateMarker,
    required TResult Function(String id) deleteMarker,
  }) {
    return createMarker(radar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BaseModel> radars)? getAllMarkers,
    TResult? Function(BaseModel radar)? readMarker,
    TResult? Function(BaseModel radar)? createMarker,
    TResult? Function(BaseModel radar)? updateMarker,
    TResult? Function(String id)? deleteMarker,
  }) {
    return createMarker?.call(radar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BaseModel> radars)? getAllMarkers,
    TResult Function(BaseModel radar)? readMarker,
    TResult Function(BaseModel radar)? createMarker,
    TResult Function(BaseModel radar)? updateMarker,
    TResult Function(String id)? deleteMarker,
    required TResult orElse(),
  }) {
    if (createMarker != null) {
      return createMarker(radar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllMarkers value) getAllMarkers,
    required TResult Function(_AddMarker value) readMarker,
    required TResult Function(_RemoveMarker value) createMarker,
    required TResult Function(_UpdateMarker value) updateMarker,
    required TResult Function(_DeleteMarker value) deleteMarker,
  }) {
    return createMarker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllMarkers value)? getAllMarkers,
    TResult? Function(_AddMarker value)? readMarker,
    TResult? Function(_RemoveMarker value)? createMarker,
    TResult? Function(_UpdateMarker value)? updateMarker,
    TResult? Function(_DeleteMarker value)? deleteMarker,
  }) {
    return createMarker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllMarkers value)? getAllMarkers,
    TResult Function(_AddMarker value)? readMarker,
    TResult Function(_RemoveMarker value)? createMarker,
    TResult Function(_UpdateMarker value)? updateMarker,
    TResult Function(_DeleteMarker value)? deleteMarker,
    required TResult orElse(),
  }) {
    if (createMarker != null) {
      return createMarker(this);
    }
    return orElse();
  }
}

abstract class _RemoveMarker implements UserHomeEvent {
  const factory _RemoveMarker({required final BaseModel radar}) =
      _$RemoveMarkerImpl;

  BaseModel get radar;
  @JsonKey(ignore: true)
  _$$RemoveMarkerImplCopyWith<_$RemoveMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMarkerImplCopyWith<$Res> {
  factory _$$UpdateMarkerImplCopyWith(
          _$UpdateMarkerImpl value, $Res Function(_$UpdateMarkerImpl) then) =
      __$$UpdateMarkerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseModel radar});
}

/// @nodoc
class __$$UpdateMarkerImplCopyWithImpl<$Res>
    extends _$UserHomeEventCopyWithImpl<$Res, _$UpdateMarkerImpl>
    implements _$$UpdateMarkerImplCopyWith<$Res> {
  __$$UpdateMarkerImplCopyWithImpl(
      _$UpdateMarkerImpl _value, $Res Function(_$UpdateMarkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? radar = null,
  }) {
    return _then(_$UpdateMarkerImpl(
      radar: null == radar
          ? _value.radar
          : radar // ignore: cast_nullable_to_non_nullable
              as BaseModel,
    ));
  }
}

/// @nodoc

class _$UpdateMarkerImpl implements _UpdateMarker {
  const _$UpdateMarkerImpl({required this.radar});

  @override
  final BaseModel radar;

  @override
  String toString() {
    return 'UserHomeEvent.updateMarker(radar: $radar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMarkerImpl &&
            (identical(other.radar, radar) || other.radar == radar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, radar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMarkerImplCopyWith<_$UpdateMarkerImpl> get copyWith =>
      __$$UpdateMarkerImplCopyWithImpl<_$UpdateMarkerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BaseModel> radars) getAllMarkers,
    required TResult Function(BaseModel radar) readMarker,
    required TResult Function(BaseModel radar) createMarker,
    required TResult Function(BaseModel radar) updateMarker,
    required TResult Function(String id) deleteMarker,
  }) {
    return updateMarker(radar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BaseModel> radars)? getAllMarkers,
    TResult? Function(BaseModel radar)? readMarker,
    TResult? Function(BaseModel radar)? createMarker,
    TResult? Function(BaseModel radar)? updateMarker,
    TResult? Function(String id)? deleteMarker,
  }) {
    return updateMarker?.call(radar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BaseModel> radars)? getAllMarkers,
    TResult Function(BaseModel radar)? readMarker,
    TResult Function(BaseModel radar)? createMarker,
    TResult Function(BaseModel radar)? updateMarker,
    TResult Function(String id)? deleteMarker,
    required TResult orElse(),
  }) {
    if (updateMarker != null) {
      return updateMarker(radar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllMarkers value) getAllMarkers,
    required TResult Function(_AddMarker value) readMarker,
    required TResult Function(_RemoveMarker value) createMarker,
    required TResult Function(_UpdateMarker value) updateMarker,
    required TResult Function(_DeleteMarker value) deleteMarker,
  }) {
    return updateMarker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllMarkers value)? getAllMarkers,
    TResult? Function(_AddMarker value)? readMarker,
    TResult? Function(_RemoveMarker value)? createMarker,
    TResult? Function(_UpdateMarker value)? updateMarker,
    TResult? Function(_DeleteMarker value)? deleteMarker,
  }) {
    return updateMarker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllMarkers value)? getAllMarkers,
    TResult Function(_AddMarker value)? readMarker,
    TResult Function(_RemoveMarker value)? createMarker,
    TResult Function(_UpdateMarker value)? updateMarker,
    TResult Function(_DeleteMarker value)? deleteMarker,
    required TResult orElse(),
  }) {
    if (updateMarker != null) {
      return updateMarker(this);
    }
    return orElse();
  }
}

abstract class _UpdateMarker implements UserHomeEvent {
  const factory _UpdateMarker({required final BaseModel radar}) =
      _$UpdateMarkerImpl;

  BaseModel get radar;
  @JsonKey(ignore: true)
  _$$UpdateMarkerImplCopyWith<_$UpdateMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteMarkerImplCopyWith<$Res> {
  factory _$$DeleteMarkerImplCopyWith(
          _$DeleteMarkerImpl value, $Res Function(_$DeleteMarkerImpl) then) =
      __$$DeleteMarkerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteMarkerImplCopyWithImpl<$Res>
    extends _$UserHomeEventCopyWithImpl<$Res, _$DeleteMarkerImpl>
    implements _$$DeleteMarkerImplCopyWith<$Res> {
  __$$DeleteMarkerImplCopyWithImpl(
      _$DeleteMarkerImpl _value, $Res Function(_$DeleteMarkerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteMarkerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteMarkerImpl implements _DeleteMarker {
  const _$DeleteMarkerImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'UserHomeEvent.deleteMarker(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteMarkerImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteMarkerImplCopyWith<_$DeleteMarkerImpl> get copyWith =>
      __$$DeleteMarkerImplCopyWithImpl<_$DeleteMarkerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<BaseModel> radars) getAllMarkers,
    required TResult Function(BaseModel radar) readMarker,
    required TResult Function(BaseModel radar) createMarker,
    required TResult Function(BaseModel radar) updateMarker,
    required TResult Function(String id) deleteMarker,
  }) {
    return deleteMarker(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<BaseModel> radars)? getAllMarkers,
    TResult? Function(BaseModel radar)? readMarker,
    TResult? Function(BaseModel radar)? createMarker,
    TResult? Function(BaseModel radar)? updateMarker,
    TResult? Function(String id)? deleteMarker,
  }) {
    return deleteMarker?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<BaseModel> radars)? getAllMarkers,
    TResult Function(BaseModel radar)? readMarker,
    TResult Function(BaseModel radar)? createMarker,
    TResult Function(BaseModel radar)? updateMarker,
    TResult Function(String id)? deleteMarker,
    required TResult orElse(),
  }) {
    if (deleteMarker != null) {
      return deleteMarker(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllMarkers value) getAllMarkers,
    required TResult Function(_AddMarker value) readMarker,
    required TResult Function(_RemoveMarker value) createMarker,
    required TResult Function(_UpdateMarker value) updateMarker,
    required TResult Function(_DeleteMarker value) deleteMarker,
  }) {
    return deleteMarker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllMarkers value)? getAllMarkers,
    TResult? Function(_AddMarker value)? readMarker,
    TResult? Function(_RemoveMarker value)? createMarker,
    TResult? Function(_UpdateMarker value)? updateMarker,
    TResult? Function(_DeleteMarker value)? deleteMarker,
  }) {
    return deleteMarker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllMarkers value)? getAllMarkers,
    TResult Function(_AddMarker value)? readMarker,
    TResult Function(_RemoveMarker value)? createMarker,
    TResult Function(_UpdateMarker value)? updateMarker,
    TResult Function(_DeleteMarker value)? deleteMarker,
    required TResult orElse(),
  }) {
    if (deleteMarker != null) {
      return deleteMarker(this);
    }
    return orElse();
  }
}

abstract class _DeleteMarker implements UserHomeEvent {
  const factory _DeleteMarker({required final String id}) = _$DeleteMarkerImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteMarkerImplCopyWith<_$DeleteMarkerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserHomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserHomeStateCopyWith<$Res> {
  factory $UserHomeStateCopyWith(
          UserHomeState value, $Res Function(UserHomeState) then) =
      _$UserHomeStateCopyWithImpl<$Res, UserHomeState>;
}

/// @nodoc
class _$UserHomeStateCopyWithImpl<$Res, $Val extends UserHomeState>
    implements $UserHomeStateCopyWith<$Res> {
  _$UserHomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UserHomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserHomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserHomeState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$UserHomeStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'UserHomeState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements UserHomeState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$UserHomeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(_$ErrorImpl(
      null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.errorMessage);

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'UserHomeState.error(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String errorMessage) error,
  }) {
    return error(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String errorMessage)? error,
  }) {
    return error?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String errorMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserHomeState {
  const factory _Error(final String errorMessage) = _$ErrorImpl;

  String get errorMessage;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
