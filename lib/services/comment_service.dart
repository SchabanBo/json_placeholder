import 'package:dio/dio.dart';

import '../models/comment.dart';
import '../widgets/notification.dart';

class CommentService {
  final Dio _dio;

  CommentService(this._dio);

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
