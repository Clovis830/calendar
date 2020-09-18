part of 'app.dart';

enum Routes { home, ratings }

class Router {
  static final _instance = Router._();

  const Router._();

  factory Router() {
    return _instance;
  }

  static goTo(BuildContext context, Routes route) {
    Navigator.pushNamedAndRemoveUntil(context, route.toString(), (route) {
      return route.isCurrent;
    });
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Widget _buildHomeRoute(BuildContext context) => BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
        child: AppRoute(child: Home()),
      );

  static Widget _buildRatingsRoute(BuildContext context) => BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
        child: AppRoute(child: Ratings()),
      );

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == Routes.home.toString()) {
      return MaterialPageRoute(builder: (BuildContext context) => _buildHomeRoute(context));
    }
    if (settings.name == Routes.ratings.toString()) {
      return MaterialPageRoute(builder: (BuildContext context) => _buildRatingsRoute(context));
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
