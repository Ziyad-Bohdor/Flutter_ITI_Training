import 'package:flutter/material.dart';

class  CalculatorIconButton extends StatelessWidget {

  final Color color ;

  final Icon icon ;

  final VoidCallback onPressed;
  
  const CalculatorIconButton({super.key, required this.color, required this.icon, required this.onPressed}) ;

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

                child: icon 

            );
  }
}