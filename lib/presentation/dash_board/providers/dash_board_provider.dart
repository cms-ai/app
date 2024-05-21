import 'package:app/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navBarProvider = StateProvider<int>((ref) => 0);

final filterTransactionProvider =
    StateProvider<FilterType>((ref) => FilterType.toDay);
