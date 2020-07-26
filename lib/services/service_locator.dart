import 'package:chat_bot/services/call_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(CallService());
}
