enum TransactionActionEnum {
  add,
  edit,
  delete,
}

extension TransactionActionEnumExt on TransactionActionEnum {
  String getContentButton() {
    switch (this) {
      case TransactionActionEnum.add:
        return "Add";
      case TransactionActionEnum.edit:
        return "Edit";
      case TransactionActionEnum.delete:
        return "Delete";
    }
  }
}
