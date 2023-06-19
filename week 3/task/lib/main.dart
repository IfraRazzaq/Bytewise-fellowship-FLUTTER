import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lottery App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row(
            //   children: [
            //     Expanded(
            //         child: Container(
            //       color: Colors.red,
            //       height: 250,
            //       child: Center(child: Text('Container')),
            //     )
            //     ),
            //     Expanded(child:
            //     Container(
            //       color: Colors.green,
            //       height: 250,
            //       child: Center(child: Text('Container')),
            //     )
            //     )
            //   ],
            // ),
            // Center(
            //   child: Container(
            //     height: 250,
            //     width: 250,
            //     // transform: Matrix4.rotationZ(.2),
            //     decoration: BoxDecoration(
            //       color: Colors.orange,
            //       borderRadius: BorderRadius.circular(10.0),
            //         // border: Border.all(
            //         //   color: Colors.red,
            //         //   width: 1,
            //         // ),
            //       image: DecorationImage(
            //         fit: BoxFit.cover,
            //         image: NetworkImage('https://images.pexels.com/photos/15953937/pexels-photo-15953937.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load')
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.black,
            //           blurRadius: 40,
            //         )
            //       ]
            //     ),
            //     child: const Center(child: Text('Login')),
            //   ),
            // )
            //
            // SizedBox(
            //   height: 100,
            // ),
            // Divider(
            //   color: Colors.black,thickness: 1,
            // ),
            // Center(
            //   child: CircleAvatar(
            //     radius: 100,
            //     backgroundColor: Colors.black,
            //     // child: Icon(Icons.person),
            //     backgroundImage: NetworkImage('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600'),
            //   ),
            // )
          //   RichText(
          //       text: TextSpan(
          //           text: 'Hello',style: Theme.of(context).textTheme.bodyLarge,
          //         children: [
          //           TextSpan(text: '  World',style: TextStyle(fontWeight: FontWeight.bold))
          //         ]
          //       )
          //   )

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Enter Email',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),

              ),
            )
          ],
        ),
      )
    );
  }
}
