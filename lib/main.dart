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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int firstnum = 0;
  int secondnum = 0;
  String texttodisplay = "";
  String res = "0";
  late String operatortoperform;
  void btnClicked(String btnvalue) {
    if (btnvalue == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnvalue == "+" ||
        btnvalue == "-" ||
        btnvalue == "*" ||
        btnvalue == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnvalue;
    } else if (btnvalue == "=") {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operatortoperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operatortoperform == "*") {
        res = (firstnum * secondnum).toString();
      }
      if (operatortoperform == "/") {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnvalue).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget clickedBtn(String btnvalue) {
    return Expanded(
      child: OutlinedButton(
        style: const ButtonStyle(
            padding:
                MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 25))),
        onPressed: () => btnClicked(btnvalue),
        child: Text(
          // ignore: unnecessary_string_interpolations
          "$btnvalue",
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text(
                  // ignore: unnecessary_string_interpolations
                  "$res",
                  style: const TextStyle(color: Colors.blue, fontSize: 20),
                ),
              ),
            ),
            Row(
              children: [
                clickedBtn("9"),
                clickedBtn("8"),
                clickedBtn("7"),
                clickedBtn("+"),
              ],
            ),
            Row(
              children: [
                clickedBtn("6"),
                clickedBtn("5"),
                clickedBtn("4"),
                clickedBtn("-"),
              ],
            ),
            Row(
              children: [
                clickedBtn("3"),
                clickedBtn("2"),
                clickedBtn("1"),
                clickedBtn("*"),
              ],
            ),
            Row(
              children: [
                clickedBtn("C"),
                clickedBtn("0"),
                clickedBtn("="),
                clickedBtn("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
