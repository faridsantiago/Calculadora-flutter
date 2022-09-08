// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Operations extends StatefulWidget{
  const Operations({Key? key}) : super(key: key);
  @override
  State <StatefulWidget> createState()=>Mathlogical();
  
}


class Mathlogical extends State<Operations>{
  
  double result= 0;
  final textStyle =  const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20);

  double number1=0;
  double number2=0;

  String temp='0';
  String output='0';
  String history='';
  String operations='';

  Widget buildbutton(String buttonValue, int flexValue){
    
    return Expanded(
      
      flex: flexValue,
      child: Container(
        
        margin: const EdgeInsets.all(3),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(92, 255, 6, 6)
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
                color: Color.fromARGB(235, 255, 255, 255),fontSize: 30)
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
      
      backgroundColor: const Color.fromARGB(239, 202, 202, 202),
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
                color: Color.fromARGB(255, 0, 0, 0)
                
              
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
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),

          //Diseño de los botones 
          //lo vi en un tutorial y documentación de flutter
          Column(
            children: [
              Row(
                children: [
                  buildbutton("AC",3),
                  buildbutton("/", 1)
                ],
              ),Row(
                children: [
                  buildbutton("7", 2),
                  buildbutton("8", 2),
                  buildbutton("9", 2),
                  buildbutton("x", 2),
                ],
              ),Row(
                children: [
                  buildbutton("4", 2),
                  buildbutton("5", 2),
                  buildbutton("6", 2),
                  buildbutton("-", 2),
                ],
              ),Row(
                children: [
                  buildbutton("1", 2),
                  buildbutton("2", 2),
                  buildbutton("3", 2),
                  buildbutton("+", 2),
                ],
              ),Row(
              children: [
                buildbutton("0", 2),
                buildbutton(".", 1),
                buildbutton("=", 1),
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