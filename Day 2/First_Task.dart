void main()
{

  // Type Test Operators 
    
    // First State 

    int value = 10 ;

    // ignore: unnecessary_type_check
    if(value is int)
    {
      print("Value is an integer");
    }

    print("===========================");

      // Second State 

      String Word = "Hello";

      if (Word is! int) 
      {

        print("value is NOT an integer");
        print(Word.runtimeType);

      }

      print("===========================");

      // Third State 

    var word = "Hello";

    // ignore: unnecessary_cast
    String text = word as String;

    print(text);


}