import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/features/food_delivery/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreferences prefs;
  AuthBloc(this.prefs) : super(AuthInitial()) {
    on<LogInEvent>(onLogIn);
    on<LogOutEvent>(onLogOut);
    on<CheckAuthEvent>(onCheckAuth);
  }

  Future<void> onLogIn(LogInEvent event, Emitter<AuthState> emit) async {
    await prefs.setBool('isAuth', true);
    final user = UserEntity(
      name: prefs.getString('name')!,
      email: prefs.getString('email')!,
      phone: prefs.getString('phone')!,
    );
    emit(AuthorizedState(user: user));
  }

  void onLogOut(LogOutEvent event, Emitter<AuthState> emit) {
    prefs.setBool('isAuth', false);
    emit(const UnAuthorizedState());
  }

  Future<void> onCheckAuth(
      CheckAuthEvent event, Emitter<AuthState> emit) async {
    if (!prefs.containsKey('isAuth')) {
      await prefs.setBool('isAuth', false);
      await prefs.setString('name', 'Вячеслав');
      await prefs.setString('phone', '+7 999 999 99 99');
      await prefs.setString('email', 'wVhXU@example.com');
      emit(const UnAuthorizedState());
    } else if (prefs.getBool('isAuth')!) {
      final user = UserEntity(
        name: prefs.getString('name')!,
        email: prefs.getString('email')!,
        phone: prefs.getString('phone')!,
      );
      emit(AuthorizedState(user: user));
    } else {
      emit(const UnAuthorizedState());
    }
  }
}
