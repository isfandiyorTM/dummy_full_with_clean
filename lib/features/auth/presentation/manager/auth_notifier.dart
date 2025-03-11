import 'package:dummy_full_with_clean/features/auth/domain/use_cases/sign_in_usecase.dart';
import 'package:dummy_full_with_clean/features/auth/presentation/manager/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState>{
  final SignInUseCase signInUseCase;

  AuthNotifier({required this.signInUseCase}) :  super(AuthInitial());

  Future<void> singIn(String username,String password) async{
    try{
      state = AuthLoading();
      final user = await signInUseCase(username: username , password:  password);
      state = AuthSuccess(user: user);
    }catch (e){
      state = AuthError( message:e.toString(), );
    }
  }
}