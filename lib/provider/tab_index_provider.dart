import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab_index_provider.g.dart';

@riverpod
class TabIndex extends _$TabIndex {
  @override
  int build() {
    return 0;
  }

  // ignore: use_setters_to_change_properties
  void update(int value) {
    state = value;
  }
}
