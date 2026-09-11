void main()
{

    // First Example 

    Set<String> students = {"Ziyad","Mohamed","Abdo"};
    
    students.addAll({"Ahmed","Karem"});
    print(students);

    students.removeAll({"Karem","Ahmed"});
    print(students);

    print(students.elementAt(1));
    print(students);

    // Second Example 

    List<String> names = ["Ahmed", "Ali", "Omar", "Ahmed", "Ali"] ;

    print(names);

    Set<String> Names = names.toSet() ;

    print(Names) ;


}