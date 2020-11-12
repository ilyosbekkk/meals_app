import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text(
          "Page not found:(",
          style: TextStyle(color: Colors.red, fontSize: 35),
        ),
      ),
    );
  }
}
