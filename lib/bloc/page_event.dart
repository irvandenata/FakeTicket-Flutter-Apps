part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData regData;

  GoToRegistrationPage(this.regData);

  List<Object> get props => [regData];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData regData;

  GoToPreferencePage(this.regData);

  List<Object> get props => [regData];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData regData;

  GoToAccountConfirmationPage(this.regData);

  List<Object> get props => [regData];
}
