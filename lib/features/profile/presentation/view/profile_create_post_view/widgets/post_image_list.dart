import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostImageList extends StatelessWidget {
  final List<XFile> selectedImageFileList;

  const PostImageList({super.key, required this.selectedImageFileList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (selectedImageFileList.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: generateList(context, selectedImageFileList),
            ),
          )
        else
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: Text('Нет выбранных фотографий'),
          ),
      ],
    );
  }
}

List<Widget> generateList(
    BuildContext context, List<XFile> selectedImageFileList) {
  return [
    GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: selectedImageFileList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.file(
            File(selectedImageFileList[index].path),
            fit: BoxFit.cover,
          ),
        );
      },
    ),
  ];
}
