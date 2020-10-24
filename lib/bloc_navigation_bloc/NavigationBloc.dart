import 'package:animatedsidebar/pages/HomePage.dart';
import 'package:animatedsidebar/pages/myAccountsPage.dart';
import 'package:animatedsidebar/pages/myOrders.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  HomePageClickEvent,
  MyAccountClickEvent,
  MyOrdersClickEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch(event) {
      case NavigationEvents.HomePageClickEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickEvent:
        yield MyAccountsPage();
        break;
      case NavigationEvents.MyOrdersClickEvent:
        yield MyOrders();
        break;
    }
  }
}
