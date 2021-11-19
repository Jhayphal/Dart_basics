library dart_basics;

import 'dart:math';

class DelimetersCalculator {
  
  int gcd(int a, int b) {
    
    while (b != 0) {
        var temp = b;
        b = a % b;
        a = temp;
    }

    return a;
  }

  int lcm(int a, int b) {
    return (a / gcd(a, b)).truncate() * b;
  }

}

class NumeralSystemConverter {

  String decimalToBinary(int decimalNumber) {
      var binaryNumber = "";

      while (decimalNumber > 0)
      {
          binaryNumber = (decimalNumber % 2).toString() + binaryNumber;

          decimalNumber = decimalNumber >> 1;
      }

      return binaryNumber;
  }

  int binaryToDecimal(String binaryNumber)
  {
      var exponent = 0;
      var result = 0;

      for (var i = binaryNumber.length - 1; i >= 0; i--) {
          if (binaryNumber[i] == '1') {
            result = result + pow(2, exponent).toInt();
          }

          exponent++;
      }

      return result;
  }
}

class Converter {

  Map<String, int> toMap(List<String> data) {
    Map<String, int> result = <String, int>{};

    for (var element in data) {
      result[element] = (result[element] ?? 0) + 1;
    }

    return result;
  }

  List<num> toNumbersList(String text) {
    List<num> result = <num>[];
    
    var parts = text.split(' ');
    
    for (var part in parts) {
      if (_isNumeric(part)) {
        result.add(num.parse(part));
      }
    }

    return result;
  }

  List<int> fromNumbersNamesToNumbersList(String text) {
    List<int> result = <int>[];
    
    Map<String, int> names = {
      'zero': 0,
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9
    };

    var parts = text
      .replaceAll(',', ' ')
      .split(' ');
    
    int? lastNumber; 

    for (var part in parts) {
      var number = names[part];

      if (number != null && number != lastNumber) {
        result.add(number);

        lastNumber = number;
      }
    }

    return result;
  }

  bool _isNumeric(String s) {
    return double.tryParse(s) != null;
  }

}