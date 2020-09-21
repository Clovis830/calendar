part of 'app.dart';

class AppRoute extends StatelessWidget {
  final Widget child;
  const AppRoute({Key key, this.child}) : super(key: key);

  List<BlocListener> _getEventListeners() => [
        BlocListener<ErrorBloc, ErrorState>(
          listener: (context, state) {
            if (state is ErrorStateActive) {
              Error.showErrorDialog(context, state);
            }
          },
        ),
        BlocListener<LoaderBloc, LoaderState>(
          listener: (context, state) {
            if (state is LoaderStateActive) {
              Loader.showLoader(context);
            }
            if (state is LoaderStateInActive) {
              Router.goBack(context);
            }
          },
        )
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const TopAppBar(),
        drawer: Drawer(
          child: Menu(),
        ),
        endDrawer: Drawer(
          child: Settings(),
        ),
        body: MultiBlocListener(
          listeners: _getEventListeners(),
          child: BlocBuilder<AppBloc, AppState>(
            builder: (BuildContext context, state) {
              print('state ${state.pathToCalibre}');
              if (state.pathToCalibre == null) {
                return GetPath();
              }
              return child;
            },
          ),
        ),
      ),
    );
  }
}
