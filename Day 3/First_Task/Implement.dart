void main()
{

  Students std = Students() ;
  
  print(std.Username);
  print(std.age);
  std.printName();

  print(std.job);
  std.job = "Programmier";
  print(std.job);

}

abstract class Human {
  String? Username ;
  int? age ;

  void printName() ;
}

abstract class Employee {
  String? job ;
}

class Students implements Human , Employee
{

  @override
  String? Username = "Mohamed" ;

  @override
  int? age = 20 ;

  @override
  void printName() 
  {
    print("Ziyad");
  }

  @override
  String? job = "Engineer";

}
