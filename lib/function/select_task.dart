import 'package:registration/function/show_auth_screen.dart';
import 'package:registration/function/show_info_screen.dart';

import '../app.dart';

void selectTask() {
  if (authenticatedUser == null) {
    showAuthScreen();
  } else {
    showInfoScreen();
  }
}
