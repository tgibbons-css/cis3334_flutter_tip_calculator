import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CIS 3334 Tip Caluclator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final billAmountTextField = TextEditingController();
  double _tipPercent = 0.15;
  double _totalTip = 0.00;
  bool _checkboxGreatService = false;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tip Calculator',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 100),
            Text(
              'Bill Amount',),
            TextField(
              controller: billAmountTextField,
            ),
            Row(
              children: [
                Switch(
                    value: _checkboxGreatService,
                    onChanged: (value) {
                      setState(() {
                        _checkboxGreatService = value;
                        if (_checkboxGreatService) {
                          _tipPercent = 0.20;
                        } else {
                          _tipPercent = 0.15;
                        }
                      });
                    }),
                Text('Great Service?'),
              ],
            ),
            ElevatedButton(
              child: Text('Calculate Tip'),
              onPressed: () {
                setState(() {
                  double _billAmount = double.parse(billAmountTextField.text);
                  _totalTip = _billAmount * _tipPercent;
                });
              },
            ),
            SizedBox(height: 100),
            Text(
              'Total Tip: $_totalTip',
            ),
          ],
        ),
      ),
    );
  }
}
