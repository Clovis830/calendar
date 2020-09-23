import 'package:flutter/material.dart';

import 'package:calendar/src/components/app/app.dart';
import 'package:calendar/src/ui/heading/heading.dart';

/// отвечает за отображение списка последних открытыx книг
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SizedBox.expand(
        child: Stack(
          children: [
            Heading(
              title: 'Последние книги',
            )
          ],
        ),
      ),
    );
  }
}
