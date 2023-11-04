import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/MyThemeData.dart';
typedef OnMenuItemClick = void Function(MenuItem clickedItem);
class DrawerWidget extends StatelessWidget {
    OnMenuItemClick onMenuItemClick;

  DrawerWidget(this.onMenuItemClick);
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Container(
          color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(

              alignment: Alignment.center,
              color:MyThemeData.primaryColor,
              padding: EdgeInsets.symmetric(vertical: 46),
              child: Text('News',style: TextStyle(
                color: Colors.white,fontWeight: FontWeight.w800,fontSize: 24
              ),),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.categories);
              },
              child: Row (
                children: [
                  Icon(Icons.list,color: MyThemeData.primaryColor,size: 30,),
                  SizedBox(width: 5,),

                  Text('Categories',style: TextStyle(
                      fontSize: 18
                  ),),
                ],
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                onMenuItemClick(MenuItem.settings);
              },
              child: Row(
                children: [
                  Icon(Icons.settings,color: MyThemeData.primaryColor,size: 30,),
                  SizedBox(width: 5,),
                  Text('Settings',style: TextStyle(
                    fontSize: 18
                  ),),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

enum MenuItem {
categories,
  settings
}
