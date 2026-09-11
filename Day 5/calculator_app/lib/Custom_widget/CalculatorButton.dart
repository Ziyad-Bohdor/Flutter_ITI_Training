import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {

  final Color color ;

  final String operation ;

  final VoidCallback onPressed;
  
  const CalculatorButton({super.key, required this.color, required this.operation, required this.onPressed}) ;

  @override
  Widget build(BuildContext context) {

    return MaterialButton(
                minWidth: 75 ,
                height: 75,
                color: color ,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),

              onPressed: onPressed ,

              child: Text(
                operation,
                style: TextStyle(
                  fontSize: 30 ,
                  fontWeight: FontWeight.bold ,
                  color: Colors.white ,
                ),
                ),
              );
  }
}