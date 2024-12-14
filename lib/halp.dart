import 'dart:convert';

List<String> rows(String text) {
  var ls = LineSplitter();
  return ls.convert(text);
}

int abs(int x) => x < 0 ? -x : x;

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}
