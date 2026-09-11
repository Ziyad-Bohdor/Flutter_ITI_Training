import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int counter = 0 ;

  void increament()
  {
          setState(() {
            counter++ ;
          });
  }

  void decreament()
  {
            if(counter>0)
            {
              setState(() {
                counter-- ;
              });
            }
            
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Flutter ITI"),
        centerTitle: false,
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: 
        [

        FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.blue,
        onPressed: increament ,
        child: Icon(Icons.add,color: Colors.black),
        ),
        
        const SizedBox(width: 15) ,

        FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.blue,
        onPressed: decreament ,
        child: Icon(Icons.remove,color: Colors.black),
        ),

        ]
      ),

      body: Padding(
        padding: EdgeInsets.only(left:10,top:10) ,
        child: Text("Counter Now = $counter"),
        ),
      
    );
  }
}
