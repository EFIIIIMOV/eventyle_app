import 'package:eventyle_app/features/event/data/datasources/event_remote_data_source.dart';
import 'package:eventyle_app/features/event/data/models/event_model.dart';
import 'package:eventyle_app/features/event/domain/entities/event_entity.dart';
import 'package:eventyle_app/features/event/domain/repositories/event_repository.dart';

import '../../domain/entities/post_entity.dart';
import '../../domain/entities/post_image_entity.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_remote_data_source.dart';
import '../models/post_image_model.dart';
import '../models/post_model.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;

  PostRepositoryImpl({required this.postRemoteDataSource});

  @override
  Future<List<PostEntity>> getAllPosts(String user_id) async {
    final postModels = await postRemoteDataSource.getAllPosts(user_id);
    List<PostEntity> postEntities =
        postModels.map((postModel) => postModel as PostEntity).toList();
    return postEntities;
  }

  @override
  Future<void> addPost(PostEntity postEntity) async {
    final PostModel postModel = PostModel(
      post_id: postEntity.post_id,
      postText: postEntity.postText,
      imageIds: postEntity.imageIds,
    );
    await postRemoteDataSource.addPost(postModel);
    return Future.value();
  }
}
