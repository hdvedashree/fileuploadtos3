// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FileUploadState {
  Status get status => throw _privateConstructorUsedError;
  String get selectedImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FileUploadStateCopyWith<FileUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileUploadStateCopyWith<$Res> {
  factory $FileUploadStateCopyWith(
          FileUploadState value, $Res Function(FileUploadState) then) =
      _$FileUploadStateCopyWithImpl<$Res, FileUploadState>;
  @useResult
  $Res call({Status status, String selectedImage});
}

/// @nodoc
class _$FileUploadStateCopyWithImpl<$Res, $Val extends FileUploadState>
    implements $FileUploadStateCopyWith<$Res> {
  _$FileUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedImage = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedImage: null == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileUploadStateEventImplCopyWith<$Res>
    implements $FileUploadStateCopyWith<$Res> {
  factory _$$FileUploadStateEventImplCopyWith(_$FileUploadStateEventImpl value,
          $Res Function(_$FileUploadStateEventImpl) then) =
      __$$FileUploadStateEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String selectedImage});
}

/// @nodoc
class __$$FileUploadStateEventImplCopyWithImpl<$Res>
    extends _$FileUploadStateCopyWithImpl<$Res, _$FileUploadStateEventImpl>
    implements _$$FileUploadStateEventImplCopyWith<$Res> {
  __$$FileUploadStateEventImplCopyWithImpl(_$FileUploadStateEventImpl _value,
      $Res Function(_$FileUploadStateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedImage = null,
  }) {
    return _then(_$FileUploadStateEventImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedImage: null == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FileUploadStateEventImpl implements _FileUploadStateEvent {
  const _$FileUploadStateEventImpl(
      {this.status = Status.initial, this.selectedImage = ""});

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String selectedImage;

  @override
  String toString() {
    return 'FileUploadState(status: $status, selectedImage: $selectedImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileUploadStateEventImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, selectedImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileUploadStateEventImplCopyWith<_$FileUploadStateEventImpl>
      get copyWith =>
          __$$FileUploadStateEventImplCopyWithImpl<_$FileUploadStateEventImpl>(
              this, _$identity);
}

abstract class _FileUploadStateEvent implements FileUploadState {
  const factory _FileUploadStateEvent(
      {final Status status,
      final String selectedImage}) = _$FileUploadStateEventImpl;

  @override
  Status get status;
  @override
  String get selectedImage;
  @override
  @JsonKey(ignore: true)
  _$$FileUploadStateEventImplCopyWith<_$FileUploadStateEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
