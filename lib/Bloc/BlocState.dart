import 'package:flutter/material.dart';
import 'package:school_app/DataModel/User.dart';
import 'package:school_app/module/Theme.dart';

@immutable
abstract class BlocState {}

class Initial extends BlocState {}

class Loading extends BlocState {}

class ThemeState extends BlocState {
  final AppTheme theme;
  ThemeState( this.theme);
}

class Failed extends BlocState {
  final Exception exception;
  Failed(this.exception);
}

class Authenticated extends BlocState {
  final User user;
  Authenticated(this.user);
}
