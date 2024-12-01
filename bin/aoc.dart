import 'package:aoc/aoc.dart' as aoc;

void main(List<String> arguments) {
  const String reset = '\x1B[0m';
  const String green = '\x1B[32m';

  print('$green${aoc.run()}$reset');
}
