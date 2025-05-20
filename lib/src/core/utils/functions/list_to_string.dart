String listToString(List<String> list) {
  String val = '';
  List<String> list0 = [...list];
  if (list.length > 2) {
    String lastTech = list0[list0.length - 1];
    list0.remove(lastTech);

    val = list0.join(', ');
    val = '$val, and $lastTech';
  } else {
    val = list0.join(', ');
  }

  return val;
}
