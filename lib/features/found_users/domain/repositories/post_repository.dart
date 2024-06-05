import '../entities/user_post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getAllPosts(String user_id);

  Future<void> addPost(PostEntity postEntity);
}
