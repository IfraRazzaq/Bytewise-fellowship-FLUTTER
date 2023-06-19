import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide Transition Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrentScreen(),
    );
  }
}

class CurrentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Next Screen"),
          onPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(builder: (context) => NextScreen()),
            );
          },
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Screen"),
      ),
      body: Center(
        child: Text("This is the Next Screen"),
      ),
    );
  }
}

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  SlidePageRoute({required this.builder})
      : super(
    transitionDuration: Duration(milliseconds: 500),
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) =>
        builder(context),
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) =>
        SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        ),
  );
}
