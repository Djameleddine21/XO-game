import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'XO game',
    theme: ThemeData(
      primaryColor: Colors.pink,
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomaPageState createState() => _HomaPageState();
}

class _HomaPageState extends State<HomePage> {
  var _scaffolkey = new GlobalKey<ScaffoldState>();
  List<List> _matrix;
  String _lastchar = 'o';

  // initilialiser la matrice
  _HomaPageState() {
    _initMatrix();
  }

  _initMatrix() {
    _matrix = List<List>(3);
    for (var i = 0; i < 3; i++) {
      _matrix[i] = List(3);
      for (var j = 0; j < 3; j++) {
        _matrix[i][j] = ' ';
      }
    }
    _lastchar = 'o';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      appBar: AppBar(
        title: Text("XO game"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xff3366ff),
                const Color(0xff00ccff)
              ],
            )
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xff3366ff),
              const Color(0xff00ccf),
            ]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildelement(0, 0),
                  _buildelement(0, 1),
                  _buildelement(0, 2)
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildelement(1, 0),
                  _buildelement(1, 1),
                  _buildelement(1, 2)
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildelement(2, 0),
                  _buildelement(2, 1),
                  _buildelement(2, 2)
                ],
              ),
              RaisedButton(
                child: Icon(Icons.refresh),
                onPressed: (){
                  setState(() {
                    _initMatrix();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildelement(int i, int j) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(_matrix[i][j]==' '){
            if (_lastchar == 'x')
              _matrix[i][j] = '0';
            else
              _matrix[i][j] = 'x';
            _lastchar = _matrix[i][j];
            _checkwinner();
          }
        });
      },
      child: Container(
          width: 90.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(color: Color(0xffffffff)),
          ),
          child: Center(
            child: Text(
              _matrix[i][j],
              style: TextStyle(fontSize: 92.0),
            ),
          )),
    );
  }

  _checkwinner() {
    var $player = ' ';
    bool b = false;
    if (_matrix[0][0] == _matrix[0][1] &&
        _matrix[0][1] == _matrix[0][2] &&
        _matrix[0][0] != ' ' &&
        _matrix[0][1] != ' ' &&
        _matrix[0][2] != ' ') {
      $player = _matrix[0][0];
      b = true;
    } else if (_matrix[1][0] == _matrix[1][1] &&
        _matrix[1][1] == _matrix[1][2] &&
        _matrix[1][0] != ' ' &&
        _matrix[1][1] != ' ' &&
        _matrix[1][2] != ' ') {
      $player = _matrix[1][0];
      b = true;
    } else if (_matrix[2][0] == _matrix[2][1] &&
        _matrix[2][1] == _matrix[2][2] &&
        _matrix[2][0] != ' ' &&
        _matrix[2][1] != ' ' &&
        _matrix[2][2] != ' ') {
      $player = _matrix[2][0];
      b = true;
    } else if (_matrix[0][0] == _matrix[1][0] &&
        _matrix[1][0] == _matrix[2][0] &&
        _matrix[0][0] != ' ' &&
        _matrix[1][0] != ' ' &&
        _matrix[2][0] != ' ') {
      $player = _matrix[0][0];
      b=true;
    } else if (_matrix[0][1] == _matrix[1][1] &&
        _matrix[1][1] == _matrix[2][1] &&
        _matrix[0][1] != ' ' &&
        _matrix[1][1] != ' ' &&
        _matrix[2][1] != ' ') {
      $player = _matrix[0][1];
      b = true;
    } else if (_matrix[0][2] == _matrix[1][2] &&
        _matrix[1][2] == _matrix[2][2] &&
        _matrix[0][2] != ' ' &&
        _matrix[1][2] != ' ' &&
        _matrix[2][2] != ' ') {
      $player = _matrix[0][2];
      b = true;
    } else if (_matrix[0][0] == _matrix[1][1] &&
        _matrix[1][1] == _matrix[2][2] &&
        _matrix[0][0] != ' ' &&
        _matrix[1][1] != ' ' &&
        _matrix[2][2] != ' ') {
      $player = _matrix[0][0];
      b = true;
    } else if (_matrix[0][2] == _matrix[1][1] &&
        _matrix[1][1] == _matrix[2][0] &&
        _matrix[0][2] != ' ' &&
        _matrix[1][1] != ' ' &&
        _matrix[2][0] != ' ') {
      $player = _matrix[0][2];
      b = true;
    }
    if (b == true) {
      var snackBar = SnackBar(
        content: Text($player + " is the Winner"),
        action: SnackBarAction(
          label: 'Repeat',
          onPressed: () {
            setState(() {
              _initMatrix();
            });
          },
        ),
      );
      _scaffolkey.currentState.showSnackBar(snackBar);
    }
  }
}
