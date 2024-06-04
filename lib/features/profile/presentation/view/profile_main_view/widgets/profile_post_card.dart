import 'dart:io';

import 'package:eventyle_app/features/profile/domain/entities/post_entity.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/constants/theme/container_box_decoration.dart';
import '../../../../../../core/constants/widgets/create_image_widget.dart';

class ProfilePostCard extends StatelessWidget {
  final PostEntity postEntity;

  const ProfilePostCard({
    super.key,
    required this.postEntity,
  });

  void _showImageOnFullScreen(BuildContext context, String imagePath) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 500,
            width: 400,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  color: Colors.black,
                  child: Image.network(
                    imagePath,
                    fit: BoxFit.fill,
                    frameBuilder: (BuildContext context, Widget child,
                        int? frame, bool wasSynchronouslyLoaded) {
                      return child;
                    },
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return CircularProgressIndicator();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Text('Ошибка загрузки изображения');
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomContainerBoxDecoration.customDecoration,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(postEntity.postText),
            Divider(color: Colors.grey.shade300, thickness: 1, height: 10),
            SizedBox(height: 4),
            Column(
              children: generateList(context, postEntity.imageIds!),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateList(BuildContext context, List<String> imageIds) {
    return [
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: imageIds.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => _showImageOnFullScreen(context,
                'http://10.0.2.2:8000/user/profile/post/image/?image_id=${imageIds[index].replaceAll('-', '')}'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CreateImageWidget(
                  borderRadiusCircular: 8,
                  containerSize: 50,
                  imageUrl:
                      'http://10.0.2.2:8000/user/profile/post/image/?image_id=${imageIds[index].replaceAll('-', '')}'),
            ),
          );
        },
      ),
    ];
  }
}
