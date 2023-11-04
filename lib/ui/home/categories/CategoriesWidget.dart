import 'package:flutter/material.dart';
import 'package:news/ui/home/categories/Category.dart';
import 'package:news/ui/home/categories/CategoryItem.dart';
typedef OnCategoryClick = void Function (Category category);
class CategoriesWidget extends StatelessWidget {

  List<Category> categories = Category.getAllCategories();
  OnCategoryClick onCategoryClick;
  CategoriesWidget(this.onCategoryClick);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

           Text('''Pick Your Category 
          Of Interest''',style: TextStyle(
             fontSize: 22,fontWeight: FontWeight.w800,color: Colors.black87
           ),),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:5,
              mainAxisSpacing:20
            ) ,
                itemBuilder:(context, index) => InkWell(
                    onTap: (){
                  onCategoryClick(categories[index]);
                    },
                    child: CategoryItem(categories[index], index)),
                itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
