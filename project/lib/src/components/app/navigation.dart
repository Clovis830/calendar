part of 'app.dart';

enum Routes { home, ratings, getPath }

class AppRouter {
  static final _instance = AppRouter._();

  const AppRouter._();

  factory AppRouter() {
    return _instance;
  }

  static goTo(BuildContext context, Routes route) {
    Navigator.pushNamed(context, route.toString());
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Route<dynamic> _buildGetPathRoute() => MaterialPageRoute(builder: (_) => AppRoute(child: GetPath()));

  static Route<dynamic> _buildHomeRoute() => MaterialPageRoute(
        builder: (_) => BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
          child: AppRoute(child: Home()),
        ),
      );

  static Route<dynamic> _buildRatingsRoute() => MaterialPageRoute(
      builder: (_) => BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc()..add(HomeEventStarted()),
            child: AppRoute(child: Ratings()),
          ));

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name == Routes.getPath.toString()) {
      return _buildGetPathRoute();
    }
    if (settings.name == Routes.home.toString()) {
      return _buildHomeRoute();
    }
    if (settings.name == Routes.ratings.toString()) {
      return  _buildRatingsRoute();
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(child: Text('No route defined for ${settings.name}')),
      ),
    );
  }
}
