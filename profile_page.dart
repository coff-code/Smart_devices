import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile_page extends StatefulWidget {
  const profile_page({super.key});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),),
      
      //body

      body:Stack(children:[ 
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color:Colors.black,
                child: Column(
                  children: [
                  SizedBox(height: 20,),
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/mypic.jpg"),
                  ),
                  SizedBox(height: 10,),
                  Text("Muhammad Safwan",style: TextStyle(color: Colors.white,fontSize: 26),)
                ],),
                )),
            Expanded(
              flex: 2,
              child: Container(color:Colors.grey[400],)),

          ],
        ),
        Container(
          decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.only(left: 30,right:30,top: 220,bottom: 120),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: profiledetaillists.length,
                  separatorBuilder: (context, index) =>Divider(
                    color: Colors.grey.shade400,
                  ) ,
                  itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(profiledetaillists[index].icon,size: 29,),
                    title: Text(profiledetaillists[index].name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                    trailing: Icon(Icons.arrow_forward),
                  );
                },),
              ),
              Divider(
                    color: Colors.grey.shade400,
                  ) ,
              ListTile(
                  leading: Icon(Icons.login,size: 29,color: Colors.red,),
                  title: Text("List project",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.red),),
                  trailing: Icon(Icons.arrow_forward,color: Colors.red,),
                ),
            ],
          ),
        )
        ]) ,
    );
  }
}

class profiledetails{
  var icon;
  String name;
  profiledetails(this.icon,this.name,);
}
 List profiledetaillists=[
  profiledetails(Icons.edit, "Edit profile name", ),
  profiledetails(Icons.menu, "List project", ),
  profiledetails(Icons.lock_open_outlined, "Change password" ),
  profiledetails(Icons.mail_outline, "Change email address", ),
  profiledetails(Icons.settings, "Settings", ),
  profiledetails(Icons.timelapse_sharp, "Preferences", ),



 ];