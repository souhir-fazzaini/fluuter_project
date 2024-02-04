import 'package:flutter/material.dart';
import 'package:flutter_app/favoriteChageNotifier.dart';
import 'package:flutter_app/favoritewidget.dart';
import 'package:flutter_app/receip.dart';
import 'package:provider/provider.dart';
class Receip_screen extends StatelessWidget {
final Receip receip;
Receip_screen({required this.receip});

  @override
  Widget build(BuildContext context) {
    Widget titleSection=Container(
      padding:const EdgeInsets.all(8) ,
      child:Row(
        children: [
          Expanded(
            child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(receip.title,style:TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Text(receip.user,style:TextStyle (color:Colors.grey[500],fontSize: 16)),
                ]

            ),
          ),
          FavoriteIconWidget(),
          FavoriteTextWidget()        ],

      ),
    );
    Widget buttonSection=Container(
      padding:const EdgeInsets.only(bottom: 8),
      child:       Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildbuttonColumn(Colors.cyan, Icons.comment, "Comment"),
          _buildbuttonColumn(Colors.cyan, Icons.share, "Share"),

        ],
      ),
    );
    Widget descripttionSection = Container(
        padding:const EdgeInsets.only(bottom: 8),
        child:Text(receip.description,softWrap: true,)

    );

    return ChangeNotifierProvider(
      create: (context) => FavoriteChageNotifier(receip),
      child: Scaffold(
        appBar: AppBar(
          title:  Text('Mes recettes'),
        ),
        body: Column(children:[
          Stack(
            children: [
              Container(
                width: 600,
                height: 240,
                child: Center(child:CircularProgressIndicator()),
              ),
              Hero(
                tag:"child"+receip.title,
                child: FadeInImage.assetNetwork(
                  placeholder: 'images/loading.gif',
                  image:receip.imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
      
          titleSection,
          buttonSection,
          descripttionSection
        ]
        ),
      ),
    );
  }
  Column _buildbuttonColumn(Color color, IconData icon, String label)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding:const EdgeInsets.only(bottom: 8),
            child:Icon(icon,color: color)),
        Text(label,
          style:TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: color),

        )

      ],
    );
  }

}
