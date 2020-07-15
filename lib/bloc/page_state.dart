part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData regData;

  OnRegistrationPage(this.regData);
  List<Object> get props => [regData];
}

class OnPreferenceDataPage extends PageState {
  final RegistrationData regData;

  OnPreferenceDataPage(this.regData);

  List<Object> get props => [regData];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData regData;

  OnAccountConfirmationPage(this.regData);

  List<Object> get props => [regData];
}
