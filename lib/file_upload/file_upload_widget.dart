import 'dart:io';

import 'package:fileuploadtos3/file_upload/bloc/file_upload_bloc.dart';
import 'package:fileuploadtos3/file_upload/bloc/file_upload_event.dart';
import 'package:fileuploadtos3/file_upload/bloc/file_upload_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileUploadWidget extends StatelessWidget {
  const FileUploadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FileUploadBloc(),
        child: const Scaffold(
          body: Center(child: MainLayout()),
        ));
  }
}


class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FileUploadBloc, FileUploadState>(
        buildWhen: (previous, current) =>
            previous.selectedImage != current.selectedImage,
        listenWhen: (prev,cur) => prev.status != cur.status,
        listener: (context,state){
          if(state.status == Status.failure){
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(const SnackBar(content: Text("Failed to upload image")));
          }
        },
        builder: (context, state) {
          return Container(
            height: 300,
            width: 500,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state.selectedImage.isEmpty
                    ? Material(
                        child: InkWell(
                            onTap: () {
                              context
                                  .read<FileUploadBloc>()
                                  .add(const SelectImage());
                            },
                            child: const Icon(Icons.camera_alt, size: 150)))
                    : Image.file(File(state.selectedImage), height: 150),
                Visibility(
                    visible: state.selectedImage.isEmpty,
                    child: const Text("Select image to upload")),
                if (state.selectedImage.isNotEmpty)
                  TextButton(
                      onPressed: () {
                        context.read<FileUploadBloc>().add(const SelectImage());
                      },
                      child: const Text("Retry")),
                if (state.selectedImage.isNotEmpty)
                  TextButton(
                      onPressed: () {
                        context.read<FileUploadBloc>().add(const UploadImage());
                      },
                      child: const Text("Upload")),
              ],
            ),
          );
        });
  }
}
