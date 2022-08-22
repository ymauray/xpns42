import 'package:flutter_riverpod/flutter_riverpod.dart';

final booksProvider = FutureProvider(
  (ref) => Future.delayed(const Duration(seconds: 7), () => <String>[]),
);
