import 'package:flutter/material.dart';
import 'package:school_app/module/extension.dart';
import 'package:school_app/module/widgets.dart';

class SideBar extends StatelessWidget {
  final Function(int) onChanged;
  final int selectidx;
  const SideBar({required this.onChanged , required this.selectidx ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: context.width * 0.4 >250 ? 250 : context.width * 0.4,
      child: Column(
            children: [
              SizedBox(height: 35,),
              'School'.toLabel(fontSize: 22, color: Colors.grey.shade600, bold: true),
              SizedBox(height: 75,),
              MSideBarItem(

               title: 'Dashboard',
                icon: Icons.dashboard,
                selected: this.selectidx == 1,
                onTap: () => this.onChanged(1) ,
              ),

              MSideBarItem(

                title: 'Message',
                icon: Icons.dashboard,
                value: 3,
                selected: this.selectidx == 2,
                onTap: () => this.onChanged(2) ,
              ),

            //  MSideBarItem(

            //    title: 'Teacher',
            //    icon: Icons.person,
           //     selected: this.selectidx == 3,
           //     onTap: () => this.onChanged(3),
          //    ),
          //    MSideBarItem(

           //     title: 'Students',
           //     icon: Icons.people,
           //     selected: this.selectidx == 4,
         //       onTap: () => this.onChanged(4) ,
        //      ),
        //      MSideBarItem(

         //       title: 'Classes',
         //       icon: Icons.home_outlined,
          //      selected: this.selectidx == 5,
        //        onTap: () => this.onChanged(5) ,
         //     ),
              SizedBox(height: 50,),

              MSideBarItem(

                title: 'Settings',
                icon: Icons.settings,
                selected: this.selectidx == 6,
                onTap: () =>this.onChanged(6) ,
              ),
            ],
          )

    );
  }
}
