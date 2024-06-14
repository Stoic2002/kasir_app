import 'package:bloc/bloc.dart';
import 'package:kasir_app/features/auth/data/datasources/auth_method.dart';
import 'package:kasir_app/features/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthMethod _authMethod;
  RegisterBloc(this._authMethod) : super(RegisterInitial()) {
    on<OnRegister>((event, emit) async {
      // TODO: implement event handler
      emit(RegisterLoading());
      try {
        await _authMethod.register(event.userModel);
        emit(RegisterLoaded());
      } catch (e) {
        emit(RegisterFailure(message: e.toString()));
        emit(RegisterNotLoaded());
      }
    });
  }
}
