import 'dart:convert';

List<String> rows(String text) {
  var ls = LineSplitter();
  return ls.convert(text);
}

int abs(int x) => x < 0 ? -x : x;

int pow(int x, int n) {
  int val = 1;

  for (var i = 0; i < n; i++) {
    val *= x;
  }

  return val;
}
