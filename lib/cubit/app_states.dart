import 'package:m_wallet_hps/models/userModel.dart';

abstract class AppStates {}

class AppInitialStates extends AppStates {}

class AppChangeBottomNavStates extends AppStates {}
class AppStepPageStates extends AppStates {}

class AppLoadingInitialStates extends AppStates {}

class AppLoginInitialStates extends AppStates {}

class AppLoginLoadingStates extends AppStates {}

class AppLoginSuccessStates extends AppStates {
  final UserModel userModel;
  AppLoginSuccessStates(this.userModel);
}

class AppLoginErrorStates extends AppStates {
  final String error;
  AppLoginErrorStates(this.error);
}

class AppSigninLoadingStates extends AppStates {}

class AppSigninInitialStates extends AppStates {}

class AppSigninSuccessStates extends AppStates {
 final String swift;

  AppSigninSuccessStates(this.swift);
}

class AppSigninErrorStates extends AppStates {
  final String error;
  AppSigninErrorStates(this.error);
}
class LoginSaveTokenInitialStates extends AppStates {}
class LoginSaveTokenErrorStates extends AppStates {}
class LoginSaveTokenSuccessStates extends AppStates {}


class LoadLoggedInUserInitial extends AppStates {}

class RemoveTokenInitialStates extends AppStates {}
class RemoveTokenSuccessStates extends AppStates {}
class RemoveTokenErrorStates extends AppStates {}



class LoadLoggedInUserSuccess extends AppStates {}
class LoadLoggedInUserError extends AppStates {}

class AppVirementInitialStates extends AppStates {}
class AppVirementLoadingStates extends AppStates {}
class AppVirementSuccessStates extends AppStates {}
class AppVirementErrorStates extends AppStates {}


class AppVersementInitialStates extends AppStates {}
class AppVersementLoadingStates extends AppStates {}
class AppVersementSuccessStates extends AppStates {}
class AppVersementErrorStates extends AppStates {}

class AppChangeStates extends AppStates {}


class AppRefreshStates extends AppStates {}
class AppRefreshStatesStop extends AppStates {}
