import 'package:dummy_full_with_clean/features/auth/data/data_sources/auth_remote_date_source.dart';
import 'package:dummy_full_with_clean/features/auth/domain/entities/user.dart';
import 'package:dummy_full_with_clean/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> signIn({required String username, required String password}) {
    return remoteDataSource.signIn(username: username, password: password);
  }


}