
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:school_app/Bloc/BlocState.dart';
import 'package:school_app/module/Theme.dart';

class ThemeBloc extends Cubit<ThemeState>{
    ThemeBloc() : super(ThemeState(AppTheme.Light)){
      loadTheme();
    }

  void loadTheme() async{
  SharedPreferences _pref = await SharedPreferences.getInstance();
  String _str = _pref.getString('theme')?? '';
  if(_str == 'dark')
    emit(ThemeState(AppTheme.Dark));
  }

void setTheme(AppTheme theme) async{
      emit(ThemeState(theme));
      await SharedPreferences.getInstance().then((value)=> value.setString('theme', theme==AppTheme.Dark?'dark':'light'));
}



}