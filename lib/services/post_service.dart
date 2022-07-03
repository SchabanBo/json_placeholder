import 'package:dio/dio.dart';

import '../models/comment.dart';
import '../models/post.dart';
import '../widgets/notification.dart';

class PostService {
  final Dio _dio;
  PostService(this._dio);

  Future<List<Post>?> getPosts() async {
    try {
      final response = await _dio.get<List>('/posts');
      return response.data!.map((e) => Post.fromMap(e)).toList();
    } catch (error) {
      showNotification('Error getting posts', error.toString());
      return null;
    }
  }

  Future<Post?> getPost(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/posts/$id');
      return Post.fromMap(response.data!);
    } catch (error) {
      showNotification('Error getting post', error.toString());
      return null;
    }
  }

  Future<List<Comment>?> getComments(int postId) async {
    try {
      final response = await _dio.get<List>('/posts/$postId/comments');
      return response.data!.map((e) => Comment.fromMap(e)).toList();
    } catch (error) {
      showNotification('Error getting comments', error.toString());
      return null;
    }
  }
}
