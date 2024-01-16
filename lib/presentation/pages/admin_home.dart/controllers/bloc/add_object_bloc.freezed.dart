// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_object_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddObjectEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitForAdd,
    required TResult Function(BaseModel object) changeObjectType,
    required TResult Function(BaseModel object) confirmObject,
    required TResult Function() exit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitForAdd,
    TResult? Function(BaseModel object)? changeObjectType,
    TResult? Function(BaseModel object)? confirmObject,
    TResult? Function()? exit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitForAdd,
    TResult Function(BaseModel object)? changeObjectType,
    TResult Function(BaseModel object)? confirmObject,
    TResult Function()? exit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WaitForAdd value) waitForAdd,
    required TResult Function(_ChangeObjectType value) changeObjectType,
    required TResult Function(_ConfirmObject value) confirmObject,
    required TResult Function(_Exit value) exit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WaitForAdd value)? waitForAdd,
    TResult? Function(_ChangeObjectType value)? changeObjectType,
    TResult? Function(_ConfirmObject value)? confirmObject,
    TResult? Function(_Exit value)? exit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WaitForAdd value)? waitForAdd,
    TResult Function(_ChangeObjectType value)? changeObjectType,
    TResult Function(_ConfirmObject value)? confirmObject,
    TResult Function(_Exit value)? exit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddObjectEventCopyWith<$Res> {
  factory $AddObjectEventCopyWith(
          AddObjectEvent value, $Res Function(AddObjectEvent) then) =
      _$AddObjectEventCopyWithImpl<$Res, AddObjectEvent>;
}

/// @nodoc
class _$AddObjectEventCopyWithImpl<$Res, $Val extends AddObjectEvent>
    implements $AddObjectEventCopyWith<$Res> {
  _$AddObjectEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WaitForAddImplCopyWith<$Res> {
  factory _$$WaitForAddImplCopyWith(
          _$WaitForAddImpl value, $Res Function(_$WaitForAddImpl) then) =
      __$$WaitForAddImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WaitForAddImplCopyWithImpl<$Res>
    extends _$AddObjectEventCopyWithImpl<$Res, _$WaitForAddImpl>
    implements _$$WaitForAddImplCopyWith<$Res> {
  __$$WaitForAddImplCopyWithImpl(
      _$WaitForAddImpl _value, $Res Function(_$WaitForAddImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WaitForAddImpl implements _WaitForAdd {
  const _$WaitForAddImpl();

  @override
  String toString() {
    return 'AddObjectEvent.waitForAdd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WaitForAddImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitForAdd,
    required TResult Function(BaseModel object) changeObjectType,
    required TResult Function(BaseModel object) confirmObject,
    required TResult Function() exit,
  }) {
    return waitForAdd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitForAdd,
    TResult? Function(BaseModel object)? changeObjectType,
    TResult? Function(BaseModel object)? confirmObject,
    TResult? Function()? exit,
  }) {
    return waitForAdd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitForAdd,
    TResult Function(BaseModel object)? changeObjectType,
    TResult Function(BaseModel object)? confirmObject,
    TResult Function()? exit,
    required TResult orElse(),
  }) {
    if (waitForAdd != null) {
      return waitForAdd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WaitForAdd value) waitForAdd,
    required TResult Function(_ChangeObjectType value) changeObjectType,
    required TResult Function(_ConfirmObject value) confirmObject,
    required TResult Function(_Exit value) exit,
  }) {
    return waitForAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WaitForAdd value)? waitForAdd,
    TResult? Function(_ChangeObjectType value)? changeObjectType,
    TResult? Function(_ConfirmObject value)? confirmObject,
    TResult? Function(_Exit value)? exit,
  }) {
    return waitForAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WaitForAdd value)? waitForAdd,
    TResult Function(_ChangeObjectType value)? changeObjectType,
    TResult Function(_ConfirmObject value)? confirmObject,
    TResult Function(_Exit value)? exit,
    required TResult orElse(),
  }) {
    if (waitForAdd != null) {
      return waitForAdd(this);
    }
    return orElse();
  }
}

abstract class _WaitForAdd implements AddObjectEvent {
  const factory _WaitForAdd() = _$WaitForAddImpl;
}

/// @nodoc
abstract class _$$ChangeObjectTypeImplCopyWith<$Res> {
  factory _$$ChangeObjectTypeImplCopyWith(_$ChangeObjectTypeImpl value,
          $Res Function(_$ChangeObjectTypeImpl) then) =
      __$$ChangeObjectTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseModel object});
}

