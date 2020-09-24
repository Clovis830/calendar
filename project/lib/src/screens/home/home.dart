import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:calendar/src/components/app/app.dart';
import 'package:calendar/src/ui/heading/heading.dart';

/// отвечает за отображение списка последних открытыx книг
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    TextTheme style = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      child: SizedBox.expand(
        child: Column(
          children: [
            Heading(
              title: 'Последние книги',
            ),
            Container(
              height: screenHeight / 2,
              width: double.infinity,
              color: Colors.grey,
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Icon(Icons.book_rounded),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: RichText(
                      strutStyle: StrutStyle.disabled,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          text:
                              '''bottom many many text bottom many many text bottom many many text bottom many many text,
                              bottom many many text bottom many many text bottom many many text bottom many many text,
                              bottom many many text bottom many many text bottom many many text bottom many many text,
                            '''),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Text('test'),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
