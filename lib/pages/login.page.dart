import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(250))),
                    ),
                    Container(
                      width: 320,
                      height: 320,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(320))),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
