import 'package:dart_basics/dart_basics.dart';

void main() {
  DelimetersCalculator calculator = DelimetersCalculator();
  
  print('НОД(6, 9) = ' + calculator.gcd(6, 9).toString());
  print('НОК(12, 9) = ' + calculator.lcm(12, 9).toString());

  NumeralSystemConverter numeralSystem = NumeralSystemConverter();
  
  print('11 в двоичной = ' + numeralSystem.decimalToBinary(11).toString());
  print('1011 в десятричной = ' + numeralSystem.binaryToDecimal('1011').toString());

  Converter converter = Converter();

  print(converter.toNumbersList('   text 123 5   d  e1 3r   8 '));
  print(converter.toMap([ 'a', 'b', 'a', 'ab', 'a' ]));
  print(converter.fromNumbersNamesToNumbersList('one, two, zero, zero'));
  print(converter.fromNumbersNamesToNumbersList('one, two, three, cat, dog'));
}