import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../exceptions/repository_exception.dart';
import '../../exceptions/unauthorized_exception.dart';
import '../../models/auth_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dio);

  final CustomDio _dio;

  @override
  Future<AuthModel> login(String email, String password) async {
    try {
      final result = await _dio.unauth().post(
        '/auth',
        data: {
          'admin': true,
          'email': email,
          'password': password,
        },
      );

      return AuthModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 403) {
        log('Login ou senha inválido(s)', error: e, stackTrace: s);
        throw UnauthorizedException();
      }

      log('Erro ao realizar login', error: e, stackTrace: s);
      throw RepositoryException('Erro ao realizar login');
    }
  }
}
