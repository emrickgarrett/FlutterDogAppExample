import 'package:flutter/material.dart';
import 'package:flutter_dog_example/dog_model.dart';
import 'package:flutter_dog_example/dog_list.dart';
import 'package:flutter_dog_example/new_dog_form.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'We Rate Dogs',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark
      ),
      home: new MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var initialDoggos = []
      ..add(new Dog('Ruby', 'Portland, OR, USA', 'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
      ..add(new Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
      ..add(new Dog('Rod Stewart', 'Prague, CZ', 'Star good boy on international snooze team.'))
      ..add(new Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
      ..add(new Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover'));

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        backgroundColor: Colors.black87,
        actions: [
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm
          )
        ]
      ),
      body: new Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            begin:Alignment.topRight,
            end:Alignment.bottomLeft,
            stops:[0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400]
            ]
          )
        ),
        child: new Center(
          child: new DogList(initialDoggos)
        )
      )
    );
  }

  Future<Null> _showNewDogForm() async {
    var newDog = await Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new AddDogFormPage();
        }
      )
    );

    if(newDog != null) {
      initialDoggos.add(newDog);
    }
  }
}
