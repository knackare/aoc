﻿import 'dart:convert';

List<String> rows(String text) {
  var ls = LineSplitter();
  return ls.convert(text);
}

int abs(int x) => x < 0 ? -x : x;
