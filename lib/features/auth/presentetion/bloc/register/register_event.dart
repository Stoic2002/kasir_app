part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class OnRegister extends RegisterEvent {
  final UserModel userModel;

  OnRegister({required this.userModel});
}