/// @nodoc
class __$$ChangeObjectTypeImplCopyWithImpl<$Res>
    extends _$AddObjectEventCopyWithImpl<$Res, _$ChangeObjectTypeImpl>
    implements _$$ChangeObjectTypeImplCopyWith<$Res> {
  __$$ChangeObjectTypeImplCopyWithImpl(_$ChangeObjectTypeImpl _value,
      $Res Function(_$ChangeObjectTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_$ChangeObjectTypeImpl(
      null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as BaseModel,
    ));
  }
}

/// @nodoc

class _$ChangeObjectTypeImpl implements _ChangeObjectType {
  const _$ChangeObjectTypeImpl(this.object);

  @override
  final BaseModel object;

  @override
  String toString() {
    return 'AddObjectEvent.changeObjectType(object: $object)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeObjectTypeImpl &&
            (identical(other.object, object) || other.object == object));
  }

  @override
  int get hashCode => Object.hash(runtimeType, object);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeObjectTypeImplCopyWith<_$ChangeObjectTypeImpl> get copyWith =>
      __$$ChangeObjectTypeImplCopyWithImpl<_$ChangeObjectTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitForAdd,
    required TResult Function(BaseModel object) changeObjectType,
    required TResult Function(BaseModel object) confirmObject,
    required TResult Function() exit,
  }) {
    return changeObjectType(object);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitForAdd,
    TResult? Function(BaseModel object)? changeObjectType,
    TResult? Function(BaseModel object)? confirmObject,
    TResult? Function()? exit,
  }) {
    return changeObjectType?.call(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitForAdd,
    TResult Function(BaseModel object)? changeObjectType,
    TResult Function(BaseModel object)? confirmObject,
    TResult Function()? exit,
    required TResult orElse(),
  }) {
    if (changeObjectType != null) {
      return changeObjectType(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WaitForAdd value) waitForAdd,
    required TResult Function(_ChangeObjectType value) changeObjectType,
    required TResult Function(_ConfirmObject value) confirmObject,
    required TResult Function(_Exit value) exit,
  }) {
    return changeObjectType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WaitForAdd value)? waitForAdd,
    TResult? Function(_ChangeObjectType value)? changeObjectType,
    TResult? Function(_ConfirmObject value)? confirmObject,
    TResult? Function(_Exit value)? exit,
  }) {
    return changeObjectType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WaitForAdd value)? waitForAdd,
    TResult Function(_ChangeObjectType value)? changeObjectType,
    TResult Function(_ConfirmObject value)? confirmObject,
    TResult Function(_Exit value)? exit,
    required TResult orElse(),
  }) {
    if (changeObjectType != null) {
      return changeObjectType(this);
    }
    return orElse();
  }
}

abstract class _ChangeObjectType implements AddObjectEvent {
  const factory _ChangeObjectType(final BaseModel object) =
      _$ChangeObjectTypeImpl;

  BaseModel get object;
  @JsonKey(ignore: true)
  _$$ChangeObjectTypeImplCopyWith<_$ChangeObjectTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmObjectImplCopyWith<$Res> {
  factory _$$ConfirmObjectImplCopyWith(
          _$ConfirmObjectImpl value, $Res Function(_$ConfirmObjectImpl) then) =
      __$$ConfirmObjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseModel object});
}

/// @nodoc
class __$$ConfirmObjectImplCopyWithImpl<$Res>
    extends _$AddObjectEventCopyWithImpl<$Res, _$ConfirmObjectImpl>
    implements _$$ConfirmObjectImplCopyWith<$Res> {
  __$$ConfirmObjectImplCopyWithImpl(
      _$ConfirmObjectImpl _value, $Res Function(_$ConfirmObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_$ConfirmObjectImpl(
      null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as BaseModel,
    ));
  }
}

/// @nodoc

class _$ConfirmObjectImpl implements _ConfirmObject {
  const _$ConfirmObjectImpl(this.object);

  @override
  final BaseModel object;

  @override
  String toString() {
    return 'AddObjectEvent.confirmObject(object: $object)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmObjectImpl &&
            (identical(other.object, object) || other.object == object));
  }

  @override
  int get hashCode => Object.hash(runtimeType, object);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmObjectImplCopyWith<_$ConfirmObjectImpl> get copyWith =>
      __$$ConfirmObjectImplCopyWithImpl<_$ConfirmObjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitForAdd,
    required TResult Function(BaseModel object) changeObjectType,
    required TResult Function(BaseModel object) confirmObject,
    required TResult Function() exit,
  }) {
    return confirmObject(object);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitForAdd,
    TResult? Function(BaseModel object)? changeObjectType,
    TResult? Function(BaseModel object)? confirmObject,
    TResult? Function()? exit,
  }) {
    return confirmObject?.call(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitForAdd,
    TResult Function(BaseModel object)? changeObjectType,
    TResult Function(BaseModel object)? confirmObject,
    TResult Function()? exit,
    required TResult orElse(),
  }) {
    if (confirmObject != null) {
      return confirmObject(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WaitForAdd value) waitForAdd,
    required TResult Function(_ChangeObjectType value) changeObjectType,
    required TResult Function(_ConfirmObject value) confirmObject,
    required TResult Function(_Exit value) exit,
  }) {
    return confirmObject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WaitForAdd value)? waitForAdd,
    TResult? Function(_ChangeObjectType value)? changeObjectType,
    TResult? Function(_ConfirmObject value)? confirmObject,
    TResult? Function(_Exit value)? exit,
  }) {
    return confirmObject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WaitForAdd value)? waitForAdd,
    TResult Function(_ChangeObjectType value)? changeObjectType,
    TResult Function(_ConfirmObject value)? confirmObject,
    TResult Function(_Exit value)? exit,
    required TResult orElse(),
  }) {
    if (confirmObject != null) {
      return confirmObject(this);
    }
    return orElse();
  }
}

