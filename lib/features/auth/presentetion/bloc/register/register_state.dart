part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterNotLoaded extends RegisterState {}

final class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure({required this.message});
}

final class RegisterLoaded extends RegisterState {}
