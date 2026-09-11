import 'dart:io';
import 'dart:math';

void main() {
  do {

    List<double> numbers = [];
    List<String> operations = [];

    print("Enter Number : ");
    String input = stdin.readLineSync()!;
    double? number = double.tryParse(input);

    while (number == null) {
      print("Error Please Enter a valid Number");

      print("Enter Number : ");
      input = stdin.readLineSync()!;
      number = double.tryParse(input);
    }

    numbers.add(number);

    int? operationNumber;

    print("Choose Your First Operation:");
    print("1)+   2)-   3)*   4)/   5)√    6)^");

    operationNumber = int.tryParse(stdin.readLineSync()!);

    while (operationNumber == null || operationNumber < 1 || operationNumber > 6)
      {
      
      print("Error Please choose a valid operation");

      print("Choose Your First Operation:");
      print("1)+  2)-  3)*  4)/  5)√  6)^");

      operationNumber = int.tryParse(stdin.readLineSync()!);
      }

    if (operationNumber == 5) {
      while (numbers[0] < 0) {
        print("Error! Square Root cannot be calculated for a negative number.");

        print("Enter Positive Number : ");
        input = stdin.readLineSync()!;
        number = double.tryParse(input);

        while (number == null) {
          print("Error Please Enter a valid Number");

          print("Enter Number : ");
          input = stdin.readLineSync()!;
          number = double.tryParse(input);
        }

        numbers[0] = number;
      }

      numbers[0] = sqrt(numbers[0]);

      print("Result = ${numbers[0]}");
    }

    else if (operationNumber == 6) {
      print("Enter Power : ");

      input = stdin.readLineSync()!;
      double? power = double.tryParse(input);

      while (power == null) {
        print("Error Please Enter a valid Number");

        print("Enter Power : ");
        input = stdin.readLineSync()!;
        power = double.tryParse(input);
      }

      numbers[0] = pow(numbers[0], power).toDouble();

      print("Result = ${numbers[0]}"); 
    }

    else {
      String operation;

      if (operationNumber == 1) {
        operation = "+";
      } else if (operationNumber == 2) {
        operation = "-";
      } else if (operationNumber == 3) {
        operation = "*";
      } else {
        operation = "/";
      }

      operations.add(operation);

      print("Enter Number : ");
      input = stdin.readLineSync()!;
      number = double.tryParse(input);

      while (number == null) {
        print("Error Please Enter a valid Number");

        print("Enter Number : ");
        input = stdin.readLineSync()!;
        number = double.tryParse(input);
      }

      numbers.add(number);

      while (true) {
        print("Choose Your Operation:");
        print("1)+    2)-    3)*    4)/   5)√    6)^    7)= ");

        operationNumber = int.tryParse(stdin.readLineSync()!);

        while (operationNumber == null ||
            operationNumber < 1 ||
            operationNumber > 7) {
          print("Error Please choose operation from 1 to 7");

          print("Choose Your Operation:");
          print("1)+    2)-    3)*    4)/   5)√    6)^    7)= ");

          operationNumber = int.tryParse(stdin.readLineSync()!);
        }

        if (operationNumber == 7) {
          break;
        }

        if (operationNumber == 5) {
          if (numbers.last < 0) {
            print(
                "Error! Square Root cannot be calculated for a negative number.");
            continue;
          }

          numbers[numbers.length - 1] =
              sqrt(numbers[numbers.length - 1]);

          print("Square Root Applied.");
          continue;
        }

        if (operationNumber == 6) {
          print("Enter Power : ");

          input = stdin.readLineSync()!;
          double? power = double.tryParse(input);

          while (power == null) {
            print("Error Please Enter a valid Number");

            print("Enter Power : ");
            input = stdin.readLineSync()!;
            power = double.tryParse(input);
          }

          numbers[numbers.length - 1] =
              pow(numbers[numbers.length - 1], power).toDouble();

          print("Power Applied.");
          continue;
        }

        if (operationNumber == 1) {
          operation = "+";
        } else if (operationNumber == 2) {
          operation = "-";
        } else if (operationNumber == 3) {
          operation = "*";
        } else {
          operation = "/";
        }

        operations.add(operation);

        print("Enter Number : ");
        input = stdin.readLineSync()!;
        number = double.tryParse(input);

        while (number == null) {
          print("Error Please Enter a valid Number");

          print("Enter Number : ");
          input = stdin.readLineSync()!;
          number = double.tryParse(input);
        }

        numbers.add(number);
      }

      int i = 0;

      while (i < operations.length) {
        if (operations[i] == "*" || operations[i] == "/") {
          if (operations[i] == "*") {
            numbers[i] = numbers[i] * numbers[i + 1];
          } else {
            if (numbers[i + 1] == 0) {
              print("Error! Cannot divide by zero.");
              return;
            }

            numbers[i] = numbers[i] / numbers[i + 1];
          }

          numbers.removeAt(i + 1);
          operations.removeAt(i);
        } else {
          i++;
        }
      }

      double result = numbers[0];

      for (int i = 0; i < operations.length; i++) {
        if (operations[i] == "+") {
          result += numbers[i + 1];
        } else if (operations[i] == "-") {
          result -= numbers[i + 1];
        }
      }

      print("Result = $result");
    }

    print("Do you want to calculate again? (y/N)");

    String again = stdin.readLineSync()!;

    if (again.toLowerCase() != "y") {
      break;
    }

  } while (true);
}