abstract class _ConfirmObject implements AddObjectEvent {
  const factory _ConfirmObject(final BaseModel object) = _$ConfirmObjectImpl;

  BaseModel get object;
  @JsonKey(ignore: true)
  _$$ConfirmObjectImplCopyWith<_$ConfirmObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExitImplCopyWith<$Res> {
  factory _$$ExitImplCopyWith(
          _$ExitImpl value, $Res Function(_$ExitImpl) then) =
      __$$ExitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExitImplCopyWithImpl<$Res>
    extends _$AddObjectEventCopyWithImpl<$Res, _$ExitImpl>
    implements _$$ExitImplCopyWith<$Res> {
  __$$ExitImplCopyWithImpl(_$ExitImpl _value, $Res Function(_$ExitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ExitImpl implements _Exit {
  const _$ExitImpl();

  @override
  String toString() {
    return 'AddObjectEvent.exit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitForAdd,
    required TResult Function(BaseModel object) changeObjectType,
    required TResult Function(BaseModel object) confirmObject,
    required TResult Function() exit,
  }) {
    return exit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitForAdd,
    TResult? Function(BaseModel object)? changeObjectType,
    TResult? Function(BaseModel object)? confirmObject,
    TResult? Function()? exit,
  }) {
    return exit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitForAdd,
    TResult Function(BaseModel object)? changeObjectType,
    TResult Function(BaseModel object)? confirmObject,
    TResult Function()? exit,
    required TResult orElse(),
  }) {
    if (exit != null) {
      return exit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_WaitForAdd value) waitForAdd,
    required TResult Function(_ChangeObjectType value) changeObjectType,
    required TResult Function(_ConfirmObject value) confirmObject,
    required TResult Function(_Exit value) exit,
  }) {
    return exit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_WaitForAdd value)? waitForAdd,
    TResult? Function(_ChangeObjectType value)? changeObjectType,
    TResult? Function(_ConfirmObject value)? confirmObject,
    TResult? Function(_Exit value)? exit,
  }) {
    return exit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_WaitForAdd value)? waitForAdd,
    TResult Function(_ChangeObjectType value)? changeObjectType,
    TResult Function(_ConfirmObject value)? confirmObject,
    TResult Function(_Exit value)? exit,
    required TResult orElse(),
  }) {
    if (exit != null) {
      return exit(this);
    }
    return orElse();
  }
}

abstract class _Exit implements AddObjectEvent {
  const factory _Exit() = _$ExitImpl;
}

/// @nodoc
mixin _$AddObjectState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(BaseModel object) objectChanged,
    required TResult Function() focusRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(BaseModel object)? objectChanged,
    TResult? Function()? focusRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(BaseModel object)? objectChanged,
    TResult Function()? focusRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ObjectChanged value) objectChanged,
    required TResult Function(_FocusRemoved value) focusRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ObjectChanged value)? objectChanged,
    TResult? Function(_FocusRemoved value)? focusRemoved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ObjectChanged value)? objectChanged,
    TResult Function(_FocusRemoved value)? focusRemoved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddObjectStateCopyWith<$Res> {
  factory $AddObjectStateCopyWith(
          AddObjectState value, $Res Function(AddObjectState) then) =
      _$AddObjectStateCopyWithImpl<$Res, AddObjectState>;
}

