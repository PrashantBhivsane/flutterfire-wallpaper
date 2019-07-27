import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_one/pages/fullscreen.dart';


class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {

  StreamSubscription<QuerySnapshot> subscription;
  List <DocumentSnapshot> wallpapersList;

  final CollectionReference collectionReference = Firestore.instance.collection("abstract");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = collectionReference.snapshots().listen((dataSnapshot) {

      setState(() {
        wallpapersList = dataSnapshot.documents;
         
      });
    });
  }

@override
  void dispose() {
    // TODO: implement dispose
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: wallpapersList != null
      ? new StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 4,
        itemCount: wallpapersList.length,
        itemBuilder: (context,i)
        {
          String imgPath = wallpapersList[i].data['url'];
          String imgName = wallpapersList[i].data['name'];
           String imgAuthor= wallpapersList[i].data['author'];

         
          
         
          
          return new Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            child: new InkWell(
                onTap: () => Navigator.push
                (
                  context,
                  new MaterialPageRoute(
                builder: (context) => 
                new FullScreenImage(imgPath,imgName.toString(),imgAuthor.toString()))),
              child: new Hero(
                tag: imgPath,
                child: FadeInImage(
                  image: NetworkImage(imgPath),
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/loading.gif'),
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (i) => StaggeredTile.count(2, i.isEven?2:3),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
      ): new Center(child: CircularProgressIndicator())
    );
  }
}
