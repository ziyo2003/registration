
import 'package:registration/app.dart';
import 'package:registration/consts/contants.dart';
import 'package:registration/function/clear_terminal.dart';
import 'package:registration/function/select_task.dart';

void showMenu() {
  // TODO 2: Menu Driven ilova qilish
  while (!isTerminated) {
    clearTerminal();
    // TODO: Printni o'chirib tashla
    print(authenticatedUser == null ? AppConstans.signupText : AppConstans.mainMenuText);
    selectTask();
  }
}
