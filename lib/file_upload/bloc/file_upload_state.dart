import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_state.freezed.dart';


@freezed
class FileUploadState with _$FileUploadState{
  const factory FileUploadState({
    @Default(Status.initial)  Status status,
    @Default("") String selectedImage
 }) = _FileUploadStateEvent;
}


enum Status {
  initial, loading,success,failure,noData
}