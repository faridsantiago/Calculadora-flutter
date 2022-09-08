// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Operations extends StatefulWidget{
  const Operations({Key? key}) : super(key: key);
  @override
  State <StatefulWidget> createState()=>Mathlogical();
  
}


class Mathlogical extends State<Operations>{
  
  int result= 0;
  final textStyle =  const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20);

  dynamic number1;
  dynamic number2;

  String temp='0';
  String output='0';
  String history='';
  String operations='';

  Widget buildbutton(String buttonValue, int flexValue){
    
    return Expanded(
      
      flex: flexValue,
      child: Container(
        
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(62, 110, 72, 72)
          ),
          onPressed: (){
            butonEdition(buttonValue);
          },

          //Diseño de los botones

          child: Container(
            
            padding: const EdgeInsets.all(10),
            child: Text(
              buttonValue,
              style: const TextStyle(
                color: Color.fromARGB(235, 251, 255, 5),fontSize: 30)
              ),
            ),

          ),

        ),
      );
  }

  //Diseño de la pantalla
  @override 
  Widget build(BuildContext context){
    
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 4, 15, 30),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 249, 16, 16),
        title: Text('Calculadora Simple',style: textStyle,),
      ),

      body: Column(
        children: [
          const Expanded(
            child: Divider()
          
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical:0, horizontal: 13 ),
            child: Text(
              history,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 255, 255, 255)
                
              
              ),
            ),
          ),
          
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(12.5, 12.5, 12.5, 25),
            
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),

          //Diseño de los botones  
          Column(
            children: [
              Row(
                children: [
                  buildbutton("AC", 3),
                  buildbutton("/", 1)
                ],
              ),

              Row(
                children: [
                  buildbutton("7", 1),
                  buildbutton("8", 1),
                  buildbutton("9", 1),
                  buildbutton("x", 1),
                ],
              ),

              Row(
                children: [
                  buildbutton("4", 1),
                  buildbutton("5", 1),
                  buildbutton("6", 1),
                  buildbutton("-", 1),
                ],
              ),
              Row(
                children: [
                  buildbutton("1", 1),
                  buildbutton("2", 1),
                  buildbutton("3", 1),
                  buildbutton("+", 1),
                ],
              ),

              Row(
              children: [
                buildbutton("0", 1),
                buildbutton(".", 1),
                buildbutton("=", 2),
              ],
            ),
            ],
          )
        ],
      ),
    );
  }

//LOGICA DE OPERACIÓNES 
 void butonEdition( buttonValue){
    setState(() {
      if (buttonValue == 'AC') {
                temp = '0';
                number1 = 0;
                number2 = 0;
                operations = "";
                
              }else if (buttonValue == '+' || buttonValue == '-' || buttonValue == 'x' || buttonValue == '/') {
                
                number1 = double.parse(output);
                operations = buttonValue;
                temp = '0';

              } else if (buttonValue == '.') {

                if (temp.contains('.')) { 
                  return;

                } else {

                  temp = temp + buttonValue;
                }

                //operaciones basicas
              } else if (buttonValue == "=") {
                number2 = double.parse(output);

                if (operations == '+') {
                  temp = (number1 + number2).toString();

                } else if (operations == '-') {
                  temp = (number1 - number2).toString();

                } else if (operations == 'x') {
                  temp = (number1 * number2).toString();

                } else if (operations == '/') {
                  temp = (number1 / number2).toString();

                }

                number1 = 0;
                number2 = 0;
                operations = '';

              } else {
                temp = temp + buttonValue;
              }

              setState(() {
                output = double.parse(temp).toStringAsFixed(2);
              });


             if(buttonValue!= 'AC'){
              history = history + buttonValue;  
              }
              else{
                history = '';               
              }
              
    });
  }


}