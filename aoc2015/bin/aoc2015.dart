import 'package:aoc2015/d04.dart' as aoc;

void main(List<String> arguments) async {
  const String reset = '\x1B[0m';
  const String green = '\x1B[32m';

  print('$green${await aoc.run()}$reset');
}
