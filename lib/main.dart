import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main(){
  runApp(Calculator());
}
class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SimpleCalculator(),
    );
  }
}
class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation ="0";
  String result="0";
  String expression="";
  double equationFontSize=38.0;
  double resultFontSize=48.0;
  int a=0;
  int b=0;
  int pheptoan =0;
  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        equation="0";
        result="0";
        equationFontSize=38.0;
        resultFontSize=48.0;
        a = 0;
        b = 0;
        pheptoan = 0;
      }else if(buttonText =="⌫"){
        equationFontSize=38.0;
        resultFontSize=48.0;
        if(a>0){
          if(pheptoan==1){
            if(b>0){
              equation = equation.substring(0, equation.length - 1);
              b = b - 1;
            }else{
              b=0;
              pheptoan=0;
              equation = equation.substring(0, equation.length - 1);
            }
          }else{
            a = a - 1;
            equation = equation.substring(0, equation.length - 1);

          }
        }else{
          a=0;
        }

        if(equation==""){
          equation="0";
        }
       // result=a.toString()+b.toString();
      }else if(buttonText=="+/-"){
        if(result!="0") {
          result.toString().startsWith('-') ?
          result = result.toString().substring(1) : result =
              '-' + result.toString();
          equation=result;
          result="0";


        }
      }else if(buttonText =="="){
        a=0;
        b=0;
        pheptoan = 0;
        equationFontSize=38.0;
        resultFontSize=48.0;
        expression = equation;
        expression = expression.replaceAll('×', 'x');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '/100');

        try{
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result ='${exp.evaluate(EvaluationType.REAL, cm)}';

          setState(() {
            expression=result.toString();
          });
          equation= equation+"=";
          if(result =="Infinity"){
            result="Error";
          }
        }catch(e){
          result="Error";
        }
      }else{
        equationFontSize=48.0;
        resultFontSize=38.0;
        if(equation=="0"){
          equation=buttonText;
          a=1;
        }else {
          if(equation.length<50) {
            if(buttonText=="O"){
              buttonText="0";
            }
            if(result =="0") {
              if(buttonText=="+" || buttonText=="-" ||buttonText=="×" || buttonText=="÷") {
                pheptoan = 1;
                equation = equation + buttonText;
              }else{
                if(pheptoan==1){
                  if(b<12){
                    equation = equation + buttonText;
                    b = b + 1;
                  }
                }else{
                  if(a<12) {
                    equation = equation + buttonText;
                    a = a + 1;
                  }
                }
              }

            }else{
              equation = result + buttonText;
              pheptoan=1;
              result ="0";
            }
          }
        }
      }
    });

  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor){
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid
            )
        ),
        padding: EdgeInsets.all(16.0),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator'),),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation, style: TextStyle(fontSize: equationFontSize),),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(result, style: TextStyle(fontSize:
            resultFontSize),),
          ),

          Expanded(
            child: Divider(),
          ),

          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(
                        children: [
                          buildButton("C", 1, Colors.blueAccent),
                          buildButton("⌫", 1, Colors.black54),
                          buildButton("÷", 1, Colors.black54),
                        ]
                    ),
                    // TableRow(
                    //     children: [
                    //       buildButton("sin(", 1, Colors.blue),
                    //       buildButton("cos(", 1, Colors.blue),
                    //       buildButton("÷", 1, Colors.blue),
                    //     ]
                    // ),

                    TableRow(
                        children: [
                          buildButton("7", 1, Colors.black38),
                          buildButton("8", 1, Colors.black38),
                          buildButton("9", 1, Colors.black38),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("4", 1, Colors.black38),
                          buildButton("5", 1, Colors.black38),
                          buildButton("6", 1, Colors.black38),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("1", 1, Colors.black38),
                          buildButton("2", 1, Colors.black38),
                          buildButton("3", 1, Colors.black38),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton(".", 1, Colors.black38),
                          buildButton("O", 1, Colors.black38),
                          buildButton("+/-", 1, Colors.black38),
                        ]
                    ),

                  ],
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    // TableRow(
                    //     children: [
                    //       buildButton(")", 1, Colors.blue),
                    //     ]
                    // ),
                    TableRow(
                        children: [
                          buildButton("×", 1, Colors.black54),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("-", 1, Colors.black54),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("+", 1, Colors.black54),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("%", 1, Colors.black54),
                        ]
                    ),

                    TableRow(
                        children: [
                          buildButton("=", 1, Colors.blueAccent),
                        ]
                    ),

                  ],
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}