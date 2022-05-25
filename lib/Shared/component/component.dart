import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildchatitem()=>Row(
    children: [
      Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:[
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage('https://img.freepik.com/free-photo/close-up-shot-pretty-woman-with-perfect-teeth-dark-clean-skin-having-rest-indoors-smiling-happily-after-received-good-positive-news_273609-1248.jpg?t=st=1652005087~exp=1652005687~hmac=08c8b3a5d1dbc0dedf0415363cf52cf7be32e9ce28b10e73f202ca50b7472ade&w=1060'),

            ),

            Padding(
              padding: EdgeInsetsDirectional.only(bottom:3.0,end:3.0 ,),
              child: CircleAvatar(
                radius:7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ] ),
      SizedBox(width:20.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mohamed Essam',maxLines:1 ,
              overflow:TextOverflow.ellipsis,
              style: TextStyle(fontSize:16.0,fontWeight:FontWeight.bold),
            ),
            SizedBox(height: 5.0,),
            Row(
              children: [
                Expanded(child: Text('hey how are you ?!!',maxLines: 2,
                  overflow:TextOverflow.ellipsis,)
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Container(
                    width:7.0 ,
                    height: 7.0,
                    decoration:BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ) ,
                  ),
                ),
                Text('2:00PM'),
              ],
            )
          ],
        ),
      )

    ]

);

Widget buildcontactitem()=>Container(
  width:70.0,
  child: Column(
    children: [
      Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:[
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage('https://img.freepik.com/free-photo/close-up-shot-positive-young-woman-with-curly-bushy-hair-smiles-happily-concentrated-away-keeps-hand-chest-wears-transparent-eyeglasses-pink-formal-jacket-isolated-blue-background_273609-61020.jpg?w=1060'),

            ),

            Padding(
              padding: EdgeInsetsDirectional.only(bottom:3.0,end:3.0 ,),
              child: CircleAvatar(
                radius:7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ] ),
      SizedBox(
        height:6.0,
      ),
      Text('Mohamed Essam moniem',maxLines: 2,overflow: TextOverflow.ellipsis,),
    ],
  ),
);

Widget buildcallitem()=>Row(
    children: [
      Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children:[
            CircleAvatar(
              radius: 35.0,
              backgroundImage: NetworkImage('https://img.freepik.com/free-photo/close-up-shot-pretty-woman-with-perfect-teeth-dark-clean-skin-having-rest-indoors-smiling-happily-after-received-good-positive-news_273609-1248.jpg?t=st=1652005087~exp=1652005687~hmac=08c8b3a5d1dbc0dedf0415363cf52cf7be32e9ce28b10e73f202ca50b7472ade&w=1060'),

            ),

            Padding(
              padding: EdgeInsetsDirectional.only(bottom:3.0,end:3.0 ,),
              child: CircleAvatar(
                radius:7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ] ),
      SizedBox(width:20.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mohamed Essam',maxLines:1 ,
              overflow:TextOverflow.ellipsis,
              style: TextStyle(fontSize:16.0,fontWeight:FontWeight.bold),
            ),
            SizedBox(height: 5.0,),
            Row(
              children: [
                Expanded(child: Text('hey how are you ?!!',maxLines: 2,
                  overflow:TextOverflow.ellipsis,)
                ),

              ],
            ),
          ],
        ),
      ),
      IconButton(onPressed: (){}, icon: Icon(Icons.video_call,color:Colors.blue,)),
    ]

);

Widget buildsearchfield(
    {
      required TextEditingController controller,
      required TextInputType type ,
      required String lable,
      required IconData prefix,
      required double circle,
      required dynamic onchange,
    }

    )=> TextFormField(

    keyboardType:type,
    controller: controller,
    validator: (value){

      if (value!.isEmpty)
      {
        return 'Search Must Not Be Empty';
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: lable,
      prefixIcon:Icon(
        prefix,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(circle),
      ),

    ),
    onFieldSubmitted: (value){
      print(value);
    },
    onChanged:onchange
);

void navigateTo( context, widget)=> Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=>widget,
  ),
);