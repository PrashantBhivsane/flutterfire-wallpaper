import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';


class FullScreenImage extends StatelessWidget {

   String imgPath;
   String imgName;
   String imgAuthor;

  FullScreenImage(this.imgPath,this.imgName,this.imgAuthor);

  

  final LinearGradient backgroundGradient = LinearGradient(
    colors: [Colors.black,Colors.blueGrey],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  @override
  Widget build(BuildContext context) {
    if(this.imgName.contains('null'))
    {
      this.imgName = 'Untitled';
    }
    return Scaffold(
      
      body: SizedBox.expand
      (
      child: Column(
        children: <Widget>[

          

          Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: backgroundGradient
          ),
          child: Stack(
            children: <Widget>[

              
              Align(alignment: Alignment.center,child: Hero(tag:imgPath, child: new Image.network(imgPath, fit: BoxFit.cover,width: double.maxFinite,height: double.maxFinite,)
              
              ,)
              ,),

              
             Align(
               alignment: Alignment.bottomCenter,
               child: Container(
                 height: MediaQuery.of(context).size.width - 250,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: Colors.black54,
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))
                 ),
                 child: Column(
                 children: <Widget>[

                   
                   Padding(
                     padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                     
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         
                         Text(imgName,
                         style: TextStyle(fontFamily: 'Roboto', color: Colors.white,letterSpacing: 0,fontSize: 20.0),)
                                         
                       ],
                          ),
                     
                   ),
                   
                   Row (
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                     
                     Padding(
                       padding: EdgeInsets.all(2.0),
                       
                     ),

                     IconButton(
                       icon: Icon(Icons.image,color: Colors.white),
                       iconSize: 30,
                       onPressed: null,
                     ),
                     IconButton(
                       icon: Icon(Icons.open_in_new,color: Colors.white),
                       iconSize: 30,
                       onPressed: null,
                     )
                     ,
                     IconButton(
                       icon: Icon(Icons.file_download, color: Colors.white),
                       iconSize: 30,
                       onPressed: ()
                       {

                       },
                     ),

                     
                   ],),

                 ],
                 ),
                 ),
             ),

            

             Align(
             alignment: Alignment.topCenter,
             child: new Column(
             mainAxisAlignment: MainAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
             Padding(
               padding: EdgeInsets.all(20.0),
             ),
             FloatingActionButton(
             heroTag: "btn1",
             elevation: 5.0,
             mini: true,
             onPressed: () =>Navigator.of(context).pop(),
             tooltip: 'Close',
             child: Icon(Icons.close, color: Colors.white,),
             backgroundColor: Colors.black,
           ),
             
         ],
       ),
     ),
     
      Positioned(
               bottom: 80,
               right: 20,
               child: FloatingActionButton(
                heroTag: "btn2",
                elevation: 5.0,
                onPressed: null,
                tooltip: 'Set Wallpaper',
                backgroundColor: Colors.black,
                child: Icon(Icons.format_paint, color: Colors.white,),
              ),
             ),

      ],
          ),
          
        ),
        
        ],
        ),
        
      )
      
    );
  }
}