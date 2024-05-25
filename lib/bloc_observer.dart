import 'package:bloc/bloc.dart';
import 'package:lipl_control/app/app.dart';

class LiplBlocObserver extends BlocObserver {
  LiplBlocObserver();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    logger.info('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    final dynamic next = change.nextState;
    logger.info('onChange -- next ${next.runtimeType}');
    logger.info('onChange -- ${bloc.runtimeType}\n$next');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.info('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    logger.info('onClose -- ${bloc.runtimeType}');
  }
}
