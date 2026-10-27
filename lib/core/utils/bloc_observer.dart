
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('🟢 CREATE: ${bloc.runtimeType}');
    print('📌 INITIAL STATE: ${bloc.state}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('🔄 CHANGE: ${bloc.runtimeType}');
    print('   CURRENT: ${change.currentState}');
    print('   NEXT: ${change.nextState}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('🔴 ERROR: ${bloc.runtimeType}');
    print('   $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    print('⚫ CLOSE: ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
