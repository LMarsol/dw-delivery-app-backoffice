import '../../core/global/constants.dart';
import '../../core/storage/storage.dart';
import '../../repositories/auth/auth_repository.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  LoginServiceImpl(this._repository, this._storage);

  final Storage _storage;
  final AuthRepository _repository;

  @override
  Future<void> execute(String email, String password) async {
    final auth = await _repository.login(email, password);

    _storage.setData(
      SessionStorageKeys.accessToken.key,
      auth.accessToken,
    );
  }
}
