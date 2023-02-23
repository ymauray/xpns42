import 'package:flutter/material.dart';

typedef KeyGetter<K, T> = K Function(T value);

class GroupedListView<K, T> extends StatelessWidget {
  const GroupedListView({
    required List<T> items,
    required K Function(T) keyGetter,
    required int Function(K, K) keySorter,
    required Widget Function(BuildContext, T) itemBuilder,
    required Widget Function(BuildContext, K) keyBuilder,
    super.key,
  })  : _keyGetter = keyGetter,
        _items = items,
        _keySorter = keySorter,
        _itemBuilder = itemBuilder,
        _keyBuilder = keyBuilder;

  final List<T> _items;
  final KeyGetter<K, T> _keyGetter;
  final Comparator<K> _keySorter;
  final Widget Function(BuildContext, T) _itemBuilder;
  final Widget Function(BuildContext, K) _keyBuilder;

  @override
  Widget build(BuildContext context) {
    final groups = <K, List<T>>{};
    for (final item in _items) {
      (groups[_keyGetter(item)] ??= []).add(item);
    }

    final sortedKeys = groups.keys.toList()..sort(_keySorter);

    final groupedList = <GroupedListViewItem<K, T>>[];
    for (final key in sortedKeys) {
      groupedList.add(GroupedListViewItem<K, T>(isKey: true, key: key));
      for (final item in groups[key]!) {
        groupedList.add(GroupedListViewItem<K, T>(isKey: false, item: item));
      }
    }

    return ListView.builder(
      itemCount: groupedList.length,
      itemBuilder: (context, index) {
        final item = groupedList[index];

        return item.isKey
            ? _keyBuilder(context, item.key as K)
            : _itemBuilder(context, item.item as T);
      },
    );
  }
}

class GroupedListViewItem<K, T> {
  GroupedListViewItem({
    required this.isKey,
    this.key,
    this.item,
  });

  final bool isKey;
  final K? key;
  final T? item;
}
