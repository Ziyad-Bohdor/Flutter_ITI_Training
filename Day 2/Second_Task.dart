import 'dart:io';

void main() {
  do {
    List<int> numbers = [];
    List<String> operations = [];

    print("Enter Number : ");
    String input = stdin.readLineSync()!;
    int? number = int.tryParse(input);

    while (number == null) {
      print("Error Please Enter real integer Number");

      print("Enter Number : ");
      input = stdin.readLineSync()!;
      number = int.tryParse(input);
    }

    numbers.add(number);

    int? operationNumber;

    print("Choose Your First Operation 1)+  2)-  3)*  4)/");

    operationNumber = int.tryParse(stdin.readLineSync()!);

    while (operationNumber == null || operationNumber < 1 || operationNumber > 4) {
      
      print("Error Please choose operation from 1 to 4");

      print("Choose Your First Operation 1)+  2)-  3)*  4)/");

      operationNumber = int.tryParse(stdin.readLineSync()!);
    }

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
    number = int.tryParse(input);

    while (number == null) {
      print("Error Please Enter real integer Number");

      print("Enter Number : ");
      input = stdin.readLineSync()!;
      number = int.tryParse(input);
    }

    numbers.add(number);

    while (true) {
      print("Choose Your Operation 1)+  2)-  3)*  4)/  5)=");

      operationNumber = int.tryParse(stdin.readLineSync()!);

      while (operationNumber == null ||
          operationNumber < 1 ||
          operationNumber > 5) {
        print(
            "Error Please choose operation from those and Enter its Number");

        print("Choose Your Operation 1)+  2)-  3)*  4)/  5)=");

        operationNumber = int.tryParse(stdin.readLineSync()!);
      }

      if (operationNumber == 5) {
        break;
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
      number = int.tryParse(input);

      while (number == null) {
        print("Error Please Enter real integer Number");

        print("Enter Number : ");
        input = stdin.readLineSync()!;
        number = int.tryParse(input);
      }

      numbers.add(number);
    }

    int i = 0;

    while (i < operations.length) {
      if (operations[i] == "*" || operations[i] == "/") {
        if (operations[i] == "*") {
          numbers[i] = numbers[i] * numbers[i + 1];
        } else {
          numbers[i] = numbers[i] ~/ numbers[i + 1];
        }

        numbers.removeAt(i + 1);
        operations.removeAt(i);
      } else {
        i++;
      }
    }

    int result = numbers[0];

    for (int i = 0; i < operations.length; i++) {
      if (operations[i] == "+") 
      {
        result += numbers[i + 1];
      } 
      else if (operations[i] == "-") 
      {
        result -= numbers[i + 1];
      }
    }

    print("Result = $result");

    print("Do you want to calculate again? (y/N)");
    String again = stdin.readLineSync()!;

    if (again.toLowerCase() != "y") {
      break;
    }
  } while (true);

}
