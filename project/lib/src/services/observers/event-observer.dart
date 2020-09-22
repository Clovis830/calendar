import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class EventObserver extends BlocObserver {
  final logger = Logger(
    printer: PrettyPrinter(printEmojis: true, colors: true,),
  );

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    logger.e('Error on $cubit!', error, stackTrace);
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    logger.d('Prev state of bloc $bloc: ${transition.currentState}');
    logger.d('Next state of bloc $bloc: ${transition.nextState}');
    super.onTransition(bloc, transition);
  }
}
