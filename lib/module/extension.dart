import 'package:flutter/material.dart';
import 'package:school_app/Bloc/UserBloc.dart';
import 'package:school_app/DataModel/User.dart';
import 'widgets.dart';
import 'package:provider/provider.dart';
import 'package:school_app/Bloc/ThemeBloc.dart';

extension ContextExtension on BuildContext{
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  void showForm(Widget child) => Navigator.of(this).push(MaterialPageRoute(builder: (_)=> child));
  UserBloc get userBloc => this.read<UserBloc>();
  User? get user => this.read<UserBloc>().user;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  ThemeBloc get themeBloc => this.read<ThemeBloc>();
  Color get bottomAppBarColor => Theme.of(this).bottomAppBarColor;
  Color get accentColor => Theme.of(this).accentColor;
}

extension StringExtension on String{
  Widget toLabel({double? fontSize, Color? color, bool bold = false})  =>MLabel(this.replaceAll("Exception:", ""), fontSize:fontSize, color:color, bold:bold);
}


extension WidgetExtension on Widget{
  Widget get vMargin3 => Container(margin: EdgeInsets.symmetric(vertical: 3), child: this);
  Widget get vMargin6 => Container(margin: EdgeInsets.symmetric(vertical: 6), child: this);
  Widget get vMargin9 => Container(margin: EdgeInsets.symmetric(vertical: 9), child: this);
  Widget get hMargin3 => Container(margin: EdgeInsets.symmetric(horizontal: 3), child: this);
  Widget get hMargin6 => Container(margin: EdgeInsets.symmetric(horizontal: 6), child: this);
  Widget get hMargin9 => Container(margin: EdgeInsets.symmetric(horizontal: 9), child: this);
  Widget get margin3 => Container(margin: EdgeInsets.all( 3), child: this);
  Widget get margin6 => Container(margin: EdgeInsets.all( 3), child: this);
  Widget get margin9 => Container(margin: EdgeInsets.all( 3), child: this);

  Widget get vPadding3 => Container(padding: EdgeInsets.symmetric(vertical: 3), child: this);
  Widget get vPadding6 => Container(padding: EdgeInsets.symmetric(vertical: 6), child: this);
  Widget get vPadding9 => Container(padding: EdgeInsets.symmetric(vertical: 9), child: this);
  Widget get hPadding3 => Container(padding: EdgeInsets.symmetric(vertical: 3), child: this);
  Widget get hPadding6 => Container(padding: EdgeInsets.symmetric(vertical: 6), child: this);
  Widget get hPadding9 => Container(padding: EdgeInsets.symmetric(vertical: 9), child: this);
  Widget get padding3 => Container(padding: EdgeInsets.all( 3), child: this);
  Widget get padding6 => Container(padding: EdgeInsets.all( 3), child: this);
  Widget get padding9 => Container(padding: EdgeInsets.all( 3), child: this);

  Widget get card => Card(child: this);
  Widget get expand => Expanded(child: this);
  Widget get center => Center(child: this,);

}