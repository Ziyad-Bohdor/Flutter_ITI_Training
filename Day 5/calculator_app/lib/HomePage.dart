import 'package:calculator_app/Custom_widget/CalculatorButton.dart';
import 'package:calculator_app/Custom_widget/CalculatorIconButton.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    String display = "0" ;

    List<double> numbers = [];
    List<String> operations = [];

    void numberpressed(String Number)
    {

      setState(() {
        if(display=="0")
      {
        display = Number ;
      }

      else
      {
        display += Number ;
      }
      });

    }

    // Pressed on . 

    void decimalpressed()
    {

      setState(() {
        if(!display.contains(".")){
          display += "." ;
        }
      });

    }

    // Pressed on AC 

    void clearPressed()
    {

      setState(() {
        display = "0" ;
        numbers.clear() ;
        operations.clear() ;
      });

    }

    // Pressed on +/- 

    void plusMinusPressed()
    {

      setState(() {
        if(display!="0")
        {

          if(display.startsWith("-"))
          {
            display = display.substring(1);
          }

          else
          {
            display = "-$display" ;
          }

        }
      });

    }

    // Pressed on % 

    void percentPressed()
    {

      setState(() {

        double number = double.parse(display) ;
        number /= 100 ;

        display = formatNumber(number) ;
        
      });

    }

    // + - x ÷

    void operationPressed(String selectedOperation)
    {

    setState(() {

    numbers.add(double.parse(display));
    operations.add(selectedOperation);

    display = "0";

  });

    }

    // pressed on =

    void equalPressed()
{
    setState(() {

    numbers.add(double.parse(display));

    List<double> newNumbers = [];
    List<String> newOperations = [];

    double currentNumber = numbers[0];

    for(int i = 0; i < operations.length; i++)
    {
      if(operations[i] == "x")
      {
        currentNumber *= numbers[i + 1];
      }
      else if(operations[i] == "÷")
      {
        if(numbers[i + 1] == 0)
        {
          display = "Error";
          numbers.clear();
          operations.clear();
          return;
        }

        currentNumber /= numbers[i + 1];
      }
      else
      {
        newNumbers.add(currentNumber);
        newOperations.add(operations[i]);

        currentNumber = numbers[i + 1];
      }
    }

    newNumbers.add(currentNumber);

    double result = newNumbers[0];

    for(int i = 0; i < newOperations.length; i++)
    {
      if(newOperations[i] == "+")
      {
        result += newNumbers[i + 1];
      }
      else if(newOperations[i] == "-")
      {
        result -= newNumbers[i + 1];
      }
    }

    display = formatNumber(result);

    numbers.clear();
    operations.clear();
  });
}
    
    // 5.0 Apper 5
    String formatNumber(double number) 
    {

    if (number == number.toInt()) {
      return number.toInt().toString();
    }

    return number.toString();
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [

          Container(
            padding: EdgeInsets.only(right: 25),
            alignment: Alignment.centerRight,
            child: Text(
            display ,
            style: TextStyle(
              fontSize: 50 ,
              fontWeight: FontWeight.bold ,
              color: Colors.white ,
            ),
            ) 
          ),

          const SizedBox(height: 10) ,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "AC" ,
                onPressed: clearPressed ,
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "+/-" ,
                onPressed: plusMinusPressed,
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "%" ,
                onPressed: percentPressed,
              ),

              CalculatorButton(
                color: Color.fromRGBO(252, 179, 73, 1) ,
                operation: "÷" ,
                onPressed: () => operationPressed("÷"),
              ),

            ],
          ),

          const SizedBox(height: 10) ,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "7" ,
                onPressed: () => numberpressed("7") ,
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "8" ,
                onPressed: () => numberpressed("8") ,
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "9" ,
                onPressed: () => numberpressed("9") , 
              ),

              CalculatorButton(
                color: Color.fromRGBO(252, 179, 73, 1) ,
                operation: "x" ,
                onPressed: () => operationPressed("x") ,
              ),

            ],
          ),

          const SizedBox(height: 10) ,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "4" ,
                onPressed: () => numberpressed("4") ,
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "5" ,
                onPressed: () => numberpressed("5") ,
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "6" ,
                onPressed: () => numberpressed("6") ,
              ),

              CalculatorIconButton(
                color: Color.fromRGBO(252, 179, 73, 1) ,
                icon: Icon(Icons.remove, color: Colors.white, size: 30) ,
                onPressed: () => operationPressed("-"),
              ),

            ],
          ),

          const SizedBox(height: 10) ,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "1" ,
                onPressed: () => numberpressed("1"),
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "2" ,
                onPressed: () => numberpressed("2"),
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "3" ,
                onPressed: () => numberpressed("3"),
              ),

              CalculatorIconButton(
                color: Color.fromRGBO(252, 179, 73, 1) ,
                icon: Icon(Icons.add, color: Colors.white, size: 30) ,
                onPressed: () => operationPressed("+"),
              ),

            ],
          ),

          const SizedBox(height: 10) ,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              CalculatorIconButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                icon: Icon(Icons.calculate_outlined, color: Colors.white , size: 30) ,
                onPressed: () {},
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "0" ,
                onPressed: () => numberpressed("0"),
              ),

              CalculatorButton(
                color: Color.fromRGBO(93, 93, 91 ,1) ,
                operation: "." ,
                onPressed: decimalpressed,
              ),

              CalculatorButton(
                color: Color.fromRGBO(252, 179, 73, 1) ,
                operation: "=" ,
                onPressed: equalPressed,
              ),

            ],
          ),

          ],

          )
        ),
      );
  }
}