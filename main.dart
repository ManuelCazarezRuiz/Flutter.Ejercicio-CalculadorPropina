import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
      title: 'Calculador de Propina',
      home: new TipCalculator()
  ));
}

class TipCalculator extends StatelessWidget {
  double billAmount = 0.0;
  double tipPercentage = 0.0;
  @override
  Widget build(BuildContext context) {
    AppBar appBar = new AppBar(title: new Text("Calculador de Propina"));
    TextField billAmountField = new TextField(
        decoration: InputDecoration(
            labelText: "Monto (\$)",
            hintText: '0'
        ),
        keyboardType: TextInputType.number,
        onChanged: (text) {
          try {
            billAmount = double.parse(text);
          } catch (exception) {
            billAmount = 0.0;
          }
        }
    );

// Create another input field
    TextField tipPercentageField = new TextField(
        decoration: InputDecoration(
            labelText: "%",
          hintText: "10",
        ),
        keyboardType: TextInputType.number,
        onChanged: (text) {
          try {
            tipPercentage = double.parse(text);
          } catch (exception) {
            tipPercentage = 0.0;
          }
        }
    );
    // Create button
    RaisedButton calculateButton = new RaisedButton(
        child: new Text("Calcular"),
        color: Theme.of(context).accentColor,
        splashColor: Colors.blueGrey,
        padding:const EdgeInsets.all(20.0),
        onPressed: () {
          // Calculate tip and total
          double calculatedTip = billAmount * tipPercentage / 100.0;
          double total = billAmount + calculatedTip;

// Generate dialog
          AlertDialog dialog = new AlertDialog(
              content: new Text("Tip: \$$calculatedTip \n"
                  "Total: \$$total")
          );

// Show dialog
          showDialog(context: context, child: dialog);
        }
    );
    Container container = new Container(
        padding: const EdgeInsets.all(15.0),
        child: new Column(
            children: [ billAmountField,
            tipPercentageField,
            calculateButton ]
        )
    );
    Scaffold scaffold = new Scaffold(appBar: appBar,
        body: container);
    return scaffold;
  }
}
