// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voyager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Voyager {
  int? get id => throw _privateConstructorUsedError;
  int get peopleCount => throw _privateConstructorUsedError;
  Ship get ship => throw _privateConstructorUsedError;
  IList<Reading> get beforeReadings => throw _privateConstructorUsedError;
  IList<Reading> get afterReadings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VoyagerCopyWith<Voyager> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoyagerCopyWith<$Res> {
  factory $VoyagerCopyWith(Voyager value, $Res Function(Voyager) then) =
      _$VoyagerCopyWithImpl<$Res, Voyager>;
  @useResult
  $Res call(
      {int? id,
      int peopleCount,
      Ship ship,
      IList<Reading> beforeReadings,
      IList<Reading> afterReadings});
}

/// @nodoc
class _$VoyagerCopyWithImpl<$Res, $Val extends Voyager>
    implements $VoyagerCopyWith<$Res> {
  _$VoyagerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? peopleCount = null,
    Object? ship = null,
    Object? beforeReadings = null,
    Object? afterReadings = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      peopleCount: null == peopleCount
          ? _value.peopleCount
          : peopleCount // ignore: cast_nullable_to_non_nullable
              as int,
      ship: null == ship
          ? _value.ship
          : ship // ignore: cast_nullable_to_non_nullable
              as Ship,
      beforeReadings: null == beforeReadings
          ? _value.beforeReadings
          : beforeReadings // ignore: cast_nullable_to_non_nullable
              as IList<Reading>,
      afterReadings: null == afterReadings
          ? _value.afterReadings
          : afterReadings // ignore: cast_nullable_to_non_nullable
              as IList<Reading>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoyagerImplCopyWith<$Res> implements $VoyagerCopyWith<$Res> {
  factory _$$VoyagerImplCopyWith(
          _$VoyagerImpl value, $Res Function(_$VoyagerImpl) then) =
      __$$VoyagerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int peopleCount,
      Ship ship,
      IList<Reading> beforeReadings,
      IList<Reading> afterReadings});
}

/// @nodoc
class __$$VoyagerImplCopyWithImpl<$Res>
    extends _$VoyagerCopyWithImpl<$Res, _$VoyagerImpl>
    implements _$$VoyagerImplCopyWith<$Res> {
  __$$VoyagerImplCopyWithImpl(
      _$VoyagerImpl _value, $Res Function(_$VoyagerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? peopleCount = null,
    Object? ship = null,
    Object? beforeReadings = null,
    Object? afterReadings = null,
  }) {
    return _then(_$VoyagerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      peopleCount: null == peopleCount
          ? _value.peopleCount
          : peopleCount // ignore: cast_nullable_to_non_nullable
              as int,
      ship: null == ship
          ? _value.ship
          : ship // ignore: cast_nullable_to_non_nullable
              as Ship,
      beforeReadings: null == beforeReadings
          ? _value.beforeReadings
          : beforeReadings // ignore: cast_nullable_to_non_nullable
              as IList<Reading>,
      afterReadings: null == afterReadings
          ? _value.afterReadings
          : afterReadings // ignore: cast_nullable_to_non_nullable
              as IList<Reading>,
    ));
  }
}

/// @nodoc

class _$VoyagerImpl extends _Voyager {
  const _$VoyagerImpl(
      {this.id,
      required this.peopleCount,
      required this.ship,
      this.beforeReadings = const IList.empty(),
      this.afterReadings = const IList.empty()})
      : super._();

  @override
  final int? id;
  @override
  final int peopleCount;
  @override
  final Ship ship;
  @override
  @JsonKey()
  final IList<Reading> beforeReadings;
  @override
  @JsonKey()
  final IList<Reading> afterReadings;

  @override
  String toString() {
    return 'Voyager(id: $id, peopleCount: $peopleCount, ship: $ship, beforeReadings: $beforeReadings, afterReadings: $afterReadings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoyagerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.peopleCount, peopleCount) ||
                other.peopleCount == peopleCount) &&
            (identical(other.ship, ship) || other.ship == ship) &&
            const DeepCollectionEquality()
                .equals(other.beforeReadings, beforeReadings) &&
            const DeepCollectionEquality()
                .equals(other.afterReadings, afterReadings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      peopleCount,
      ship,
      const DeepCollectionEquality().hash(beforeReadings),
      const DeepCollectionEquality().hash(afterReadings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoyagerImplCopyWith<_$VoyagerImpl> get copyWith =>
      __$$VoyagerImplCopyWithImpl<_$VoyagerImpl>(this, _$identity);
}

abstract class _Voyager extends Voyager {
  const factory _Voyager(
      {final int? id,
      required final int peopleCount,
      required final Ship ship,
      final IList<Reading> beforeReadings,
      final IList<Reading> afterReadings}) = _$VoyagerImpl;
  const _Voyager._() : super._();

  @override
  int? get id;
  @override
  int get peopleCount;
  @override
  Ship get ship;
  @override
  IList<Reading> get beforeReadings;
  @override
  IList<Reading> get afterReadings;
  @override
  @JsonKey(ignore: true)
  _$$VoyagerImplCopyWith<_$VoyagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
