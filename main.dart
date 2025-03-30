import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_home_ui/profile_page.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Smart_devices(),
    );
  }
}
class Smart_devices extends StatefulWidget {
  const Smart_devices({super.key});

  @override
  State<Smart_devices> createState() => _Smart_devicesState();
}

class _Smart_devicesState extends State<Smart_devices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      //AppBar

      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: Colors.grey[300],
        leading: Icon(Icons.grid_view_rounded,color: Colors.black,size: 30,),
      actions: [IconButton(
        onPressed: (){
          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,childBuilder: (context) => profile_page(),));
        },
        icon: Icon(Icons.person,color: Colors.black,size: 30,)),SizedBox(width: 20,)],
      ),

      //Body

      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome,",style: TextStyle(fontSize: 20),),
          Text("MUHAMMAD SAFWAN",style: TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
          SizedBox(height: 40,),
          Divider(
            color: Colors.grey[400],
            thickness: 2,
          ),
          SizedBox(height:20,),

          Text("Smart Devices",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
         Expanded(

          //GridView

           child: GridView.builder(
          
            itemCount: itemLists.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1/1.4,
              crossAxisCount: 2), itemBuilder: (context, index) {
             return Container(
              
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
              
              color:itemLists[index].value?Colors.black: Colors.grey[200]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Icon(itemLists[index].icon,size: 70,color:itemLists[index].value?Colors.white:Colors.black ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Text(itemLists[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color:itemLists[index].value?Colors.white:Colors.black ,),),
                  RotatedBox(
                    quarterTurns: 1,
                    child: CupertinoSwitch(
                      
                      value: itemLists[index].value, onChanged: (value) {
                      setState(() {
                        itemLists[index].value=!itemLists[index].value;
                      });
                      
                    },),
                  )
                ],)
              ],),
            
             );
           },),
         )
          
        ],
      ),),
      
    );
  }
}
class items{
  var icon;
  String name;
  bool value=false;
  items(this.icon,this.name,this.value);
}
List itemLists=[
  items(Icons.light, "Smart\nLight", false),
  items(Icons.access_time_outlined, "Smart\nClock", false),
  items(Icons.tv_rounded, "Smart\nTV", false),
  items(Icons.phone_android_rounded, "Smart\nPhone", false), 
  items(Icons.camera_alt_outlined, "Smart\nCamera", false),
  items(Icons.photo_camera_back_outlined, "Photo", false)
];
