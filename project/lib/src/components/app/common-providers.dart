part of 'app.dart';

List<BlocProvider> _getProviders(BuildContext context) => [
      BlocProvider<ErrorBloc>(
        create: (BuildContext context) => ErrorBloc(),
      ),
      BlocProvider<LoaderBloc>(
        create: (BuildContext context) => LoaderBloc(),
      ),
    ];
