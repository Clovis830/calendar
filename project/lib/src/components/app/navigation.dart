part of 'app.dart';

enum Routes { home }

final Map<Routes, String> routesMap = const {Routes.home: '/'};

class Router {
  static final _instance = Router._();

  const Router._();

  factory Router() {
    return _instance;
  }

  static goTo(BuildContext context, Routes name) {
    Navigator.pushNamed(context, routesMap[name]);
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Widget _buildHomeRoute(BuildContext context) => BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
        child: AppRoute(child: Home()),
      );

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (BuildContext context) => _buildHomeRoute(context));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
