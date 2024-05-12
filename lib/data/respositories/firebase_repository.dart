import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';

abstract class _FirebaseRepository {
  Future<void> initConfigProject();
}

class FirebaseRepositoryApp extends _FirebaseRepository {
  FirebaseRepositoryApp();
  final logger = Logger();
  @override
  Future<void> initConfigProject() async {
    late final FirebaseApp app;
    late final FirebaseAuth auth;

    app = await Firebase.initializeApp();
    logger.d(app);
    auth = FirebaseAuth.instanceFor(app: app);
    logger.d(auth);
  }
}
