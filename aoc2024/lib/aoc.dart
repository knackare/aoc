import 'dart:convert';

int run() {
  var ls = LineSplitter();
  var vals = ls.convert(ti);

  for (var i = 0; i < vals.length; i++) {
    print('${vals[i]}: ${conv(vals[i])}');
  }

  return 6 * 7;
}

int conv(String roman) {
  var sum = 0;

  for (var i = 0; i < roman.length; i++) {
    var curr = rta[roman[i]]!;

    for (var j = i + 1; j < roman.length; j++) {
      if (rta[roman[j]]! > curr) {
        curr = -curr;
        break;
      }
    }

    sum += curr;
  }

  return sum;
}

const rta = {
  "I": 1,
  "V": 5,
  "X": 10,
  "L": 50,
  "C": 100,
  "D": 500,
  "M": 1000,
};

const ti = '''
CDXCIX
ID
IV
IIIIV
IIIIIIV
XXX
III
V
XIV
VIX
''';
