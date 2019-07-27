import 'dart:ui';
import 'package:test_one/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/widgets.dart' as prefix1;

class Category extends StatelessWidget {

  var gridCount = 2;

  final List<String> _category = [
    'Minimal',
    'Vector Art',
    'Earth',
    'Ocean',
    'Animals',
    'Amoled',
    'Cartoon',
    'Games'
  ];
  final List<String> _categoryImage = [
    'http://ilovepapers.com/wp-content/uploads/papers.co-ar13-minimal-sunset-art-illustration-dark-blue-6-wallpaper.jpg',
    'https://image.freepik.com/free-vector/abstract-dynamic-pattern-wallpaper-vector_53876-43459.jpg',
    'http://www.thelawofattraction.com/wp-content/uploads/law-of-polarity.png',
    'https://i.pinimg.com/originals/00/aa/e7/00aae7cd6cbae92d0f5d00baab3fe289.jpg',
    'https://wallpapershome.com/images/pages/pic_h/14878.jpg',
    'https://i.imgur.com/ESKcgyA.png',
    'https://wallpapercave.com/wp/upmtCfm.jpg',
    'https://cdna.artstation.com/p/assets/images/images/014/747/546/large/jarvis-xciv-16x9-siege00.jpg'
  ];
  @override
  Widget build(BuildContext context) {


    var _width = MediaQuery.of(context).size.width / 2;

    return Container(
        
        color: Color(0xff212121),

        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Column(
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(2.0)
                  )
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: _category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridCount),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Stack(
                      alignment: Alignment.bottomCenter,

                      children: <Widget>[
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                           child: Container(
                           width: _width ,
                            height: _width - 10,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),

                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading.gif',
                                image: _categoryImage[index],
                                fit: BoxFit.cover,

                              ),

                            ),

                          ),
                        ),
                        Card(
                          elevation: 0.001,
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.0),bottomLeft: Radius.circular(8.0))
                          ),
                          child: Container(
                            width: _width, height: 38,
                              padding: const EdgeInsets.all(10.0),
                            child: Text(_category[index],
                            textAlign: TextAlign.center,
                              style: new TextStyle(color: Colors.white,fontSize:18, fontFamily: 'Bebas',letterSpacing: 2.5)
                            )

                          ),
                        ),
                      ],
                    ),

                  );
                },
              ),
            ],
          ),
        ));

  }
}