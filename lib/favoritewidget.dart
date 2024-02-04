import 'package:flutter/material.dart';
import 'package:flutter_app/favoriteChageNotifier.dart';
import 'package:provider/provider.dart';
class FavoriteIconWidget extends StatefulWidget {
  @override
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  bool isFavorited=false;

  void _toggleFavorite(FavoriteChageNotifier _notifier){
    setState(() {
      if (isFavorited) {
        isFavorited = false;
      } else {
        isFavorited = true;
      }

      _notifier.isFavorited = isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteChageNotifier _notifier = Provider.of<FavoriteChageNotifier>(context);
    isFavorited= _notifier.isFavorited;
    return Row(
      children: [
        IconButton(
          icon: isFavorited
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed:()=> _toggleFavorite(_notifier),
        ),
      ],
    );
  }
}

class FavoriteTextWidget extends StatefulWidget {

  @override
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteChageNotifier>(
      builder: (context, notifier, _) => Text(notifier.favoriteCount.toString()),
    );
  }
}
