import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di/di.dart';


import 'package:news/ui/home/categories/Category.dart';
import 'package:news/ui/home/categories/categoryDetails/CategoryDetailsViewModel.dart';
import 'package:news/ui/home/categories/categoryDetails/SourcesTabsWidget.dart';
import 'package:provider/provider.dart';



class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails(this.category);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  var viewModel = getIt.get<CategoryDetailsViewModel>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<CategoryDetailsViewModel,CategoryDetailsState>(
      bloc: viewModel,
      builder: (context, state) {
        switch(state){
          case SuccessState():{
            var sourcesList = state.sourcesList;
            return SourcesTabWidget(sourcesList!);
          }
          case LoadingState():{
            return Center(child: Column(
              children: [
                Text(state.message),
                CircularProgressIndicator(),
              ],
            ));
          }
          case ErrorState():{
        return Column(
                  children: [
                    Text(state.errorMessage),
                    ElevatedButton(onPressed: (){
                      viewModel.loadSources(widget.category.id);
                    }, child: Text('Try Again'))
                  ],
                );
          }
        }


    },);
  //     ChangeNotifierProvider(create: (context) => viewModel,
  //     child: Consumer<CategoryDetailsViewModel>(builder: (context, viewModel, child) {
  //       if(viewModel.showLoading == true){
  //         return Center(child: CircularProgressIndicator());
  //       }
  //       else if (viewModel.errorMessage!=null ){
  //         return Column(
  //           children: [
  //             Text(viewModel.errorMessage??''),
  //             ElevatedButton(onPressed: (){
  //               viewModel.getSources(widget.category.id??"");
  //             }, child: Text('Try Again'))
  //           ],
  //         );
  //       }
  //       var sourcesList = viewModel.newsSourcesList;
  //       return SourcesTabWidget(sourcesList!);
  //     },
  //
  //
  // ),
  //   );
    //   FutureBuilder(
    //   future: ApiManager.getSources(category.id), builder: (context, snapshot) {
    //   if(snapshot.connectionState == ConnectionState.waiting){
    //     return Center(child: CircularProgressIndicator(),);
    //   }
    //   else if(snapshot.hasError || snapshot.data?.status == 'error'){
    //     return Center(
    //       child: Column(
    //         children: [
    //           Text(snapshot.data?.message??snapshot.error.toString()),
    //         ElevatedButton(onPressed: (){}, child: Text('Try Again'))
    //         ],
    //       ),
    //     );
    //   }

    //
    // },);
  }
}
