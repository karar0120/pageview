import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../Shared/component/component.dart';


class ChatScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:20.0,
                  ),
                  //contact list
                  Container(
                    height:108.0,
                    child: ListView.separated(
                      scrollDirection:Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      separatorBuilder:(context,index)=>SizedBox(
                        width:20.0 ,
                      ),
                      itemBuilder:(context,index)=>buildcontactitem()
                      ,itemCount:7,
                    ),
                  ),
                  //space
                  SizedBox(
                    height:20.0,
                  ),
                  //chat list
                  ListView.separated(
                      shrinkWrap:true,
                      physics:BouncingScrollPhysics(),
                      itemBuilder:(context,index)=>buildchatitem(),
                      separatorBuilder: (context,index)=>SizedBox(
                        height:20.0 ,
                      ),
                      itemCount: 15
                  ),
                ]
            ),
          ),
        );

  }

}
