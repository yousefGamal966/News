import 'package:flutter/material.dart';
import 'package:news/SearchProvider.dart';
import 'package:news/ui/home/DrawerWidget.dart';
import 'package:news/ui/home/categories/CategoriesWidget.dart';
import 'package:news/ui/home/categories/Category.dart';
import 'package:news/ui/home/categories/categoryDetails/CategoryDetails.dart';
import 'package:news/ui/home/settings/SettingsWidget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool search = false;
  TextEditingController searchController = TextEditingController();
 @override
  void initState() {
    super.initState();
    selectedWidget = CategoriesWidget(onCategoryItemClick);
  }
  @override
  Widget build(BuildContext context) {
   var searchProvider = Provider.of<SearchProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: AssetImage('assets/images/background_pattern.png'),
            fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar:!search? AppBar(
          actions: [
            IconButton(onPressed: (){
              search = !search;
              setState(() {

              });
            }, icon: Icon(Icons.search)),SizedBox(width: 20,)
          ],
          title: Text('News'),
        ):
            AppBar(
              toolbarHeight: 70,
              centerTitle: true,
              title: TextField(
                controller: searchProvider.searchController,
                onChanged: (value){
                  setState(() {

                      });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5,horizontal: 10
                  ),
                  prefixIconColor: Colors.green,
                  suffixIconColor: Colors.green,
                  focusColor: Colors.green,
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: Colors.transparent,width: 0)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent,width:0 )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)
                    ),
                    borderSide: BorderSide(
                      color: Colors.transparent,width: 0
                    )
                  ),
                  hintText: 'Search',
                  prefixIcon:IconButton(onPressed: (){
                    search = !search;

                        setState(() {


                    });
                  },icon: Icon(Icons.close)) ,
                  suffixIcon:IconButton(onPressed: (){
                    setState(() {

                    });
                  },icon: Icon(Icons.search)),
                ),


              ),

            ),
        drawer: DrawerWidget(onMenuItemClick),
        body:selectedWidget
      ),
    );
  }

 late  Widget selectedWidget;

  void onMenuItemClick (MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.categories :{
        selectedWidget = CategoriesWidget(onCategoryItemClick);
      }
      case MenuItem.settings : {
        selectedWidget = SettingsWidget();
      }
    }
    setState(() {

    });
  }
  void onCategoryItemClick (Category category){
    selectedWidget  = CategoryDetails(category);
    setState(() {});
  }
}
