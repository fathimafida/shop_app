import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/auth/model/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void loginUser({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await Dio().post("https://fakestoreapi.com/auth/login",
          data: {"email": email, "password": password});

      emit(AuthSuccess(User.fromJson(user.data)));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        emit(AuthError("Wrong email or password"));
      }

      emit(AuthError(e.toString()));
    }
  }
}
