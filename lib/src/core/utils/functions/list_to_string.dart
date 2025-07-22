String listToString(List<String> list) {
  if (list.isEmpty) return '';

  if (list.length == 1) return list[0];
  if (list.length == 2) return '${list[0]} and ${list[1]}';

  final last = list.last;
  final initial = list.sublist(0, list.length - 1).join(', ');
  return '$initial, and $last';
}
