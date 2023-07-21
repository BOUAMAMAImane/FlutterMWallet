import 'package:testingg/models/UserModelNative.dart';
import 'package:testingg/models/userModel.dart';

abstract class AppStates {}

class AppInitialStates extends AppStates {}

class AppChangeBottomNavStates extends AppStates {}
class AppChangeHistoryScreenStates extends AppStates {}

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



class ChangeLanguageSuccessStates extends AppStates {}
class ChangeLanguageInitialStates extends AppStates {}


class AppSigninLoadingStates extends AppStates {}
class IsSwitchedChangeStates extends AppStates {}



class AppSigninInitialStates extends AppStates {}
class AppSigninSuccessStates extends AppStates {}
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


class LoadLoggedInUserSuccessStates extends AppStates {}
class LoadLoggedInUserErrorStates extends AppStates {}

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

class AppSendOtpInitialState extends AppStates {}

class AppSendOtpSuccessState extends AppStates {
  final String message;

  AppSendOtpSuccessState(this.message);
}

class AppSendOtpErrorState extends AppStates {}

class AppVerifyOtpErrorState extends AppStates {
  final String error;

  AppVerifyOtpErrorState(this.error);
}

class AppVerifyOtpSuccessState extends AppStates {
  final String message;

  AppVerifyOtpSuccessState(this.message);
}

class AppVerifyOtpInitialState extends AppStates {}


class AppVerifyCinInitialStates extends AppStates {}
class AppVerifyCinSuccessStates extends AppStates {}
class AppVerifyCinErrorStates extends AppStates {}

class AppVerifyPhoneInitialStates extends AppStates {}
class AppVerifyPhoneSuccessStates extends AppStates {}
class AppVerifyPhoneErrorStates extends AppStates {}


class AppVerifyEmailInitialStates extends AppStates {}
class AppVerifyEmailSuccessStates extends AppStates {}
class AppVerifyEmailErrorStates extends AppStates {}


class AppTransferinitialStates extends AppStates {}
class AppTransferSuccessStates extends AppStates {}
class AppTransferErrorStates extends AppStates {}




class AppGeneratedQrCodeInitialStates extends AppStates {}

class AppGeneratedQrCodeSuccessStates extends AppStates {
  final String url;

  AppGeneratedQrCodeSuccessStates(this.url);
}
class AppGeneratedQrCodeErrorStates extends AppStates {}


class AppTransactionSuccessStates extends AppStates {}
class AppTransactionErrorStates extends AppStates {}
class AppTransactionInitialStates extends AppStates {}



class AppTransactionHistoryEmetteurInitialStates extends AppStates {}
class AppTransactionHistoryEmetteurSuccessStates extends AppStates {}
class AppTransactionHistoryEmetteurErrorStates extends AppStates {}

class AppTransactionHistoryDestinataireInitialStates extends AppStates {}
class AppTransactionHistoryDestinataireSuccessStates extends AppStates {}
class AppTransactionHistoryDestinataireErrorStates extends AppStates {}



class AppGetSessionIdSuccesStates extends AppStates {}
class AppGetSessionIdInitStates extends AppStates {}
class AppGetSessionIdErrorStates extends AppStates {}





