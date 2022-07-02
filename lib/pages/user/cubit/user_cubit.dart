import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../models/post.dart';
import '../../../models/todo.dart';
import '../../../models/user.dart';
import '../../../services/user_service.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserService userService;
  UserCubit(this.userService) : super(UserLoading()) {
    load(QR.params['userId']!.asInt!);
    // Add listener to the parameters, so the user info will be updated
    // when the route is changed to new user id (e.g. /users/:userId)
    QR.params['userId']?.onChange = (old, newValue) {
      load(int.parse(newValue.toString()));
    };
  }

  @override
  Future<void> close() async {
    // Clean up
    QR.params['userId']?.onChange = null;
    super.close();
  }

  Future<void> load(int userId) async {
    emit(UserLoading());
    try {
      final user = await userService.getUserInfo(userId);
      final posts = await userService.getPosts(userId);
      final todos = await userService.getTodos(userId);

      if (user == null || posts == null || todos == null) {
        emit(UserError('Error loading user'));
      } else {
        emit(UserLoaded(user, posts, todos));
      }
    } catch (error) {
      emit(UserError(error.toString()));
    }
  }
}