/// @nodoc
class _$AddObjectStateCopyWithImpl<$Res, $Val extends AddObjectState>
    implements $AddObjectStateCopyWith<$Res> {
  _$AddObjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AddObjectStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AddObjectState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(BaseModel object) objectChanged,
    required TResult Function() focusRemoved,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(BaseModel object)? objectChanged,
    TResult? Function()? focusRemoved,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(BaseModel object)? objectChanged,
    TResult Function()? focusRemoved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ObjectChanged value) objectChanged,
    required TResult Function(_FocusRemoved value) focusRemoved,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ObjectChanged value)? objectChanged,
    TResult? Function(_FocusRemoved value)? focusRemoved,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ObjectChanged value)? objectChanged,
    TResult Function(_FocusRemoved value)? focusRemoved,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddObjectState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ObjectChangedImplCopyWith<$Res> {
  factory _$$ObjectChangedImplCopyWith(
          _$ObjectChangedImpl value, $Res Function(_$ObjectChangedImpl) then) =
      __$$ObjectChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BaseModel object});
}

/// @nodoc
class __$$ObjectChangedImplCopyWithImpl<$Res>
    extends _$AddObjectStateCopyWithImpl<$Res, _$ObjectChangedImpl>
    implements _$$ObjectChangedImplCopyWith<$Res> {
  __$$ObjectChangedImplCopyWithImpl(
      _$ObjectChangedImpl _value, $Res Function(_$ObjectChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
  }) {
    return _then(_$ObjectChangedImpl(
      null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as BaseModel,
    ));
  }
}

/// @nodoc

class _$ObjectChangedImpl implements _ObjectChanged {
  const _$ObjectChangedImpl(this.object);

  @override
  final BaseModel object;

  @override
  String toString() {
    return 'AddObjectState.objectChanged(object: $object)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ObjectChangedImpl &&
            (identical(other.object, object) || other.object == object));
  }

  @override
  int get hashCode => Object.hash(runtimeType, object);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ObjectChangedImplCopyWith<_$ObjectChangedImpl> get copyWith =>
      __$$ObjectChangedImplCopyWithImpl<_$ObjectChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(BaseModel object) objectChanged,
    required TResult Function() focusRemoved,
  }) {
    return objectChanged(object);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(BaseModel object)? objectChanged,
    TResult? Function()? focusRemoved,
  }) {
    return objectChanged?.call(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(BaseModel object)? objectChanged,
    TResult Function()? focusRemoved,
    required TResult orElse(),
  }) {
    if (objectChanged != null) {
      return objectChanged(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ObjectChanged value) objectChanged,
    required TResult Function(_FocusRemoved value) focusRemoved,
  }) {
    return objectChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ObjectChanged value)? objectChanged,
    TResult? Function(_FocusRemoved value)? focusRemoved,
  }) {
    return objectChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ObjectChanged value)? objectChanged,
    TResult Function(_FocusRemoved value)? focusRemoved,
    required TResult orElse(),
  }) {
    if (objectChanged != null) {
      return objectChanged(this);
    }
    return orElse();
  }
}

abstract class _ObjectChanged implements AddObjectState {
  const factory _ObjectChanged(final BaseModel object) = _$ObjectChangedImpl;

  BaseModel get object;
  @JsonKey(ignore: true)
  _$$ObjectChangedImplCopyWith<_$ObjectChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FocusRemovedImplCopyWith<$Res> {
  factory _$$FocusRemovedImplCopyWith(
          _$FocusRemovedImpl value, $Res Function(_$FocusRemovedImpl) then) =
      __$$FocusRemovedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FocusRemovedImplCopyWithImpl<$Res>
    extends _$AddObjectStateCopyWithImpl<$Res, _$FocusRemovedImpl>
    implements _$$FocusRemovedImplCopyWith<$Res> {
  __$$FocusRemovedImplCopyWithImpl(
      _$FocusRemovedImpl _value, $Res Function(_$FocusRemovedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FocusRemovedImpl implements _FocusRemoved {
  const _$FocusRemovedImpl();

  @override
  String toString() {
    return 'AddObjectState.focusRemoved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FocusRemovedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(BaseModel object) objectChanged,
    required TResult Function() focusRemoved,
  }) {
    return focusRemoved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(BaseModel object)? objectChanged,
    TResult? Function()? focusRemoved,
  }) {
    return focusRemoved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(BaseModel object)? objectChanged,
    TResult Function()? focusRemoved,
    required TResult orElse(),
  }) {
    if (focusRemoved != null) {
      return focusRemoved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_ObjectChanged value) objectChanged,
    required TResult Function(_FocusRemoved value) focusRemoved,
  }) {
    return focusRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_ObjectChanged value)? objectChanged,
    TResult? Function(_FocusRemoved value)? focusRemoved,
  }) {
    return focusRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_ObjectChanged value)? objectChanged,
    TResult Function(_FocusRemoved value)? focusRemoved,
    required TResult orElse(),
  }) {
    if (focusRemoved != null) {
      return focusRemoved(this);
    }
    return orElse();
  }
}

abstract class _FocusRemoved implements AddObjectState {
  const factory _FocusRemoved() = _$FocusRemovedImpl;
}
