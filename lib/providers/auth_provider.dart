import 'package:app/data/model/models.dart';
import 'package:app/data/respositories/repositories.dart';
import 'package:app/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});
