import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'long_operation_status_provider.g.dart';

@riverpod
class LongOperationStatus extends _$LongOperationStatus {
  @override
  bool build() {
    return false;
  }

  void start() {
    state = true;
  }

  void stop() {
    state = false;
  }
}
