part of 'app.dart';

List<_MenuItem> _settingsData = const [
  _MenuItem('Указать путь к базе данных Calibre', Routes.ratings),
];

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        child: Stack(children: [
          ListView(
            padding: EdgeInsets.only(right: 48.0, bottom: 80.0),
            children: <Widget>[
              for (_MenuItem item in _settingsData)
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton.icon(
                  label: Text('Обновить бд Calibre'),
                  icon: Icon(Icons.refresh),
                  onPressed: () {},
                  color: Colors.white,
                ),
                FlatButton.icon(
                  label: Text('Сохранить бд приложения'),
                  icon: Icon(Icons.save),
                  onPressed: () {},
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ]));
  }
}
