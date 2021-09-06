import 'package:flutter/material.dart';
import 'package:school_app/module/Theme.dart';
import 'package:school_app/screen/Login.dart';
import 'module/extension.dart';
import 'module/widgets.dart';
import 'screen/Dashboard/Dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/Bloc/UserBloc.dart';
import 'package:school_app/Bloc/BlocState.dart';
import 'package:provider/provider.dart';
import 'package:school_app/Bloc/ThemeBloc.dart';
import 'package:url_strategy/url_strategy.dart';
void main() {
  setPathUrlStrategy();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<UserBloc>(create: (_) => UserBloc()),
    BlocProvider<ThemeBloc>(create: (_) => ThemeBloc())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, BlocState>(
        builder: (_, state) => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: appThemeData[
                  state is ThemeState ? state.theme: AppTheme.Light],
              home: BlocBuilder<UserBloc, BlocState>(builder: (context, state) {
                if (state is Authenticated) return Dashboard();
                return Login(
                  state: state,
                );
              }),
            ));
  }
}
