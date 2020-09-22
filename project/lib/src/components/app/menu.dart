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
              SizedBox(
                height: 80.0,
                child: DrawerHeader(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Меню', style: const TextStyle(color: Colors.white)),
                      Icon(Icons.menu_book, color: Colors.white.withOpacity(0.4), size: 36.0,)
                    ],
                    ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
              for (_MenuItem item in _menuData)
                ListTile(
                  title: Text(item.title),
                  onTap: () => AppRouter.goTo(context, item.to),
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
                AppRouter.goBack(context);
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
