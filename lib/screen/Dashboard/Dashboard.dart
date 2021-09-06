import 'package:flutter/material.dart';
import 'package:school_app/module/Theme.dart';
import 'package:school_app/screen/Teachers/Teachers.dart';
import '../../module/extension.dart';
import 'package:school_app/module/widgets.dart';
import 'package:school_app/screen/Dashboard/SideBar.dart';
import 'package:school_app/screen/Dashboard/UserInfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

MBloc<int> _menu = MBloc<int>()..setValue(1);
MBloc<int> _dashmenu = MBloc<int>()..setValue(1);
MBloc<int> _dashhover = MBloc<int>()..setValue(0);

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder<int>(
              stream: _menu.stream,
              builder: (context, snap) {
                if (!snap.hasData) return MWaiting();
                return Row(
                  children: [
                    SideBar(
                      selectidx: _menu.value,
                      onChanged: (val) => _menu.setValue(val),
                    ),
                    Container(
                      child: snap.data == 1
                          ? DashboardContent()
                          : 'some thing else '.toLabel().center,
                    ).expand,
                    UserInfo(),
                  ],
                );
              })),
    );
  }
}

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _dashmenu.stream,
        builder: (context, snap) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 300,
                    child: MEdit(
                      hint: 'search...',
                    ),
                  ).padding9,
                  MDarkLightSwitch()


                ],
              ),
              SizedBox(
                height: 35,
              ),
//top menu
              Row(

                children: [
                  GestureDetector(
                    onTap: () => _dashmenu.setValue(1),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: (snap.data ?? 0) == 1
                                      ? Colors.green.shade500
                                      : Colors.grey,
                                  width: 1))),
                      padding: EdgeInsets.only(bottom: 15),
                      child: 'Teacher'
                          .toLabel(
                              color: (snap.data ?? 0) == 1
                                  ? Colors.green.shade500
                                  : Colors.grey)
                          .center,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _dashmenu.setValue(2),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: (snap.data ?? 0) == 2
                                      ? Colors.green.shade500
                                      : Colors.grey,
                                  width: 1))),
                      padding: EdgeInsets.only(bottom: 15),
                      child: 'Students'
                          .toLabel(
                              color: (snap.data ?? 0) == 2
                                  ? Colors.green.shade500
                                  : Colors.grey)
                          .center,
                    ),
                  ),
                  GestureDetector(
                      onTap: () => _dashmenu.setValue(3),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: (snap.data ?? 0) == 3
                                        ? Colors.green.shade500
                                        : Colors.grey,
                                    width: 1))),
                        padding: EdgeInsets.only(bottom: 15),
                        child: 'Class'
                            .toLabel(
                                color: (snap.data ?? 0) == 3
                                    ? Colors.green.shade500
                                    : Colors.grey)
                            .center,
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 1))),
                    padding: EdgeInsets.only(bottom: 15),
                    child: ''.toLabel(),
                  ).expand,
                ],
              ),
              (snap.data ?? 0) == 1 ? Teachers().expand : 'others'.toLabel().center,
            ],
          ).padding9.margin9;
        });
  }
}
