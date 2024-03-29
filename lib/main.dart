import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SwitchDisplayApp());

class SwitchDisplayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: SwitchDisplay(),
        debugShowCheckedModeBanner: false,
      );
}

class SwitchDisplay extends StatefulWidget {
  const SwitchDisplay({Key? key}) : super(key: key);

  @override
  SwitchDisplayState createState() => SwitchDisplayState();
}

class SwitchDisplayState extends State<SwitchDisplay> {
  var _display = false;

  @override
  Widget build(BuildContext context) {
    final cols = isPortrait(context) ? 4 : _cols;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < _rows; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int j = 0; j < cols; j++)
                  CupertinoSwitch(
                    value: _display && _fiveZero[i][j],
                    onChanged: (_) => setState(() {
                      _display = !_display;
                    }),
                  ),
              ],
            ),
        ],
      ),
    );
  }

  static const _rows = 7;
  static const _cols = 9;

  static final List<List<bool>> _fiveZero = toBool([
    "1111  11 ",
    "1    1  1",
    "111  1  1",
    "   1 1  1",
    "   1 1  1",
    "   1 1  1",
    "111   11 ",
  ]);

  static List<List<bool>> toBool(List<String> strs) => [
        for (int i = 0; i < strs.length; i++)
          [
            for (int j = 0; j < _cols; j++) strs[i].padRight(_cols)[j] != " ",
          ]
      ];

  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;
}
