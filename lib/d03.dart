import 'dart:io';

Future<int> run() async {
  var input = await inp();

  print(input);

  var muls = findMul(input);

  var sum = 0;
  for (final x in muls) {
    sum += x.$1 * x.$2;
  }

  return sum;
}

Iterable<(int, int)> findMul(String text) sync* {
  final len = text.length;
  var idx = 0;

  // part 2
  bool go = true;

  while (idx < len - 3) {
    if (    text[idx] == "d" &&
        text[idx + 1] == "o" &&
        text[idx + 2] == "(" &&
        text[idx + 3] == ")") {
      go = true;
    } else if (text.length > idx + 6 &&
            text[idx] == "d" &&
        text[idx + 1] == "o" &&
        text[idx + 2] == "n" &&
        text[idx + 3] == "'" &&
        text[idx + 4] == "t" &&
        text[idx + 5] == "(" &&
        text[idx + 6] == ")") {
      go = false;
    }

    if (text[idx] == "m" &&
        text[idx + 1] == "u" &&
        text[idx + 2] == "l" &&
        text[idx + 3] == "(") {
      // candidate

      if (idx + 7 > len) {
        return; // too little room left
      }

      var next = idx + 4;

      var buffer = StringBuffer();
      while (next < len) {
        buffer.write(text[next]);

        if (text[next] == ')') {
          break;
        }

        next++;
      }

      var potential = validSeq(buffer.toString());

      if (go && potential != null) {
        yield potential;
      }
    }

    idx++;
  }
}

(int, int)? validSeq(String candidate) {
  if (candidate.isEmpty) return null;

  var parts = candidate.split(',');

  if (parts.length != 2) return null;

  var first = int.tryParse(parts[0]);
  if (first == null) return null;

  if (parts[1][parts[1].length - 1] != ')') return null;

  var parts2 = parts[1].split(')');

  // hack ["4", ""]
  if (parts2.length != 2 && parts2[1] != '') return null;

  var second = int.tryParse(parts2[0]);

  if (second == null) return null;

  return (first, second);
}

Future<String> ti() => Future.value(
    "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))");

Future<String> inp() {
  final file = File('lib/d03.in');

  return file.readAsString();
}
