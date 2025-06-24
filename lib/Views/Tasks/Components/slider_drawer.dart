import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/Utils/color.dart';

class Slider_Drawer extends StatelessWidget{
  Slider_Drawer({super.key});

  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

  final List<String> titles = [
    "Home",
    "Profile",
    "Settings",
    "Details"
  ];
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors:AppColors.primaryGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: Column(
        children: [
          const CircleAvatar(backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.lAooKJdascE4RWrhKE8AEwHaNK?w=115&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3"),radius: 50,),
          const SizedBox(height: 20,),
          Text("Akash Kumar Verma",style:textTheme.headlineSmall!.copyWith(color: Colors.white),),
          const SizedBox(height: 2,),
          Text("akvakv150@gmail.com",style:textTheme.bodyMedium!.copyWith(color: Colors.white.withOpacity(0.4)),),
          const SizedBox(height: 50,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
            width: double.infinity,
            height: 250,
            child: ListView.builder(
              itemCount: icons.length,
              itemBuilder: (BuildContext context,int index){
                return InkWell(
                  onTap: (){
                    log('${titles[index]} button clicked');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: ListTile(
                      leading: Icon(icons[index],color: Colors.white,size: 25),
                      title: Text(titles[index], style: TextStyle(color: Colors.white))
                    ),
                  ),
                );
              }
            )
          )
        ],
      )
    );
  }
}