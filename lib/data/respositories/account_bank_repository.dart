abstract class _AccountBankRepository {
  Future<void> getAccountBank(String userId);
  Future<void> addAccountBank(String userId);
  Future<void> updateAccountBank(String userId);
  Future<void> delAccountBank(String userId);
}

class AccountBankRepository extends _AccountBankRepository {
  @override
  Future<void> addAccountBank(String userId) {
    // TODO: implement addAccountBank
    throw UnimplementedError();
  }

  @override
  Future<void> delAccountBank(String userId) {
    // TODO: implement delAccountBank
    throw UnimplementedError();
  }

  @override
  Future<void> getAccountBank(String userId) {
    // TODO: implement getAccountBank
    throw UnimplementedError();
  }

  @override
  Future<void> updateAccountBank(String userId) {
    // TODO: implement updateAccountBank
    throw UnimplementedError();
  }
}
