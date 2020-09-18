part of 'app.dart';

class _MenuItem {
  final String title;
  final Routes to;
  const _MenuItem(this.title, this.to);
}

List<_MenuItem> _menuData = const [
  _MenuItem('Последние книги', Routes.ratings),
  _MenuItem('Библиотека', Routes.home),
  _MenuItem('Оценки', Routes.home),
  _MenuItem('Серии', Routes.home),
  _MenuItem('Теги', Routes.home),
];

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Stack(children: [
          ListView(
            padding: EdgeInsets.only(right: 48.0, bottom: 80.0),
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              for (_MenuItem item in _menuData)
                ListTile(
                  title: Text(item.title),
                  onTap: () => Router.goTo(context, item.to),
                ),
            ],
          ),
          Positioned(
            right: -6,
            top: -14.0,
            child: IconButton(
              iconSize: 36.0,
              icon: Icon(Icons.close),
              onPressed: () {
                Router.goBack(context);
              },
            ),
          ),
          Positioned(
            left: 0,
            bottom: 24.0,
            child: FlatButton.icon(
              label: Text('Login to GoodReads'),
              icon: Icon(Icons.login),
              onPressed: () {},
              color: Colors.white,
            ),
          ),
        ]));
  }
}
