// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voyager_manager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VoyagerManager {
  Voyager get voyager => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoyagerManagerCopyWith<VoyagerManager> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoyagerManagerCopyWith<$Res> {
  factory $VoyagerManagerCopyWith(
          VoyagerManager value, $Res Function(VoyagerManager) then) =
      _$VoyagerManagerCopyWithImpl<$Res, VoyagerManager>;
  @useResult
  $Res call({Voyager voyager});

  $VoyagerCopyWith<$Res> get voyager;
}

/// @nodoc
class _$VoyagerManagerCopyWithImpl<$Res, $Val extends VoyagerManager>
    implements $VoyagerManagerCopyWith<$Res> {
  _$VoyagerManagerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voyager = null,
  }) {
    return _then(_value.copyWith(
      voyager: null == voyager
          ? _value.voyager
          : voyager // ignore: cast_nullable_to_non_nullable
              as Voyager,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VoyagerCopyWith<$Res> get voyager {
    return $VoyagerCopyWith<$Res>(_value.voyager, (value) {
      return _then(_value.copyWith(voyager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoyagerManagerImplCopyWith<$Res>
    implements $VoyagerManagerCopyWith<$Res> {
  factory _$$VoyagerManagerImplCopyWith(_$VoyagerManagerImpl value,
          $Res Function(_$VoyagerManagerImpl) then) =
      __$$VoyagerManagerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Voyager voyager});

  @override
  $VoyagerCopyWith<$Res> get voyager;
}

/// @nodoc
class __$$VoyagerManagerImplCopyWithImpl<$Res>
    extends _$VoyagerManagerCopyWithImpl<$Res, _$VoyagerManagerImpl>
    implements _$$VoyagerManagerImplCopyWith<$Res> {
  __$$VoyagerManagerImplCopyWithImpl(
      _$VoyagerManagerImpl _value, $Res Function(_$VoyagerManagerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? voyager = null,
  }) {
    return _then(_$VoyagerManagerImpl(
      null == voyager
          ? _value.voyager
          : voyager // ignore: cast_nullable_to_non_nullable
              as Voyager,
    ));
  }
}

/// @nodoc

class _$VoyagerManagerImpl extends _VoyagerManager {
  const _$VoyagerManagerImpl(this.voyager) : super._();

  @override
  final Voyager voyager;

  @override
  String toString() {
    return 'VoyagerManager(voyager: $voyager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoyagerManagerImpl &&
            (identical(other.voyager, voyager) || other.voyager == voyager));
  }

  @override
  int get hashCode => Object.hash(runtimeType, voyager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoyagerManagerImplCopyWith<_$VoyagerManagerImpl> get copyWith =>
      __$$VoyagerManagerImplCopyWithImpl<_$VoyagerManagerImpl>(
          this, _$identity);
}

abstract class _VoyagerManager extends VoyagerManager {
  const factory _VoyagerManager(final Voyager voyager) = _$VoyagerManagerImpl;
  const _VoyagerManager._() : super._();

  @override
  Voyager get voyager;
  @override
  @JsonKey(ignore: true)
  _$$VoyagerManagerImplCopyWith<_$VoyagerManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
