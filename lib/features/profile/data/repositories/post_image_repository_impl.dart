import 'package:eventyle_app/features/event/data/datasources/event_remote_data_source.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/entities/post_image_entity.dart';
import '../../domain/repositories/post_image_repository.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_image_remote_data_source.dart';
import '../datasources/post_remote_data_source.dart';
import '../models/post_image_model.dart';
import '../models/post_model.dart';

class PostImageRepositoryImpl implements PostImageRepository {
  final PostImageRemoteDataSource postImageRemoteDataSource;

  PostImageRepositoryImpl({required this.postImageRemoteDataSource});

  @override
  Future<void> addPostImage(List<PostImageEntity> postImageEntityList) async {
    final List<PostImageModel> postImageModelList =
        postImageEntityList.map((postImageEntity) {
      return PostImageModel(
        image_id: postImageEntity.image_id,
        image: postImageEntity.image,
      );
    }).toList();
    await postImageRemoteDataSource.addPostImage(postImageModelList);
    return Future.value();
  }
}
