import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginMthod(
      {required String email, required String password}) async {
    var auth = FirebaseAuth.instance;

    emit(LoginLoading());
    try {
      // ignore: unused_local_variable
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());

    } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              emit(LoginFailure(errMsg: 'User is not found'));
                            } else if (e.code == 'wrong-password') {
                              emit(LoginFailure(errMsg: 'wrong password, please try again'));
                                
                            }
                          }
    on Exception {
      emit(LoginFailure(errMsg: 'something went wrong'));
    }
  }
}
