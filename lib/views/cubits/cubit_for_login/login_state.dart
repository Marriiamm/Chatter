// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {}

// ignore: must_be_immutable
class LoginFailure extends LoginState {
  String errMsg;
  LoginFailure({
    required this.errMsg,
  });
}
