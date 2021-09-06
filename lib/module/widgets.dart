import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'extension.dart';
import 'package:rxdart/rxdart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:school_app/module/Theme.dart';

class MBloc<t>{
  BehaviorSubject<t> _bloc = BehaviorSubject<t>();
  Stream<t> get stream => _bloc.stream;
 t get value => _bloc.value;

 void setValue(t val) => _bloc.add(val);
}

enum ButtonType { Delete, Save, New, Cancel }

class MLabel extends StatelessWidget {
  final String title;
  final double? fontSize;
  final Color? color;
  final bool bold;
  const MLabel(this.title,
      {this.fontSize, this.color, this.bold = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${this.title}',
      style: TextStyle(
          color: this.color,
          fontSize: this.fontSize,
          fontWeight: this.bold ? FontWeight.bold : FontWeight.normal),
    );
  }
}

class MButton extends StatelessWidget {
  final String? title;
  final VoidCallback onTab;
  final ButtonType? type;
  final Icon? icon;
  final Color? color;
  final EdgeInsets? padding;

  const MButton(
      {this.title,
      this.type,
      required this.onTab,
      this.color,
      this.icon,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: this.onTab,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(this.color != null
                ? this.color
                : this.type == ButtonType.Save
                    ? Colors.green
                    : this.type == ButtonType.Cancel
                        ? Colors.deepOrangeAccent
                        : this.type == ButtonType.Delete
                            ? Colors.redAccent
                            : this.type == ButtonType.New
                                ? Colors.blue
                                : null),
            padding: MaterialStateProperty.all(this.padding?? EdgeInsets.all(22))),
        child: this.type != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                this.icon ?? Icon(
                  this.type == ButtonType.Save
                        ? Icons.save
                        : this.type == ButtonType.Cancel
                            ? Icons.cancel
                            : this.type == ButtonType.Delete
                                ? Icons.delete
                                : this.type == ButtonType.New
                                    ? Icons.add_box
                                    : Icons.help_center,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  this.title != null ?
                   this.title!.toLabel()
                 : this.type == ButtonType.Save
                      ? 'Save'.toLabel()
                      : this.type == ButtonType.Cancel
                          ? 'Cancel'.toLabel()
                          : this.type == ButtonType.Delete
                              ? 'Delete'.toLabel()
                              : this.type == ButtonType.New
                                  ? 'New'.toLabel()
                                  : '${this.title}'.toLabel()
                ],
              )
        :this.icon != null?
            Row(children: [
              this.icon!,
              SizedBox(width: 5,),
              '${this.title}'.toLabel(),
            ],)
            : '${this.title}'.toLabel()
    );
  }
}

class MEdit extends StatelessWidget {
  final String hint;
  final Function(String)? onChange;
  final bool autoFocus;
  final bool password;
  final bool notempty;
  final TextEditingController? controller;
  const MEdit(
      {required this.hint,
      this.onChange,
      this.autoFocus = false,
      this.password = false,
      this.notempty = false,
      this.controller,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), gapPadding: 20),
          labelText: this.hint,
          labelStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14)),
      obscureText: this.password,
      controller: this.controller,
      onChanged: this.onChange,
      validator: (val){
        if((val??'').isEmpty && this.notempty)
          return"can not be empty";

      },
    );
  }
}

class MTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? color;
  const MTextButton({required this.title,required this.onPressed,this.color,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      child: this.title.toLabel(color: this.color ),
    );
  }
}

class MSwitch extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  final String? hint;
  const MSwitch({required this.value, required this.onChanged, this.hint,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MBloc<bool> _value = MBloc<bool>()..setValue(this.value);
    return StreamBuilder<bool>(
        stream: _value.stream,
      builder: (_, snap){
        if(snap.hasData)
           this.hint !=null?
              Tooltip(
                  message: this.hint!,
                child: Switch(
                  value: snap.data!,
                  onChanged: (val){
                    this.onChanged(val);
                    _value.setValue(val);

                  },
                ),
              )
              :Switch(
            value: snap.data!,
            onChanged: (val) {
              this.onChanged(val);
              _value.setValue(val);
            });
           return Container();
      },


    );
  }
}


class MError extends StatelessWidget {
  final Exception exception;
  const MError( {required this.exception ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12)
      ),
      child: this.exception.toString().toLabel(color: Colors.white, bold: true),
    );
  }
}

class MWaiting extends StatelessWidget {
  const MWaiting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator().center;
  }
}


class MSideBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final int value;
  final bool selected;
  const MSideBarItem({required this.title, required this.icon, required this.onTap, this.value = 0, this.selected = false ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: this.selected,
      selectedTileColor: context.bottomAppBarColor,
      title: '$title'.toLabel(color: Colors.grey.shade500, fontSize: 13),
      leading: Icon(this.icon, size: 15, color: Colors.grey.shade500,),
      trailing: this.value>0 ? CircleAvatar(backgroundColor: Colors.pink, radius: 10, child: '3'.toLabel(fontSize: 10),): null,
      onTap: this.onTap,
    );
  }
}


class MDarkLightSwitch extends StatelessWidget {
  const MDarkLightSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
        onTap:()=> context.themeBloc.setTheme(context.isDark? AppTheme.Light: AppTheme.Dark),
        child: Container(
          width: 40,
          height: 25,
          child: Stack(
              children:[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 7),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: context.accentColor.withOpacity(0.5)
                  ),

                ),
                context.isDark?
                Container()
                    :Align(
                  alignment: Alignment.centerRight,
                  child: FaIcon(FontAwesomeIcons.sun, color: Colors.yellow.shade700 ,),
                ),
                context.isDark?
                Align(
                  alignment: Alignment.centerLeft,
                  child: FaIcon(FontAwesomeIcons.moon, color: Colors.blue.shade600,),
                )
                    :Container(),


              ]
          ),
        ));
  }
}
