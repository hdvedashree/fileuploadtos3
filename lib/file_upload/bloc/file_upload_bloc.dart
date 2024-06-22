import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fileuploadtos3/aws/aws_s3_upload.dart';
import 'package:fileuploadtos3/file_upload/bloc/file_upload_event.dart';
import 'package:fileuploadtos3/file_upload/bloc/file_upload_state.dart';
import 'package:flutter/foundation.dart';

class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  FileUploadBloc() : super(const FileUploadState()) {
    on<SelectImage>(_selectImage);
    on<UploadImage>(_uploadImage);
  }

  Future<void> _selectImage(
    SelectImage event,
    Emitter<FileUploadState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading, selectedImage: ""));

    List<String> pickedFileNames = [];

    emit(state.copyWith(selectedImage: ""));
    FilePickerResult? pickerResult;
    try {
      var result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        lockParentWindow: true,
        onFileLoading: (p0) {
          print('filepicker status is ${p0.toString()}');
        },
        type: FileType.image,
        dialogTitle: 'Pick an Image',
      );
      if (!kIsWeb) {
        List<File> fileList = [];
        result?.paths.forEach(
          (element) {
            return fileList.add(File(element as String));
          },
        );
        List<Uint8List> imageByesList = [];
        for (var i = 0; i < fileList.length; i++) {
          final bytes = await fileList[i].readAsBytes();
          imageByesList.add(bytes);
        }
        pickerResult = FilePickerResult(List.generate(
            fileList.length,
            (index) => PlatformFile(
                name: result!.files[index].name,
                size: result.files[index].size,
                bytes: imageByesList[index],
                path: fileList[index].path)));
        result = pickerResult;
      }
      if (result?.paths.isNotEmpty == true) {
        print('result files is ${result?.files.length}');
        pickedFileNames = [];

        for (var element in result!.files) {
          pickedFileNames.add(element.name);
        }

        List<int> imageBytes =
            await File(result.paths[0].toString()).readAsBytes();
        var updatevalue = Uint8List.fromList(imageBytes);

        emit(state.copyWith(selectedImage: result.paths[0].toString()));
      } else {
        //Failed to fecth
        // Us
      }
    } catch (e) {}
  }

  Future<void> _uploadImage(
      UploadImage event, Emitter<FileUploadState> emit) async {
    var result = await AwsS3.uploadFile(
      accessKey: "Your access key",
      secretKey: "Your secret key",
      file: File(state.selectedImage),
      bucket: "Bucket name",
      region: "region name",
      // metadata: {"test": "test"} // optional
    );

    if (result?.isNotEmpty == true) {
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
