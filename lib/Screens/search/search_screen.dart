import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/component/component.dart';
import '../../ViewModal/search_view_model/search_cubit.dart';
import '../../ViewModal/search_view_model/search_states.dart';



class SearchScreen  extends StatelessWidget {

  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context){
    return BlocConsumer<SearchCubit,SearchStates> (
      listener: (context,state){},
      builder: (context,state){
        var list =SearchCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: buildsearchfield(
                    circle:10.0 ,
                    controller:searchController ,
                    lable:'Search',
                    prefix:Icons.search ,
                    type:TextInputType.text,
                    onchange: (value){
                      SearchCubit.get(context);
                    }
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
