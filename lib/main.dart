import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'XO game',
        theme: ThemeData(
          primaryColor: Colors.pink,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomaPageState createState() => _HomaPageState();
}

class _HomaPageState extends State<HomePage> {
  
  var _scaffolkey = new GlobalKey<ScaffoldState>();
  List<List> _matrix ;
  String _lastchar = 'o' ;
 
  // initilialiser la matrice
  _HomaPageState(){
    _initMatrix();
  }

  _initMatrix(){
  _matrix = List<List>(3);
  for(var i=0;i<3;i++){
      _matrix[i]= List(3);
      for(var j=0;j<3;j++){
        _matrix[i][j] = ' ';
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      appBar: AppBar(
        title: Text("XO game"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildelement(0,0),
                _buildelement(0,1),
                _buildelement(0,2)
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildelement(1,0),
                _buildelement(1,1),
                _buildelement(1,2)
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildelement(2,0),
                _buildelement(2,1),
                _buildelement(2,2)
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildelement(int i,int j) {
    return GestureDetector(
      onTap: () {
        setState(() {
         if (_lastchar=='x') _matrix[i][j] = '0';
        else _matrix[i][j] = 'x';
        _lastchar = _matrix[i][j]; 
        });
        _checkwinner(i,j);
      },
      child: Container(
        width: 90.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.pinkAccent),
        ),
        child: Center(
          child: Text(
          _matrix[i][j],
          style: TextStyle(fontSize: 92.0),
        ),
        )
      ),
    );
  }

  _checkwinner(int i,int j){
    var col =0,row=0,diag=0,rdiag=0;
    var n=_matrix.length - 1;
    var player = _matrix[i][j];
    for (int k=0 ; k<_matrix.length;k++){
      if(_matrix[i][k]==player) col++;
      if(_matrix[k][j]==player) row++;
      if(_matrix[k][k]==player) diag++;
      if(_matrix[k][n-k]==player) col++;
    } 
    if (row==n+1 || col==n+1 || diag==n+1 || rdiag==n+1){
      var snackBar = SnackBar(
        backgroundColor: Colors.greenAccent,
        duration: Duration(seconds: 3),
        content: Center(child: Text("$player is the Winner")),
      );
      _scaffolkey.currentState.showSnackBar(snackBar);
      _initMatrix();
    }
  }

}
