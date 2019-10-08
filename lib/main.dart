import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xo game',
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomaPageState createState() => _HomaPageState();
}

class _HomaPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XO game"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[_buildelement(),_buildelement(), _buildelement()],
            ),
            Row(
              children: <Widget>[_buildelement(), _buildelement(), _buildelement()],
            ),
            Row(
              children: <Widget>[_buildelement(), _buildelement(), _buildelement()],
            )
          ],
        ),
      ),
    );
  }

  _buildelement(){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
          color: Colors.pinkAccent
        ),
      ),
      child: Text('X'),
    );
  }

}
