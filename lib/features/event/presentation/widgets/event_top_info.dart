import 'package:flutter/material.dart';

import '../../../../constants/theme/colors.dart';
import '../../../../constants/widgets/container_box_decoration.dart';

class EventTopInfo extends StatelessWidget {
  const EventTopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: CustomContainerBoxDecoration.customDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/test_image.png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDatePlaceTextContainer(
                          title: 'Дата проведения:',
                        ),
                        CustomDatePlaceTextContainer(
                          title: 'Место проведения:',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomDescriptionTextContainer(
                title:
                    'datadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadatadata',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDatePlaceTextContainer extends StatelessWidget {
  final String title;

  const CustomDatePlaceTextContainer({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class CustomDescriptionTextContainer extends StatelessWidget {
  final String title;

  const CustomDescriptionTextContainer({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
