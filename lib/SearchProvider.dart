import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier{
   TextEditingController searchController = TextEditingController();

   void getSearch (TextEditingController newSearch){
    newSearch =searchController;
  }

}