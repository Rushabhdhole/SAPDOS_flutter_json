import 'package:bloc/bloc.dart';

enum AppEvent { event1, event2, event3 }

class AppBloc extends Bloc<AppEvent, int> {
  AppBloc() : super(0);

  @override
  Stream<int> mapEventToState(AppEvent event) async* {
    switch (event) {
      case AppEvent.event1:
        yield 1;
        break;
      case AppEvent.event2:
        yield 2;
        break;
      case AppEvent.event3:
        yield 3;
        break;
    }
  }
}
