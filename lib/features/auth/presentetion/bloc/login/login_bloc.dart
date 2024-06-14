import 'package:bloc/bloc.dart';
import 'package:kasir_app/features/auth/data/datasources/auth_method.dart';

import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthMethod _authMethod;
  LoginBloc(this._authMethod) : super(LoginInitial()) {
    on<OnLogin>((event, emit) async {
      // TODO: implement event handler
      emit(LoginLoading());
      try {
        await _authMethod.login(event.email, event.password);
        emit(LoginLoaded());
      } catch (e) {
        emit(LoginFailure(message: e.toString()));
        emit(LoginNotReload());
      }
    });
  }
}
