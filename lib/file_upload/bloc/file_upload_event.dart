
import 'package:equatable/equatable.dart';

sealed class FileUploadEvent extends Equatable {
  const FileUploadEvent();
  @override
  List<Object> get props => [];
}



final class SelectImage extends FileUploadEvent {
  const SelectImage();

  @override
  List<Object> get props => [];
}




final class UploadImage extends FileUploadEvent {
  const UploadImage();

  @override
  List<Object> get props => [];
}

