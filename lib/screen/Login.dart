import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:school_app/module/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_app/Bloc/UserBloc.dart';
import 'package:flutter/material.dart';
import 'package:school_app/Bloc/BlocState.dart';
import 'package:school_app/module/widgets.dart';

TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();
final _formKey = GlobalKey<FormState>();
bool _remember = false;

class Login extends StatelessWidget {
  final BlocState state;
  const Login({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          width: context.width * 0.3 < 350 ? 350 : context.width * 0.3,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                'Well Come to School test'
                    .toLabel(bold: true, color: Colors.grey, fontSize: 22)
                    .margin9,
                MEdit(
                  hint: 'UserName',
                  controller: _mobile,
                  notempty: true,
                ).margin9,
                MEdit(
                  hint: 'Password',
                  password: true,
                  controller: _pass,
                  notempty: true,
                ).margin9,
                AbsorbPointer(
                  absorbing: state is Loading,
                  child: Column(children: [



                    Row(
                      children: [
                       MSwitch(
                           value: _remember,
                           hint: 'Remember me',
                            onChanged: (val) => _remember = val),
                      ],
                    ),
                    'Remember me'.toLabel(),
                    Row (
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [MTextButton(title: 'register', onPressed: () {})]),
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      MButton(
                          title: 'Login',
                          icon: Icon(
                            Icons.vpn_key,
                            size: 15,
                          ),
                          color: Colors.green,
                          onTab: () {
                            if (_formKey.currentState!.validate())
                              context.userBloc.authenticate(
                                  _mobile.text, _pass.text, _remember);
                          }).margin9,
                      state is Loading ? MWaiting() : Container(),
                      Spacer(),
                      MTextButton(
                          title: 'forget my password', onPressed: () {}),
                    ]),
                  ]),
                ),
                state is Failed
                    ? MError(
                        exception: (state as Failed).exception,
                      )
                    : Container()
              ],
            ),
          ),
        ).padding9.card.center,
      ),
    );
  }
}
