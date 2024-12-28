import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:aoc2015/halp.dart' as h;

int run() {
  var key = input;

  final max = h.pow(2, 53);

  for (var i = 1; i < max; i++) {
    var bytes = utf8.encode('$key$i');
    var dig = md5.convert(bytes).toString();

    // // Part one.
    // if (dig[0] == '0' && dig[1] == '0' && dig[2] == '0' && dig[3] == '0' && dig[4] == '0') {
    //   return i;
    // }

    // Part two
    if (dig[0] == '0' && dig[1] == '0' && dig[2] == '0' && dig[3] == '0' && dig[4] == '0' && dig[5] == '0') {
      return i;
    }
  }

  return 0;
}

var test = 'abcdef';

var input = 'iwrupvqb';
