import 'package:dio/dio.dart';

import '../models/post.dart';
import '../models/todo.dart';
import '../models/user.dart';
import '../widgets/notification.dart';

class UserService {
  final Dio _dio;

  UserService(this._dio);

  Future<User?> getUserInfo(int userId) async {
    try {
      final response = await _dio.get<String>('/users/$userId');
      return User.fromJson(response.data!);
    } catch (error) {
      showNotification('Error getting users', error.toString());
      return null;
    }
  }

  Future<List<Post>?> getPosts(int userId) async {
    try {
      final response = await _dio.get<List>('/users/$userId/posts');
      return response.data!.map((e) => Post.fromMap(e)).toList();
    } catch (error) {
      showNotification('Error getting posts', error.toString());
      return null;
    }
  }

  Future<List<Todo>?> getTodos(int userId) async {
    try {
      final response = await _dio.get<List>('/users/$userId/todos');
      return response.data!.map((e) => Todo.fromMap(e)).toList();
    } catch (error) {
      showNotification('Error getting todos', error.toString());
      return null;
    }
  }
}
