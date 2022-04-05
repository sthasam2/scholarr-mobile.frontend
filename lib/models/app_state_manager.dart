import 'dart:async';

import 'package:flutter/material.dart';

class AppTab {
  static const int home = 0;
  static const int planner = 1;
  static const int resources = 2;
  static const int settings = 3;
}

class AuthPages {
  static const int login = 0;
  static const int signUp = 1;
  static const int forgotPw = 2;
  static const int resetPw = 3;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  bool _isForgotPassword = false;
  bool _isSigningUp = false;
  int _selectedTab = AppTab.home;
  int _selectedAuth = AuthPages.login;

  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  bool get isSigningUp => _isSigningUp;
  bool get isForgotPassword => _isForgotPassword;
  int get getSelectedTab => _selectedTab;
  int get getSelectedAuth => _selectedAuth;

  void initializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void signUpCall() {
    _selectedAuth = 1;
    notifyListeners();
  }

  void signUp(
    String username,
    String email,
    String password,
  ) {
    _isSigningUp = true;
    notifyListeners();
  }

  void forgotPassword() {
    _selectedAuth = 2;
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToAuthPage(index) {
    _selectedAuth = index;
    notifyListeners();
  }
}
