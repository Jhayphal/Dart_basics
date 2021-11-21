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

class Point {
  int X;
  int Y;
  int Z;

  Point(this.X, this.Y, this.Z);

  factory Point.zero() {
    return Point(0, 0, 0);
  }

  factory Point.one() {
    return Point(1, 1, 1);
  }

  factory Point.oneX() {
    return Point(1, 0, 0);
  }

  factory Point.oneY() {
    return Point(0, 1, 0);
  }

  factory Point.oneZ() {
    return Point(0, 0, 1);
  }

  double distanceTo(Point other) {
    var x = other.X - X;
    x *= x;

    var y = other.Y - Y;
    y *= y;

    var z = other.Z - Z;
    z *= z;

    return sqrt(x + y + z);
  }

  static double getTriangleSquare(Point a, Point b, Point c) {
    var ab = a.distanceTo(b);
    var bc = b.distanceTo(c);
    var ac = a.distanceTo(c);

    var p = (ab + bc + ac) / 2;

    return sqrt(p * (p - ab) * (p - bc) * (p - ac));
  }
}

class MySqrt {
  static double calc(double value, int n) {
    if (value < 0 && (n & 1) == 0) {
      throw ArgumentError('Корень чётной степени из отрицательного числа не существует в области вещественных чисел.');
    }
    
    double eps = 0.00001;
    double root = value / n;
    double rn = value;
    
    int counter = 0;
    
    while(_abs(root - rn) >= eps){
        rn = value;

        for(int i = 1; i < n; i++) {
            rn = rn / root;
        }

        root = 0.5 * (rn + root);
        
        ++counter;
    }

    return root;
  }

  static double _abs(double value) {
    if (value < 0) {
      return -value;
    }

    return value;
  }
}

class User {
  String email;

  User(this.email);
}

class AdminUser extends User with MailSystem {
  AdminUser(String email) : super(email);
}

class GeneralUser extends User {
  GeneralUser(String email) : super(email);
}

mixin MailSystem implements User {
  String getMailSystem() {
    return email.split('@').last;
  }
}

class UserManager<T extends User> {
  final List<T> _users = <T>[];

  void add(T user) {
    _users.add(user);
  }

  bool remove(T user) {
    return _users.remove(user);
  }

  List<String> getAllUserEmails() {
    List<String> result = <String>[];

    for (var user in _users) {
      if (user is AdminUser) {
        result.add(user.getMailSystem());
      }
      else {
        result.add(user.email);
      }
    }

    return result;
  }
}