part of 'library.dart';

class Book extends StatelessWidget {
  final String title;
  const Book({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Text(title),
    );
  }
}
