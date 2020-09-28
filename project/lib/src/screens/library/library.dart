import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:calendar/src/ui/heading/heading.dart';

import 'bloc/library_bloc.dart';
part 'book.dart';

class Library extends StatelessWidget {
  const Library({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Heading(
            title: 'Библиотека',
          ),
          Container(
            color: Colors.green,
            width: double.infinity,
            height: 40.0,
            child: Text('filters'),
          ),
          Expanded(child: BlocBuilder<LibraryBloc, LibraryState>(
            builder: (context, state) {
              return GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
                children: List.generate(100, (index) {
                  return Center(
                    child: Book(
                      title: index.toString(),
                    ),
                  );
                }),
              );
            },
          ))
        ],
      ),
    );
  }
}
