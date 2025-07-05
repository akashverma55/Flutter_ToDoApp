import 'package:flutter/material.dart';
import 'home_appbar.dart';


class drawer extends StatelessWidget {
  const drawer({
    super.key,
    required this.icons,
    required this.titles,
  });

  final List<IconData> icons;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade900,
              Colors.blueAccent.shade100
            ]
          )
        ),
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/pic.jpg"),
            ),
            SizedBox(height: 20,),
            Text("Akash Kumar Verma",style: TextStyle(color: Colors.white,fontSize: 20)),
            Text("akashverma@gmail.com",style: TextStyle(color: Colors.white,fontSize: 14)),
            SizedBox(height: 20),
            divider(),
            Container(
              width: double.infinity,
              height: 300,
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: icons.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      print(titles[index]+' Item Pressed!');
                    },
                    child: ListTile(
                      leading: Icon(icons[index],color: Colors.lightBlueAccent,size: 30,),
                      title: Text(titles[index],style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                  );
                },
              ),
            )
          ]
        ),
      ),
    );
  }
}






