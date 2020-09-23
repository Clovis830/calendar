import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String title;
  const Heading({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title.toUpperCase(),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
