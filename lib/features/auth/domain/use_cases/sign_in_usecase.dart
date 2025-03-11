import 'package:dummy_full_with_clean/features/auth/domain/entities/user.dart';
import 'package:dummy_full_with_clean/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase{
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User> call({required String username,required String password}){
    return repository.signIn(username: username, password: password);
  }
}